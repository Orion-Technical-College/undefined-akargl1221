-- Setup SQL script for the database
DELETE FROM ORDER_LINE WHERE OrderLineID = 1;

-- Insert a new order line with conflict handling
INSERT INTO ORDER_LINE (OrderLineID, OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 1, 1, 2, 19.99)
ON CONFLICT (OrderLineID)
DO UPDATE SET Quantity = 2;