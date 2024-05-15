/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Order;

/**
 *
 * @author datla
 */
public class OrderDAOimpl implements OrderDAO {

    private Connection conn;

    public OrderDAOimpl(Connection conn) {
        this.conn = conn;
    }

    public int getOrderID() {
        int i = 1;
        try {

            String sql = "Select * from Orders";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public boolean addOrder(List<Order> odlist) {
        boolean f = false;
        try {
            String sql = "INSERT INTO Orders (userID, ProductID, ProductName, QuantityOrder, OrderPrice, ShipAddress, ShipFee, Discount, OrderDate, PaymentMethod) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);

            for (Order od : odlist) {
                ps.setInt(1, od.getUserID());
                ps.setInt(2, od.getProductID());
                ps.setString(3, od.getProductName());
                ps.setInt(4, od.getQuantityOrder());
                ps.setFloat(5, od.getOrderPrice());
                ps.setString(6, od.getFullAddress());
                ps.setFloat(7, od.getShipFee());
                ps.setFloat(8, od.getDiscount());
                ps.setString(9, od.getPaymentMethod());
                ps.addBatch();
            }
            int[] count = ps.executeBatch();
            conn.commit();
            f = true;   
            conn.setAutoCommit(true);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
