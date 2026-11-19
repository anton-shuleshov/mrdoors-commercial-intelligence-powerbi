-- SQLite-compatible queries; execute in DBeaver on the included .sqlite database.
-- 1. Revenue and gross margin by month
SELECT substr(InvoiceDate,1,7) AS Month, ROUND(SUM(RevenueRUB),2) AS RevenueRUB, ROUND(SUM(GrossProfitRUB),2) AS GrossProfitRUB FROM FactSales GROUP BY substr(InvoiceDate,1,7) ORDER BY Month;

-- 2. Customer performance after joining CRM and invoices
SELECT CustomerAlias, Segment, COUNT(InvoiceID) AS Invoices, ROUND(SUM(RevenueRUB),2) AS RevenueRUB FROM v_Sales_Customer GROUP BY CustomerID,CustomerAlias,Segment ORDER BY RevenueRUB DESC LIMIT 20;

-- 3. Invoices and payments reconciliation
SELECT ROUND(SUM(RevenueRUB),2) AS Invoiced,ROUND(SUM(PaidRUB),2) AS Paid,ROUND(SUM(CalculatedBalanceRUB),2) AS Outstanding FROM v_Invoice_Reconciliation;

-- 4. Check missing customers
SELECT COUNT(*) AS MissingCustomers FROM DimOrder o LEFT JOIN DimCustomer c ON c.CustomerID=o.CustomerID WHERE c.CustomerID IS NULL;

-- 5. Telemarketing by agent
SELECT * FROM v_Telemarketing_Agents ORDER BY Calls DESC;

-- 6. On-time delivery by region
SELECT DeliveryRegion, COUNT(*) AS Deliveries, ROUND(100.0*SUM(OnTimeFlag)/NULLIF(COUNT(*),0),1) AS OnTimePct FROM FactDeliveries GROUP BY DeliveryRegion ORDER BY Deliveries DESC;
