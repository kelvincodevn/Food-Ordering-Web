/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group3.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBUtil {

    public static final String DB_NAME = "FoodManagement";
    public static final String DB_USERNAME = "sa";
    public static final String DB_PASSWORD = "12345";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection con = null;
        //1. Call Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create url
        String url = "jdbc:sqlserver://localhost:1433;DatabaseName=" + DB_NAME;
        //3.Get connection
        con = DriverManager.getConnection(url, DB_USERNAME, DB_PASSWORD);
        return con;
    }
}
