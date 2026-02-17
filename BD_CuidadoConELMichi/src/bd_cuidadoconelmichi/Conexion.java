/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bd_cuidadoconelmichi;

import java.sql.*;

/**
 *
 * @author LUISA
 */
public class Conexion {
    
private String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
String connectionURL = "jdbc:sqlserver://LAPTOP-9NNS0DVG:1433;databaseName=CUIDADO_CON_EL_MICHI_5;user=sa;password=1234;";

Conexion(){
}
    
    public Connection conectar(){
    try {
        Class.forName(driver);
        return(DriverManager.getConnection(connectionURL));

    } catch (Exception e) {
        System.out.println("No se pudo conectar");
    }
return null;
}
    
}
