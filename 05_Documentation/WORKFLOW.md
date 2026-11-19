# End-to-end analytical workflow

**1. Data sources** — 19 CSV tables representing CRM, orders, invoices, line items, campaigns, marketing costs, calls, budgets, expenses, payments, deliveries and tenders.

**2. SQL exploration** — the bundled SQLite database and saved SQL queries demonstrate revenue aggregation, customer joins, invoice reconciliation, call-agent metrics and delivery timeliness. SQL was used for exploratory/validation analysis; the packaged Power BI model may load CSV directly, so do not claim the SQL output is the Power BI ingestion source without checking Power Query.

**3. Data preparation** — inspect the CSV data types, standardize dates and business categories, validate keys and blanks. Inspect Power Query M definitions in the `.pbip` project to document actual applied transformations.

**4. Semantic modeling** — dimension/fact model; the declared joins are inventoried in `MODEL_RELATIONSHIPS.md`. Review the relationship direction, cardinality and ambiguous paths in Power BI Desktop.

**5. Measures and reporting** — review DAX measures in semantic model TMDL tables; compare totals with SQLite and cross-filtered views.

**6. Presentation** — eight themed report pages with shared Year, Segment and DepartmentName slicers. Screenshots and PDF are a static export, not proof of slicer interactivity.

**7. QA** — validate each KPI under at least one segment, year and department filter; check totals, double counting, time coverage and presentation readability.
