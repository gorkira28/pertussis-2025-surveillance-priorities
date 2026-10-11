# QGIS mapping workflow

1. Download the Census Bureau state cartographic boundary shapefile for the 2025 vintage or another clearly documented vintage.
2. Open the state layer in QGIS 3.40 or later.
3. Add `qgis/state_incidence_join.csv` as a delimited-text layer with **No geometry**.
4. Join the boundary state-name field to `state_name`.
5. Use a sequential, color-blind-safe graduated style on `incidence_per_100k` with five classes and a clearly labeled `per 100,000` legend.
6. Show `cases` in the identify panel or labels; do not use counts as the choropleth fill.
7. Add a layout note: "2025 provisional CDC/NNDSS reporting jurisdictions. New York State excludes separately reported New York City."
8. Export at 2,000 pixels wide or greater for the portfolio.

Do not combine New York and New York City incidence by averaging the two rates. A valid combined rate requires compatible population denominators.

