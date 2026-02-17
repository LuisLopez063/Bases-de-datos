USE AdventureWorks2019_Sales
GO
CREATE PROCEDURE CheckAvailablePurchase (@_ProductID VARCHAR(5))
AS
BEGIN
	-- Buscar el producto y su descuento
	-- Regresar una tabla que contenga idproducto, nombre, idSpecialOffer, Description, MinQty, MaxQty, DiscountPct
	SELECT T2.ProductID, T1.SpecialOfferID, T1.Description, T1.MinQty, T1.MaxQty, T1.DiscountPct 
	FROM AdventureWorks2019_Sales.Sales.SpecialOffer AS T1
	LEFT JOIN ( SELECT * 
				FROM AdventureWorks2019_Sales.Sales.SpecialOfferProduct
				WHERE ProductID = @_ProductID)  AS T2
	ON T1.SpecialOfferID = T2.SpecialOfferID
	WHERE T2.ProductID = @_ProductID;
END
GO

EXEC dbo.CheckAvailablePurchase '892'