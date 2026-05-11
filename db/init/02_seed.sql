-- Canonical seed (must stay aligned with MP7 autograde marker: Avery / avery.lopez@example.com).

INSERT INTO CUSTOMER (CustomerID,CompanyName, Email)
VALUES
    (1, 'Avery Lopez', 'avery.lopez@example.com'),
    (2, 'Morgan Chen', 'morgan.chen@example.com');

INSERT INTO SUPPLIER (SupplierID, SupplierName, Email)
VALUES
    (1, 'Acme Manufacturing', 'orders@acme.com');

INSERT INTO SALES_REP (SalesRepID, FirstName, LastName, Email, Region)
VALUES
    (1, 'Jamie', 'Rivera', 'jamie.rivera@example.com', 'Midwest');

INSERT INTO WAREHOUSE (WarehouseID, WarehouseName, City, State, CapacityUnits)
VALUES
    ('WH-CHI', 'Chicago Warehouse', 'Chicago', 'IL', 50000);

INSERT INTO PRODUCT (ProductID, SKU, ProductName, ListPrice, SupplierID)
VALUES
    (1, 'SKU-001', 'Widget A', 19.99, 1),
    (2, 'SKU-002', 'Widget B', 29.50, 1);

INSERT INTO ORDERS (OrderID, CustomerID, SalesRepID, WarehouseID, OrderDate, Status)
VALUES (1, 1, 1, 'WH-CHI', CURRENT_DATE, 'CONFIRMED');

INSERT INTO ORDER_LINE (OrderLineID, OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 1, 1, 2, 19.99);

SELECT OrderLineID, Quantity * UnitPrice AS LineTotal
FROM ORDER_LINE;

SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalAmount
FROM ORDER_LINE
GROUP BY OrderID;
