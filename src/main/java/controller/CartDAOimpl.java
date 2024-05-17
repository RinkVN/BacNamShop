/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.User;

/**
 *
 * @author datla
 */
public class CartDAOimpl implements CartDAO {

    private Connection conn;

    public CartDAOimpl(Connection conn) {
        this.conn = conn;
    }

    public boolean addCart(Cart c) {
        boolean f = false;
        try {
            String sql = "Insert into cart(ProductID,userID,ProductName,ProductColor,Size,price,Quantity,totalPrice,Discount,DiscountCode) "
                    + "values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getProductID());
            ps.setInt(2, c.getUserID());
            ps.setString(3, c.getProductName());
            ps.setString(4, c.getProductColor());
            ps.setString(5, c.getSize());
            ps.setFloat(6, c.getPrice());
            ps.setInt(7, c.getQuantity());
            ps.setFloat(8, c.getTotalPrice());
            ps.setInt(9, c.getDiscount());
            ps.setString(10, c.getDiscountCode());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Cart> getProductByUser(int userID) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        float totalPrice = (float) 0.0;
        try {

            String sql = "SELECT * FROM cart JOIN product ON cart.ProductID = product.ProductID Where userID=?";
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setProductID(rs.getInt(2));
                c.setUserID(rs.getInt(3));
                c.setProductName(rs.getString(4));
                c.setProductColor(rs.getString(5));
                c.setSize(rs.getString(6));
                c.setPrice(rs.getFloat(7));
                c.setQuantity(rs.getInt(8));
                c.setTotalPrice(rs.getFloat("Price") * rs.getInt("Quantity"));
                c.setDiscount(rs.getInt(10));
                c.setDiscountCode(rs.getString(11));
                c.setProductPhoto(rs.getString(14));

                list.add(c);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateCartQuantity(Cart c) {
        boolean f = false;
        try {

            String sql = "UPDATE cart SET quantity = ? WHERE productID = ? AND userID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getQuantity());
            ps.setInt(2, c.getProductID());
            ps.setInt(3, c.getUserID());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateProductColorAndSize(int productID, int userID, String productColor, String size) {
        boolean f = false;
        try {

            String sql = "UPDATE cart SET ProductColor = ?, Size = ? WHERE ProductID = ? AND userID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productColor);
            ps.setString(2, size);
            ps.setInt(3, productID);
            ps.setInt(4, userID);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean isProductInCart(int userID, int productID) {
        String sql = "SELECT COUNT(*) FROM cart WHERE userID = ? AND ProductID = ?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, userID);
            statement.setInt(2, productID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeProduct(int ProductID) {
        boolean f = false;

        try {
            String sql = "Delete From cart Where ProductID=? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ProductID);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
