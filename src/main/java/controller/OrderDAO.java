/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package controller;

import java.util.List;
import model.Order;

/**
 *
 * @author datla
 */
public interface OrderDAO {
    
    public int getOrderID();
    
    public boolean addOrder(List<Order> odlist);
}
