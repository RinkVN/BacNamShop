/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package controller;

import model.User;

/**
 *
 * @author datla
 */
public interface UserDAO {

    public boolean userRegister(User us);

    public User login(String email, String password);

    public boolean checkPassword(int id, String ps);

    public User getUserById(int id);

    public boolean checkout(User us);

    public boolean checkUser(String email);

    public boolean changePassword(User us);

    public boolean checkPassword(String password);
}
