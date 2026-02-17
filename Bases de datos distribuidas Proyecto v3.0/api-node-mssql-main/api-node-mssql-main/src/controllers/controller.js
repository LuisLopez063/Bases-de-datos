import { getConnection } from "../database/sql_instance";

export const initialPage = (req, res) => {
    res.render('index');
}

export const getProducts = async (req,res) => {
    const pool = await getConnection();
    const _query = "SELECT * FROM OPENQUERY(MYSQL2, 'SELECT ProductId, Name, ProductNumber FROM adventureworks2019.product WHERE SellEndDate IS NULL')";
    const result = await pool.request().query(_query);
    console.log({results:result.recordset});
    res.render('products', {results:result.recordset});
}

export const getProductInfo = async (req,res) => {
    const pool = await getConnection();
    const _ProductID = req.params.idp;
    const _query = "EXEC dbo.CheckAvailablePurchase'"+_ProductID+"'";
    const _query2 = "SELECT * FROM OPENQUERY(MYSQL2, 'SELECT Name FROM adventureworks2019.product WHERE ProductId = "+_ProductID+"')";
    const result = await pool.request().query(_query);
    const result2 = await pool.request().query(_query2);
    res.render('purchase',{ results:result.recordset,
                            prod: result2.recordset});
}

export const getAvailableProduct = async (req, res) => {
    const pool = await getConnection();
    const _ProductID = req.params.idp;
    const _query = "EXEC dbo.GetAvailableProduct '"+_ProductID+"'";
    const result = await pool.request().query(_query);
    if(result.recordset[0].SellEndDate == null){
        //res.render('products');
        //res.json('Producto disponible');
    } else {
        //res.render('products');
        //res.json('Producto no disponible');
    }
}
