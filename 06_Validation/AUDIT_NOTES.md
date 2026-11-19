# Technical audit notes — 2026-11-19

## Scope and verification levels

This is a **repository-source audit**, not an executed Power BI Desktop test. Repository paths, Markdown, SQL text, CSV headers, and published QA summaries were inspected. The SQLite database was not independently opened in this audit environment, and Power BI Desktop refresh/interactions were not executed.

## Verified repository facts

- The repository contains 19 CSV source files, one SQLite database, two existing SQL scripts, one PBIX, one DAX reference, eight PNG dashboard screenshots, documentation and QA results.
- `06_Validation/QA_results.json` records 16,106 total rows across 19 tables.
- Published QA totals reconcile arithmetically: 132,149,122.92 RUB revenue - 90,625,250.00 RUB COGS = 41,523,872.92 RUB gross profit (31.42198% gross margin).
- Published invoice totals reconcile arithmetically: 132,149,122.92 RUB revenue - 101,552,430.61 RUB payments = 30,596,692.31 RUB outstanding.
- The README's eight relative screenshot paths match files in `04_Dashboards/`.
- No PBIP/TMDL source or PDF export is included. References to these in workflow documentation were corrected.

## Tests prepared, not executed

Run `06_Validation/TECHNICAL_AUDIT.sql` in SQLite/DBeaver and compare the output to `06_Validation/QA_results.json`. The script checks counts, totals, foreign-key coverage, duplicate IDs and date/value ranges.

## Manual Power BI acceptance checklist

1. Open `03_PowerBI/MrDoors_Analytics_2020_2021.pbix` in Power BI Desktop on Windows.
2. Check Power Query source paths; replace machine-specific CSV locations with the downloaded `01_Data_CSV/` directory if necessary.
3. Refresh and confirm all tables load without errors.
4. Compare unfiltered revenue, COGS, gross profit, invoice count and budget to QA totals.
5. Test Year, Segment and Department slicers individually and in combination. Confirm each KPI responds to the intended dimension; shared date filters across facts require special attention.
6. Check for ambiguous relationships, incorrect cardinality and inactive date relationships.
7. Check whether delivery KPI definitions exclude incomplete/cancelled deliveries and whether marketing cost per lead uses matching time/department scopes.
8. Export a PDF only after validating the eight pages and their filter context.

## Publication notes

- `MODEL_RELATIONSHIPS.md` is an inventory of declared relationships, **not** a confirmed runtime test. Because the referenced TMDL source is not published, verify these relationships in the PBIX.
- A static PNG cannot demonstrate interactive slicer behavior.
- Published QA results are evidence of a previous check, not independent verification in this audit.
