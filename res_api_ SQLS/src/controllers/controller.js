import { getConnection } from "../database/sql_instance";

export const initialPage = (req, res) => {
    res.render('index');
}

export const getProducts = async (req,res) => {
    const pool = await getConnection();
    const _query = "SELECT * FROM OPENQUERY(MYSQL, 'SELECT ProductId, Name, ListPrice FROM adventureworks2019.product WHERE SellEndDate IS NULL AND ListPrice != 0.00')";
    const result = await pool.request().query(_query);
    //console.log({results:result.recordset});
    res.render('products', {results:result.recordset});
}

export const getProductInfo = async (req,res) => {
    const pool = await getConnection();
    const _ProductID = req.params.idp;
    const _query = "EXEC dbo.CheckAvailablePurchase'"+_ProductID+"'";   // check if there's a special offer
    const _query2 = "SELECT * FROM OPENQUERY(MYSQL, 'SELECT ProductID, Name FROM adventureworks2019.product WHERE ProductId = "+_ProductID+"')";  // getting the name of the product
    const result = await pool.request().query(_query);
    const result2 = await pool.request().query(_query2);
    console.log(result);
    //console.log(result2);
    //console.log(result.recordset[0].Description);
    //console.log(result2);
    if(result.rowsAffected == 0){
        console.log('no special offer');
        res.render('purchaseNp',{prod:result2.recordset});
    } else {
        if(result.rows == 'No Discount' && result.rowsAffected == 1){
            console.log('no special offer');
            res.render('purchaseNp',{prod:result2.recordset});
        } else {
            console.log('there is a special offer');
            res.render('purchase',{ results:result.recordset,
                                    prod: result2.recordset});
        }
        
    }
    
}

export const managePurchaseData = async (req, res) => {
    const pool = await getConnection();
    const _customerID = req.query.ClientID;
    const _Quantity = req.query.Qty;
    const _ProductID = req.query.ProductID;
    const a = "SELECT PersonID FROM AdventureWorks2019_Sales.Sales.Customer WHERE CustomerID = "+_customerID+"";
    const _SalesPersonID = await pool.request().query(a);
    const b = "SELECT TerritoryID FROM AdventureWorks2019_Sales.Sales.Customer WHERE CustomerID = "+_customerID+"";
    const c = "SELECT AddressID FROM SREMOTO1.AdventureWorks2019.Person.BusinessEntityAddress WHERE BusinessEntityID = "+_SalesPersonID.recordset[0].PersonID+"";
    const d = "SELECT CreditCardID FROM AdventureWorks2019_Sales.Sales.PersonCreditCard WHERE BusinessEntityID = "+_SalesPersonID.recordset[0].PersonID+"";
    const f = "SELECT * FROM OPENQUERY(MYSQL, 'SELECT ListPrice FROM adventureworks2019.product WHERE ProductId = "+_ProductID+"')";
    const g = "SELECT MAX(SalesOrderID) AS ID FROM AdventureWorks2019_Sales.Sales.SalesOrderHeader"
    const _TerritoryID = await pool.request().query(b);
    const _AddressID = await pool.request().query(c);
    const _CreditCardID = await pool.request().query(d);
    const _SubTotal = await pool.request().query(f);
    const _LastID = await pool.request().query(g);
    console.log(_LastID)
    const _storedProcedure = "EXEC dbo.InsertOrderDetail "+(_LastID.recordset[0].ID)+", "+_customerID+", "+_SalesPersonID.recordset[0].PersonID+", "+_TerritoryID.recordset[0].TerritoryID+", "+_AddressID.recordset[0].AddressID+", "+_CreditCardID.recordset[0].CreditCardID+", "+_SubTotal.recordset[0].ListPrice+", "+_Quantity+"";
    const insert = await pool.request().query(_storedProcedure)
    console.log(insert);

    const _query2 = "SELECT * FROM OPENQUERY(MYSQL, 'SELECT ProductID, Name FROM adventureworks2019.product WHERE ProductId = "+_ProductID+"')";
    const toRender = await pool.request().query(_query2)

    console.log(toRender)

    res.render('purchasedProduct',{prod: toRender.recordset});
}