select * from AdventureWorks2019.Sales.SalesOrderDetail;
select * from AdventureWorks2019.Sales.SalesOrderHeader;

select * from AdventureWorks2019.Sales.Customer
where CustomerID = 15300
select * from AdventureWorks2019.Sales.Customer where CustomerID = 29685
select * from AdventureWorks2019.Person.Person
where BusinessEntityID = 13976;
select * from AdventureWorks2019.Person.EmailAddress
where BusinessEntityID = 13976;
select * from AdventureWorks2019.Person.Address;
select * from AdventureWorks2019.Person.BusinessEntity

select * from AdventureWorks2019.Person.Address;
select * from AdventureWorks2019.Sales.SalesPerson;
select * from AdventureWorks2019.Sales.PersonCreditCard
where BusinessEntityID = 13976;
select * from AdventureWorks2019.Sales.CreditCard;
select * from AdventureWorks2019.Sales.CurrencyRate;

-- 1. SalesOrderID es llave primaria e incrementable
-- 2. RevisionNumber tiene valor 8 para todos
-- 3. OrderDate fecha actual a las 12 horas
-- 4. DueDate son 12 dias después de OrderDate
-- 5. ShipDate es 7 días después de OrderDate
-- 6. Status tiene valor 5 para todos
-- 7. OnlineOrderFlag tiene valor 1 para todos
-- 8. SalesOrderNumber valor computed autoincrementable hasta ahora
-- 9. PurchaseOrderNumber puede ser NULL
-- 10. AccountNumber desde tabla customer
-- 11. CustomerID obtenido del formulario
-- 12. SalesPersonID puede ser NULL y sale de la tabla sales.customer
-- 13. TerritoryID obtenido de la tabla customer
-- 14. BillToAddressID
-- 15. ShipToAddressID
-- 16. ShipMethodID
-- 17. CreditCardID
-- 18. CreditCardApprovalCode
-- 19. CurrencyRateID puede ser NULL
-- 20. SubTotal
-- 21. TaxAmt
-- 22. Freight
-- 23. TotalDue
-- 24. Comment puede ser null
-- 25. rowguid
-- 26. ModifiedDate

-- GetClientInfo
-- AccountNumber
-- CustomerID
-- SalesPersonID
-- TerritoryID
-- Address to BillToAddressID and ShipToAddressID

select * from AdventureWorks2019.Sales.SalesOrderDetail;

SELECT * FROM Person.

USE AdventureWorks2019
GO
--DECLARE @uLTIMOID INT	
--SELECT @uLTIMOID= MAX(SalesOrderID) FROM AdventureWorks2019.Sales.SalesOrderHeader;
--SET IDENTITY_INSERT SalesOrderID ON
INSERT INTO Sales.SalesOrderHeader (--SalesOrderID,   --1
									RevisionNumber,  --2
									OrderDate,		-- 3
									DueDate,		-- 4
									ShipDate,		-- 5
									Status,			-- 6
									OnlineOrderFlag,-- 7
									PurchaseOrderNumber, -- 8
									AccountNumber,		--9
									CustomerID,			-- 10
									SalesPersonID,   -- 11 Sale de la tabla Sales.Customer
									TerritoryID,	-- 12
									BillToAddressID, -- 13 Sale de BusinessEntityAddress
									ShipToAddressID,	-- 14
									ShipMethodID,		--15
									CreditCardID,		--16
									CreditCardApprovalCode,		-- 17 null por ahora
									CurrencyRateID,		--18
									SubTotal,			-- 19
									TaxAmt,				-- 20
									Freight,			--21
									--TotalDue,			-- 22
									Comment,			--23
									rowguid,			-- 24
									ModifiedDate)		-- 25

VALUES(	--@uLTIMOID+1,						-- 1 SalesOrderID
		8,								-- 2 RevisionNumber
		GETDATE(),						-- 3 OrderDate
		DATEADD(DAY, 12, GETDATE()),	-- 4 DueDate
		DATEADD(DAY, 7, GETDATE()),		-- 5 ShipDate
		5,								-- 6 Status
		1,								-- 7 OnlineOrderFlag
		NULL,							-- 8 PurchaseOrderNumber
		'10-4030-018759',				-- 9 AccountNumber
		18759,							-- 10 CustomerID
		NULL,							-- 11 SalesPersonID
		6,								-- 12 TerritoryID
		14024,							-- 13 Address
		14024,							-- 14 Address
		1,								-- 15 ShipMethodID
		10084,							-- 16 CreditCardID
		NULL,							-- 17 AprovalCode
		NULL,							-- 18 CurrencyRateID
		1890.97,						-- 19 SubTotal
		15.1976,						-- 20 TaxAmt
		4.7493,							-- 21 Freight
		--209.9169,						-- 22 TotalDue
		NULL,							-- 23 Comment
		NEWID(),						-- 24 rowguid
		GETDATE())						-- 25 ModifiedDate
		go
--SET IDENTITY_INSERT SalesOrderID OFF
		-- productid = 680
		-- listprice = 1431.50
		-- orderqty = 1
		-- specialOfferid = 1
		-- UnitPriceDiscount = 0.00
		-- LineTotal = 1431.5
		-- rowguid

PRINT @uLTIMOID
INSERT INTO AdventureWorks2019.Sales.SalesOrderDetail (	SalesOrderID,
														SalesOrderDetailID,
														CarrierTrackingNumber,
														OrderQty,
														ProductID,
														SpecialOfferID,
														UnitPrice,
														UnitPriceDiscount,
														rowguid,
														ModifiedDate)
VALUES (NEWID(),
		NEWID(),
		NULL,
		1,
		680,
		1,
		1431.50,
		0.00,
		NEWID(),
		GETDATE())

select * from AdventureWorks2019.Sales.SpecialOfferProduct
where ProductID = 680


SELECT * FROM AdventureWorks2019.Production.Product


