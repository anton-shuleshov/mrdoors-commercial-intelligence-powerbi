# Dataset inventory

19 CSV source tables. Column names below are read from the packaged files.

### DimAgent — 10 rows
`AgentID`, `AgentName`, `Team`, `DepartmentID`, `EmploymentStatus`

### DimCampaign — 6 rows
`CampaignID`, `CampaignName`, `Channel`, `CampaignType`, `StartDate`, `EndDate`

### DimCustomer — 100 rows
`CustomerID`, `CustomerAlias`, `Segment`, `Region`, `CRMStatus`

### DimDate — 731 rows
`Date`, `Year`, `MonthNumber`, `MonthName`, `Quarter`, `YearMonth`

### DimDepartment — 5 rows
`DepartmentID`, `DepartmentName`, `BusinessUnit`

### DimOrder — 800 rows
`OrderID`, `OrderDate`, `CustomerID`, `DepartmentID`, `OrderStatus`

### DimProduct — 35 rows
`ProductID`, `SKU`, `Category`, `StandardCostRUB`, `ListPriceRUB`

### FactBudget — 120 rows
`Period`, `DepartmentID`, `RevenueBudgetRUB`, `OpexBudgetRUB`

### FactCalls — 1,788 rows
`CallID`, `CallDate`, `LeadID`, `AgentID`, `CampaignID`, `DepartmentID`, `Direction`, `CallStatus`, `CallOutcome`, `TalkSeconds`, `ConnectedFlag`, `QualifiedOutcomeFlag`, `CallCostRUB`

### FactDeliveries — 762 rows
`DeliveryID`, `OrderID`, `PromisedDate`, `ActualDeliveryDate`, `FulfilmentStatus`, `DeliveryRegion`, `OnTimeFlag`

### FactExpenses — 480 rows
`ExpenseID`, `Period`, `DepartmentID`, `ExpenseCategory`, `AmountRUB`

### FactInvoiceBalance — 762 rows
`InvoiceID`, `OrderID`, `InvoiceDate`, `CustomerID`, `DepartmentID`, `RevenueRUB`, `PaymentsRUB`, `OpenBalanceRUB`, `COGSRUB`, `GrossProfitRUB`

### FactLeads — 500 rows
`LeadID`, `LeadDate`, `DepartmentID`, `LeadSource`, `LeadStatus`, `Region`, `ContactAttempts`

### FactMarketingSpend — 144 rows
`SpendID`, `Period`, `CampaignID`, `SpendRUB`, `SpendType`

### FactOrderActivity — 6,349 rows
`EventID`, `OrderID`, `EventDate`, `EventType`, `DepartmentID`, `CustomerID`, `OrderRevenueRUB`, `SourceSystem`

### FactOrderLines — 2,010 rows
`OrderLineID`, `OrderID`, `ProductID`, `Quantity`, `UnitPriceRUB`, `DiscountRate`

### FactPayments — 642 rows
`PaymentID`, `InvoiceID`, `PaymentDate`, `PaymentAmountRUB`, `PaymentMethod`

### FactSales — 762 rows
`InvoiceID`, `OrderID`, `InvoiceDate`, `CustomerID`, `DepartmentID`, `RevenueRUB`, `COGSRUB`, `GrossProfitRUB`

### FactTenders — 100 rows
`TenderID`, `TenderDate`, `DepartmentID`, `TenderStatus`, `BidValueRUB`, `Region`
