/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.*;
import model.User;

/**
 *
 * @author datla
 */
public class UserDAOImpl implements UserDAO {

    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean userRegister(User us) {
        boolean f = false;

        try {
            String sql = "INSERT INTO users(name,email,phno,password) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public User login(String email, String password) {
        User us = null;

        try {

            String sql = "Select * From users Where email = ? And password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhno(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setState(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setzipCode(rs.getString(9));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    public boolean checkPassword(int id, String ps) {

        boolean f = false;
        try {
            String sql = "Select * From user Where id = ? And password = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, ps);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE userID = ?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setPhno(resultSet.getString(4));
                user.setPassword(resultSet.getString(5));
                user.setAddress(resultSet.getString(6));
                user.setState(resultSet.getString(7));
                user.setCity(resultSet.getString(8));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean checkout(User us) {
        boolean f = false;

        try {
            String sql = "UPDATE users SET name=?, email=?, phno=?, address=?, city=? WHERE userID=?";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, us.getName());
            statement.setString(2, us.getEmail());
            statement.setString(3, us.getPhno());
            statement.setString(4, us.getAddress());
            statement.setString(5, us.getCity());
            statement.setInt(6, us.getId());

            int i = statement.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean changePassword(User us) {
        boolean f = false;

        try {
            String sql = "UPDATE users SET password=? WHERE userID=?";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, us.getPassword());
            statement.setInt(2, us.getId());

            int i = statement.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    public boolean checkUser(String email) {
        boolean f = true;

        try {
            String sql = "Select * From users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean checkPassword(String password) {
        boolean f = true;

        try {
            String sql = "Select * From users WHERE password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
