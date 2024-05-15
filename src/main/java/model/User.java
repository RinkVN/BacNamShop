/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author datla
 */
public class User {

    private int id;
    private String name;
    private String email;
    private String verified_email;
    private String password;
    private String phno;
    private String address;
    private String state;
    private String city;
    private String zipCode;

    public User(int id, String name, String email, String verified_email, String password, String phno, String address, String state, String city, String zipCode) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.verified_email = verified_email;
        this.password = password;
        this.phno = phno;
        this.address = address;
        this.state = state;
        this.city = city;
        this.zipCode = zipCode;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", email=" + email + ", verified_email=" + verified_email + ", password=" + password + ", phno=" + phno + ", address=" + address + ", state=" + state + ", city=" + city + ", zipCode=" + zipCode + '}';
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getzipCode() {
        return zipCode;
    }

    public void setzipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public User() {
        super();
    }

}
