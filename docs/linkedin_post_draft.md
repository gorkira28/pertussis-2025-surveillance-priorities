# LinkedIn post draft

28,783 provisional pertussis cases were reported in the United States in 2025.

But the jurisdictions with the highest incidence were not always the ones with the largest case-management burden.

For my latest public-health analytics project, I converted the CDC's 2025 provisional pertussis surveillance table into a reproducible DuckDB SQL and QGIS workflow.

Oregon had the highest reported incidence at 36.51 per 100,000. Washington had the largest case count at 2,127 and also ranked fourth by incidence. Texas ranked second by case count, but its incidence was below the national rate.

That difference matters. Incidence helps identify unusually intense population-level occurrence. Counts help programs anticipate investigation, laboratory, communication, and follow-up workload.

I built validation checks that reconcile all 52 reporting jurisdictions to the CDC national total. I also kept New York State and New York City separate because averaging their reported rates would create a misleading state estimate without compatible population denominators.

The project includes executable SQL, ranked output tables, a QGIS-ready join file, a data dictionary, documented limitations, and a portfolio dashboard.

These provisional surveillance data cannot explain why rates differ or estimate vaccine effectiveness. They can, however, show why a responsible dashboard should present both rate and burden.

How does your team balance population-adjusted rates with operational case volume when setting surveillance priorities?

P.S. Repository link belongs in the first comment after publication.

#Epidemiology #PublicHealth

First comment: https://github.com/gorkira28/pertussis-2025-surveillance-priorities
