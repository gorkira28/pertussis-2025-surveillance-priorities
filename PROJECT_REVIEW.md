# Review packet

## Key findings

- 52 jurisdiction rows reconcile exactly to the CDC national total of 28,783 cases.
- Oregon had the highest incidence: 36.51 per 100,000.
- Washington had the most cases: 2,127, or 7.39% of the national total.
- Five jurisdictions had incidence at or above 20 per 100,000.
- Texas was second by count but below the national incidence, showing why workload and population-adjusted intensity should be presented together.

## Validation performed

- Exact row count: 52.
- Duplicate jurisdiction count: 0.
- Negative case and incidence values: 0.
- Jurisdiction case sum: 28,783, matching the CDC report.
- Ranked tables were independently recalculated from the transcribed source values.
- All claims are descriptive; no causal or vaccine-effectiveness claims are made.

## Files created

- `README.md`
- `CITATION.cff`
- `LICENSE`
- `environment.yml`
- `.gitignore`
- `data/raw/pertussis_2025_cdc_provisional.csv`
- `sql/analysis.sql`
- `qgis/README.md`
- `qgis/state_incidence_join.csv`
- `docs/data_dictionary.md`
- `docs/portfolio_case_study.md`
- `docs/linkedin_post_draft.md`
- `outputs/tables/top_incidence_jurisdictions.csv`
- `outputs/tables/top_case_burden_jurisdictions.csv`
- `outputs/tables/qa_checks.csv`
- `outputs/figures/pertussis_surveillance_dashboard.svg`

## Unresolved limitations

- The source report is provisional and will be revised.
- The DuckDB program is written against documented DuckDB 1.4 syntax but could not be executed in this environment during the scheduled run.
- A final QGIS-rendered choropleth requires desktop QGIS; the repository includes the validated join file and exact mapping instructions.
- New York State excludes the separately reported New York City jurisdiction in the state join. The limitation is labeled rather than hidden.

## Proposed GitHub metadata

- Repository: `pertussis-2025-surveillance-priorities`
- Description: `CDC pertussis surveillance analysis separating incidence from case burden with DuckDB SQL and QGIS.`
- Topics: `pertussis`, `infectious-disease`, `epidemiology`, `public-health`, `surveillance`, `duckdb`, `sql`, `qgis`, `data-quality`, `data-visualization`
- Pin recommendation: replace neither existing project automatically; consider pinning this project when a third portfolio slot is desired.

## Approval checklist

- [ ] Confirm the project title and framing.
- [ ] Confirm that the 2025 provisional-data caveat is prominent enough.
- [ ] Review the New York/New York City handling.
- [ ] Approve or revise the GitHub metadata.
- [ ] Approve creation and publication of the remote repository.
- [ ] Approve any profile README or pinned-repository change separately.
- [ ] Review the LinkedIn draft; no LinkedIn action will occur without explicit approval.
