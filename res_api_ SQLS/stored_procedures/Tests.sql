SELECT * FROM AdventureWorks2019.Production.Product where ProductID = 402;
SELECT * FROM AdventureWorks2019.Production.ProductCategory;
SELECT * FROM AdventureWorks2019.Production.ProductCostHistory;
SELECT * FROM AdventureWorks2019.Production.ProductDescription;
SELECT * FROM AdventureWorks2019.Production.ProductInventory;
SELECT * FROM AdventureWorks2019.Production.Location;
SELECT * FROM AdventureWorks2019.Production.ProductModel;
SELECT * FROM AdventureWorks2019.Production.ProductModelIllustration;
SELECT * FROM AdventureWorks2019.Production.ProductProductPhoto;
SELECT * FROM AdventureWorks2019.Production.Product WHERE ProductSubcategoryID IS NOT NULL;
SELECT * FROM AdventureWorks2019.Production.ProductSubcategory;
SELECT * FROM AdventureWorks2019.Production.Product;
SELECT * FROM AdventureWorks2019.Sales.CountryRegionCurrency;
SELECT * FROM AdventureWorks2019.Sales.CreditCard;
SELECT * FROM AdventureWorks2019.Sales.Currency;
SELECT * FROM AdventureWorks2019.Sales.CurrencyRate;
SELECT * FROM AdventureWorks2019.Sales.Customer;
SELECT * FROM AdventureWorks2019.Sales.SalesPerson;
SELECT * FROM AdventureWorks2019.Sales.SalesOrderDetail;
SELECT * FROM AdventureWorks2019.Sales.SalesOrderHeader;
SELECT * FROM AdventureWorks2019.Sales.SalesOrderHeaderSalesReason;
SELECT * FROM AdventureWorks2019.Sales.SpecialOffer;
SELECT * FROM AdventureWorks2019.Sales.SpecialOfferProduct;

SELECT T2.ProductID, T2.Name, T2.SpecialOfferID, T1.Description, T1.MinQty, T1.MaxQty, T1.DiscountPct
FROM AdventureWorks2019.Sales.SpecialOffer AS T1
LEFT JOIN	(	SELECT info.ProductID, info.Name, info2.SpecialOfferID 
				FROM AdventureWorks2019.Production.Product AS info
				LEFT JOIN AdventureWorks2019.Sales.SpecialOfferProduct AS info2
				ON info.ProductID = info2.ProductID
				WHERE info.SellEndDate IS NOT NULL ) AS T2
ON T1.SpecialOfferID = T2.SpecialOfferID
ORDER BY 1 ASC;

SELECT * 
FROM AdventureWorks2019.Production.Product AS T1
LEFT JOIN ( SELECT *
			FROM AdventureWorks2019.Sales.SpecialOffer)