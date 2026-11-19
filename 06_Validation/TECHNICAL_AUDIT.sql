-- Mr.Doors technical audit: run against 02_SQL/MrDoors_Analytics_2020_2021.sqlite
-- Read-only checks. Expected values are documented in 06_Validation/QA_results.json.
-- Results have NOT been independently executed by the GitHub documentation audit.

-- 1. Row counts: should total 16,106 across the 19 source tables.
SELECT 'DimAgent' AS TableName, COUNT(*) AS Rows FROM DimAgent
UNION ALL SELECT 'DimCampaign', COUNT(*) FROM DimCampaign
UNION ALL SELECT 'DimCustomer', COUNT(*) FROM DimCustomer
UNION ALL SELECT 'DimDate', COUNT(*) FROM DimDate
UNION ALL SELECT 'DimDepartment', COUNT(*) FROM DimDepartment
UNION ALL SELECT 'DimOrder', COUNT(*) FROM DimOrder
UNION ALL SELECT 'DimProduct', COUNT(*) FROM DimProduct
UNION ALL SELECT 'FactBudget', COUNT(*) FROM FactBudget
UNION ALL SELECT 'FactCalls', COUNT(*) FROM FactCalls
UNION ALL SELECT 'FactDeliveries', COUNT(*) FROM FactDeliveries
UNION ALL SELECT 'FactExpenses', COUNT(*) FROM FactExpenses
UNION ALL SELECT 'FactInvoiceBalance', COUNT(*) FROM FactInvoiceBalance
UNION ALL SELECT 'FactLeads', COUNT(*) FROM FactLeads
UNION ALL SELECT 'FactMarketingSpend', COUNT(*) FROM FactMarketingSpend
UNION ALL SELECT 'FactOrderActivity', COUNT(*) FROM FactOrderActivity
UNION ALL SELECT 'FactOrderLines', COUNT(*) FROM FactOrderLines
UNION ALL SELECT 'FactPayments', COUNT(*) FROM FactPayments
UNION ALL SELECT 'FactSales', COUNT(*) FROM FactSales
UNION ALL SELECT 'FactTenders', COUNT(*) FROM FactTenders;

-- 2. Core KPI reconciliation.
-- Expected revenue 132149122.92; COGS 90625250.00; gross profit 41523872.92.
SELECT ROUND(SUM(RevenueRUB),2) AS RevenueRUB,
       ROUND(SUM(COGSRUB),2) AS COGSRUB,
       ROUND(SUM(GrossProfitRUB),2) AS GrossProfitRUB,
       ROUND(SUM(RevenueRUB - COGSRUB - GrossProfitRUB),2) AS ProfitIdentityDifference
FROM FactSales;

-- 3. Key integrity: each result should be zero.
SELECT 'FactSales -> DimOrder' AS CheckName, COUNT(*) AS MissingCount
FROM FactSales f LEFT JOIN DimOrder d ON f.OrderID=d.OrderID WHERE d.OrderID IS NULL
UNION ALL
SELECT 'FactSales -> DimCustomer', COUNT(*)
FROM FactSales f LEFT JOIN DimCustomer d ON f.CustomerID=d.CustomerID WHERE d.CustomerID IS NULL
UNION ALL
SELECT 'FactPayments -> FactSales', COUNT(*)
FROM FactPayments f LEFT JOIN FactSales d ON f.InvoiceID=d.InvoiceID WHERE d.InvoiceID IS NULL
UNION ALL
SELECT 'FactCalls -> FactLeads', COUNT(*)
FROM FactCalls f LEFT JOIN FactLeads d ON f.LeadID=d.LeadID WHERE d.LeadID IS NULL
UNION ALL
SELECT 'FactOrderLines -> DimProduct', COUNT(*)
FROM FactOrderLines f LEFT JOIN DimProduct d ON f.ProductID=d.ProductID WHERE d.ProductID IS NULL;

-- 4. Invoice and payment consistency: expected zero mismatches.
SELECT COUNT(*) AS InvoiceBalanceMismatches
FROM v_Invoice_Reconciliation
WHERE ABS(CalculatedBalanceRUB-OpenBalanceRUB)>0.02;

-- 5. Potential duplicate invoice identifiers: expected zero rows.
SELECT InvoiceID, COUNT(*) AS Occurrences
FROM FactSales GROUP BY InvoiceID HAVING COUNT(*)>1;

-- 6. Potential duplicate payment identifiers: expected zero rows.
SELECT PaymentID, COUNT(*) AS Occurrences
FROM FactPayments GROUP BY PaymentID HAVING COUNT(*)>1;

-- 7. Check period and monetary values for manual review.
SELECT MIN(InvoiceDate) AS FirstInvoiceDate,
       MAX(InvoiceDate) AS LastInvoiceDate,
       SUM(CASE WHEN RevenueRUB<0 THEN 1 ELSE 0 END) AS NegativeRevenueRows,
       SUM(CASE WHEN COGSRUB<0 THEN 1 ELSE 0 END) AS NegativeCOGSRows
FROM FactSales;
