import sql from "mssql";
import config from "../config";

const dbSettings = {
    user: 'LA',
    password:'LA123',
    server: 'localhost',
    database: 'AdventureWorks2019_Sales',
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

export async function getConnection(){
    try {
        const pool = await sql.connect(dbSettings);
        return pool;
    } catch (error) {
        console.log(error);
    }
};