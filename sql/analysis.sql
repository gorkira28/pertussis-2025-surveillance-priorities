-- Pertussis Surveillance Priorities, 2025
-- DuckDB 1.4+; run from the repository root.

CREATE OR REPLACE TABLE pertussis_2025 AS
SELECT
    jurisdiction::VARCHAR AS jurisdiction,
    incidence_per_100k::DOUBLE AS incidence_per_100k,
    cases::INTEGER AS cases,
    data_status::VARCHAR AS data_status,
    source_year::INTEGER AS source_year
FROM read_csv_auto(
    'data/raw/pertussis_2025_cdc_provisional.csv',
    header = TRUE,
    all_varchar = FALSE
);

-- Hard-fail validations. scalar() turns each QA query into a single value.
SELECT CASE WHEN count(*) = 52 THEN 1 ELSE error('Expected 52 jurisdiction rows') END
FROM pertussis_2025;

SELECT CASE WHEN count(*) = count(DISTINCT jurisdiction)
    THEN 1 ELSE error('Duplicate jurisdiction detected') END
FROM pertussis_2025;

SELECT CASE WHEN sum(cases) = 28783 THEN 1
    ELSE error('Jurisdiction cases do not reconcile to CDC total') END
FROM pertussis_2025;

SELECT CASE WHEN count(*) FILTER (
        WHERE cases < 0 OR incidence_per_100k < 0 OR jurisdiction IS NULL
    ) = 0 THEN 1 ELSE error('Missing or out-of-range values detected') END
FROM pertussis_2025;

CREATE OR REPLACE VIEW jurisdiction_priorities AS
SELECT
    jurisdiction,
    incidence_per_100k,
    cases,
    round(100.0 * cases / sum(cases) OVER (), 2) AS share_of_us_cases_pct,
    dense_rank() OVER (ORDER BY incidence_per_100k DESC) AS incidence_rank,
    dense_rank() OVER (ORDER BY cases DESC) AS case_rank,
    incidence_per_100k >= 20 AS high_incidence_flag,
    cases >= 1000 AS high_burden_flag,
    CASE
        WHEN incidence_per_100k >= 20 AND cases >= 1000 THEN 'High rate + high burden'
        WHEN incidence_per_100k >= 20 THEN 'High rate'
        WHEN cases >= 1000 THEN 'High burden'
        ELSE 'Monitor'
    END AS planning_segment
FROM pertussis_2025;

COPY (
    SELECT incidence_rank AS rank, jurisdiction, incidence_per_100k, cases
    FROM jurisdiction_priorities
    ORDER BY incidence_rank, jurisdiction
    LIMIT 10
) TO 'outputs/tables/top_incidence_jurisdictions.csv' (HEADER, DELIMITER ',');

COPY (
    SELECT case_rank AS rank, jurisdiction, cases, incidence_per_100k,
           share_of_us_cases_pct
    FROM jurisdiction_priorities
    ORDER BY case_rank, jurisdiction
    LIMIT 10
) TO 'outputs/tables/top_case_burden_jurisdictions.csv' (HEADER, DELIMITER ',');

SELECT planning_segment, count(*) AS jurisdictions, sum(cases) AS cases
FROM jurisdiction_priorities
GROUP BY planning_segment
ORDER BY cases DESC;
