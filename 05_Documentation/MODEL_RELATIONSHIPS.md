# Relationships declared in the included semantic model

28 relationships found in `relationships.tmdl`. These are model definitions, not a runtime validation of filter behavior.

- `DimOrder.CustomerID` → `DimCustomer.CustomerID`
- `FactSales.CustomerID` → `DimCustomer.CustomerID`
- `FactInvoiceBalance.CustomerID` → `DimCustomer.CustomerID`
- `DimOrder.DepartmentID` → `DimDepartment.DepartmentID`
- `FactSales.DepartmentID` → `DimDepartment.DepartmentID`
- `FactInvoiceBalance.DepartmentID` → `DimDepartment.DepartmentID`
- `FactExpenses.DepartmentID` → `DimDepartment.DepartmentID`
- `FactBudget.DepartmentID` → `DimDepartment.DepartmentID`
- `FactTenders.DepartmentID` → `DimDepartment.DepartmentID`
- `FactLeads.DepartmentID` → `DimDepartment.DepartmentID`
- `FactCalls.DepartmentID` → `DimDepartment.DepartmentID`
- `FactCalls.AgentID` → `DimAgent.AgentID`
- `FactCalls.CampaignID` → `DimCampaign.CampaignID`
- `FactMarketingSpend.CampaignID` → `DimCampaign.CampaignID`
- `FactOrderLines.OrderID` → `DimOrder.OrderID`
- `FactDeliveries.OrderID` → `DimOrder.OrderID`
- `FactOrderActivity.OrderID` → `DimOrder.OrderID`
- `FactOrderLines.ProductID` → `DimProduct.ProductID`
- `FactSales.InvoiceDate` → `DimDate.Date`
- `FactCalls.CallDate` → `DimDate.Date`
- `FactLeads.LeadDate` → `DimDate.Date`
- `FactMarketingSpend.Period` → `DimDate.Date`
- `FactExpenses.Period` → `DimDate.Date`
- `FactBudget.Period` → `DimDate.Date`
- `FactPayments.PaymentDate` → `DimDate.Date`
- `FactTenders.TenderDate` → `DimDate.Date`
- `FactOrderActivity.EventDate` → `DimDate.Date`
- `FactInvoiceBalance.InvoiceDate` → `DimDate.Date`

Review cardinality, direction, and measure behavior in Power BI Desktop before publication.
