-- Compare against QA_results.json
SELECT COUNT(*) AS MissingOrders FROM FactSales s LEFT JOIN DimOrder o ON o.OrderID=s.OrderID WHERE o.OrderID IS NULL;
SELECT ROUND(SUM(RevenueRUB),2) AS Revenue, ROUND(SUM(COGSRUB),2) AS COGS, ROUND(SUM(GrossProfitRUB),2) AS GrossProfit FROM FactSales;
SELECT COUNT(*) AS MismatchedBalances FROM v_Invoice_Reconciliation WHERE ABS(CalculatedBalanceRUB-OpenBalanceRUB)>0.02;
SELECT COUNT(*) AS MissingLeadReferences FROM FactCalls c LEFT JOIN FactLeads l ON c.LeadID=l.LeadID WHERE l.LeadID IS NULL;
