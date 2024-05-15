/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author datla
 */
public class Order {

    private int OrderID;
    private int userID;
    private int ProductID;
    private String name;
    private String ProductName;
    private int QuantityOrder;
    private float OrderPrice;
    private float Discount;
    private String OrderDate;
    private String fullAddress;
    private float ShipFee;
    private String PaymentMethod;

    public Order() {
        super();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getQuantityOrder() {
        return QuantityOrder;
    }

    public void setQuantityOrder(int QuantityOrder) {
        this.QuantityOrder = QuantityOrder;
    }

    public float getOrderPrice() {
        return OrderPrice;
    }

    public void setOrderPrice(float OrderPrice) {
        this.OrderPrice = OrderPrice;
    }

    public float getDiscount() {
        return Discount;
    }

    public void setDiscount(float Discount) {
        this.Discount = Discount;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }
   
    public float getShipFee() {
        return ShipFee;
    }

    public void setShipFee(float ShipFee) {
        this.ShipFee = ShipFee;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    @Override
    public String toString() {
        return "Order{" + "OrderID=" + OrderID + ", userID=" + userID + ", ProductID=" + ProductID + ", name=" + name + ", ProductName=" + ProductName + ", QuantityOrder=" + QuantityOrder + ", OrderPrice=" + OrderPrice + ", Discount=" + Discount + ", OrderDate=" + OrderDate + ", fullAddress=" + fullAddress + ", ShipFee=" + ShipFee + ", PaymentMethod=" + PaymentMethod + '}';
    }

   

}
