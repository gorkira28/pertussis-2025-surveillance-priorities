# Portfolio case study

## The problem

Case counts and incidence rates can send different operational signals. Large states may generate substantial investigation workload even when their population-adjusted rate is modest. Smaller states may show intense transmission with fewer total cases.

## My approach

I converted the CDC's 2025 provisional jurisdiction table into an auditable CSV, reconciled all rows to the national case total, and built a DuckDB SQL workflow for typed ingestion, QA, ranking, case-share calculation, and planning segmentation. I also prepared a QGIS join table that avoids silently merging New York State and New York City.

## What I found

Oregon had the highest reported incidence (36.51 per 100,000), while Washington had the most cases (2,127). Washington appeared near the top on both dimensions. Texas ranked second by count but had an incidence below the national figure, illustrating why neither measure should be presented alone.

## Why it matters

Incidence is useful for detecting unusually intense population-level occurrence. Counts help estimate operational workload. Showing both gives surveillance leaders a more honest basis for prioritizing investigation, laboratory, immunization, and communication capacity.

## Responsible interpretation

The analysis is descriptive, ecological, and based on provisional data. It does not evaluate vaccine effectiveness, individual risk, or causes of geographic differences.
