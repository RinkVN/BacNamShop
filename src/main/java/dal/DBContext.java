/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;

/**
 *
 * @author datla
 */
public class DBContext {

    private static Connection conn;

    private static String URL = "jdbc:mysql://localhost:3306/bacnamshop";

    private static String USER = "root";

    private static String PASS = "123";
    
    public static Connection getConn() {
        try {
            System.out.println("URL --->" + URL);
            System.out.println("USER --->" + USER);
            System.out.println("PASS --->" + PASS);
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Successfully connected to the database.");
        } catch (Exception e) {
            System.out.println("Failed to connect to the database.");
            e.printStackTrace(); // Print stack trace for debugging
            throw new RuntimeException("Failed to connect to the database.", e);
        }
        return conn;
    }
    
    
//    private static String URL = "jdbc:mysql://shopbacnamhaidb.mysql.database.azure.com:3306/bacnamshop?useSSL=true";
//
//    private static String USER = "shopbacnamhai";
//
//    private static String PASS = "Bacnamhai@";
//
//    public static Connection getConn() {
//        try {
//            System.out.println("URL --->" + URL);
//            System.out.println("USER --->" + USER);
//            System.out.println("PASS --->" + PASS);
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = DriverManager.getConnection(URL, USER, PASS);
//            System.out.println("Successfully connected to the database.");
//        } catch (Exception e) {
//            System.out.println("Failed to connect to the database.");
//            e.printStackTrace(); // Print stack trace for debugging
//            throw new RuntimeException("Failed to connect to the database.", e);
//        }
//        return conn;
//    }
    
//    private static String URL = "jdbc:sqlserver://SUPPER:1433;DatabaseName=ShopBacNamHai;user=sa;password=123;encrypt=true;trustServerCertificate=true;";
//
//    private static String USER = "sa";
//
//    private static String PASS = "123";
//
//    public static Connection getConn() {
//        try {
//            System.out.println("URL --->" + URL);
//            System.out.println("USER --->" + USER);
//            System.out.println("PASS --->" + PASS);
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            conn = DriverManager.getConnection(URL, USER, PASS);
//            System.out.println("Successfully connected to the database.");
//        } catch (Exception e) {
//            System.out.println("Failed to connect to the database.");
//            e.printStackTrace(); // Print stack trace for debugging
//            throw new RuntimeException("Failed to connect to the database.", e);
//        }
//        return conn;
//    }

}
