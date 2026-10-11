# Data dictionary

| Field | Type | Definition |
|---|---|---|
| `jurisdiction` | text | CDC/NNDSS reporting jurisdiction; New York City is separate from New York State |
| `incidence_per_100k` | numeric | Provisional reported pertussis incidence per 100,000 population |
| `cases` | integer | Provisional reported pertussis cases for 2025 |
| `data_status` | text | Provisional status flag |
| `source_year` | integer | Surveillance reporting year |
| `share_of_us_cases_pct` | numeric | Jurisdiction cases divided by the CDC national total, expressed as percent |
| `incidence_rank` | integer | Descending rank by incidence |
| `case_rank` | integer | Descending rank by case count |
| `planning_segment` | text | Descriptive two-axis planning category; not a risk classification |

The thresholds used for `planning_segment` (20 per 100,000 and 1,000 cases) are transparent portfolio decision rules, not CDC alert thresholds.
