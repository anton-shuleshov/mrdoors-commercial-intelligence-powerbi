Mr.Doors | Commercial Intelligence & Business Performance

Sales · Finance · Customer Intelligence · Marketing · Telemarketing · Operations · Tenders

2020–2021 | Power BI portfolio implementation: 2026

Power BI · SQL · DAX · Data Modeling · Business Intelligence

────────

Project overview

I worked in business development and marketing analytics at Mr.Doors from June 2019 to January 2022. My work involved commercial reporting, performance analysis and supporting decisions across sales and marketing activities.

In 2026, I revisited this business context and developed an integrated eight-page Power BI report, bringing together commercial, financial, customer, marketing, telemarketing, delivery and tender analytics. The project illustrates how separate operational reporting domains can be explored through SQL, modeled for BI and presented in an interactive reporting environment.

Dashboard gallery

Each screenshot links to its full-size version. The screenshots are static previews; the Power BI file is the interactive report.

01 · Executive Overview

A consolidated view of revenue, gross profit, margin, invoice volume, customer base and performance against budget, with comparisons across time, regions, departments and customer segments.

Executive Overview

02 · Sales Performance

Monthly sales trends, revenue by department, geographic distribution, customer segmentation and variance to budget.

Sales Performance

03 · Financial Performance

Revenue, cost of goods sold, gross profit, gross margin, operating expenses and budget comparison.

Financial Performance

04 · Customer Intelligence

Customer distribution by region and segment, revenue contribution, average invoice value and outstanding receivables.

Customer Intelligence

05 · Marketing & Leads

Marketing investment by channel, lead sources, lead status, cost per lead and links to contact-center activity.

Marketing and Leads

06 · Telemarketing

Call volume, connection and qualification rates, agent activity, call outcomes and team-level performance.

Telemarketing

07 · Operations & Delivery

Delivery volumes, fulfillment status, on-time performance, geographic coverage, payments and receivables.

Operations and Delivery

08 · Tender Pipeline

Tender bid value by status and region, alongside commercial performance indicators. Tender bid value is pipeline exposure, not recognized sales revenue.

Tender Pipeline

Business questions

• Which departments, regions and customer segments contribute most to revenue and gross profit?
• How do actual commercial results compare with budget?
• How is marketing investment distributed across channels, and how does it relate to lead generation?
• How do call outcomes and agent activity contribute to qualified contacts?
• Where do delivery performance and outstanding receivables require attention?
• How is the tender pipeline distributed across statuses and regions?

Data and analytical workflow

The repository contains 19 analytical tables covering customers, products, orders, sales, invoicing, budgets, expenses, payments, campaigns, leads, calls, deliveries and tenders.

1. Historical reporting context. The business questions and reporting domains reflect my earlier commercial analytics experience.

2. SQL analysis. SQL scripts provide exploratory aggregations, joins and data-quality checks. The SQLite database allows the queries to be reviewed separately from Power BI.

3. Data preparation. The dataset is organized into dimension and fact tables. Data types, identifiers, date fields and missing values are areas of preparation and validation; the precise transformations used in the current Power BI file should be inspected in Power Query.

4. BI modeling. Power BI combines the reporting domains through a semantic model and DAX measures. Relationship cardinality and cross-filter behavior should be validated in the live model.

5. Reporting and visualization. Eight themed pages provide shared Year, Segment and Department filters, KPI cards, time series and comparative charts.

6. Quality assurance. SQL checks and validation outputs support reconciliation of key totals. Interactive behavior, filtered totals and local refresh should be tested in Power BI Desktop.

> SQL is included as an analysis and validation layer. The Power BI model may load the CSV files directly; SQL should not be described as the Power BI ingestion pipeline unless that is verified in Power Query.

Selected dashboard metrics

The report export displays the following approximate unfiltered values for the 2020–2021 analytical dataset:

|KPI               |Displayed value|
|------------------|--------------:|
|Revenue           |₽132M          |
|Gross profit      |₽42M           |
|Gross margin      |31.4%          |
|Invoices          |762            |
|Revenue budget    |₽215M          |
|Budget achievement|61.6%          |

These are rounded values from the report export, not claims about audited corporate results. Figures can change with slicer selections.

Repository structure

mrdoors-commercial-intelligence-powerbi/
├── 01_Data_CSV/        # 19 analytical CSV tables
├── 02_SQL/             # SQL scripts and SQLite database
├── 03_PowerBI/         # Power BI report, theme and DAX reference
├── 04_Dashboards/      # Eight PNG previews and PDF export
├── 05_Documentation/   # Data dictionary, model and workflow
├── 06_Validation/      # QA queries, checks and results
└── README.md

How to explore the project

1. Preview the report: Browse the eight images above or open the PDF in 04_Dashboards/.
2. Review the data: Inspect the CSV files in 01_Data_CSV/ and the field definitions in 05_Documentation/.
3. Explore SQL: Open the SQLite database with a compatible tool such as DBeaver, then review the analysis and validation scripts in 02_SQL/.
4. Open Power BI: Download the working .pbix from 03_PowerBI/ and open it in Power BI Desktop on Windows. Update local CSV source paths if prompted, refresh, and test slicers.
5. Check reproducibility: Compare results against the files in 06_Validation/. Static exports do not independently establish that every filter or measure is correct.

Skills demonstrated

Commercial analytics · SQL exploration and validation · Dimensional modeling · Power BI reporting · DAX measures · KPI design · Data storytelling · Cross-functional performance analysis

Author

Anton Shuleshov
Business Development & Marketing Analytics | Business Intelligence & Data Analytics

GitHub profile · LinkedIn
