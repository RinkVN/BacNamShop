/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author datla
 */
public class VariantInfo {

    private int VariantID;
    private int ProductID;
    private String ProductSubphoto;
    private String ProductColor;
    private String ProductColorPhoto;
    private String Size;
    private String Material;

    public VariantInfo() {
        super();
    }
    
    public VariantInfo( int ProductID, String ProductSubphoto, String ProductColor,  String Size, String Material) {
        this.ProductID = ProductID;
        this.ProductSubphoto = ProductSubphoto;
        this.ProductColor = ProductColor;
        this.Size = Size;
        this.Material = Material;
    }

    public VariantInfo(int ProductID, String ProductColorPhoto) {
        this.ProductID = ProductID;
        this.ProductColorPhoto = ProductColorPhoto;
    }

   
    

    public int getVariantID() {
        return VariantID;
    }

    public void setVariantID(int VariantID) {
        this.VariantID = VariantID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductSubphoto() {
        return ProductSubphoto;
    }

    public void setProductSubphoto(String ProductSubphoto) {
        this.ProductSubphoto = ProductSubphoto;
    }

    public String getProductColor() {
        return ProductColor;
    }

    public void setProductColor(String ProductColor) {
        this.ProductColor = ProductColor;
    }

    public String getProductColorPhoto() {
        return ProductColorPhoto;
    }

    public void setProductColorPhoto(String ProductColorPhoto) {
        this.ProductColorPhoto = ProductColorPhoto;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public String getMaterial() {
        return Material;
    }

    public void setMaterial(String Material) {
        this.Material = Material;
    }

    @Override
    public String toString() {
        return "VariantInfo{" + "VariantID=" + VariantID + ", ProductID=" + ProductID + ", ProductSubphoto=" + ProductSubphoto + ", ProductColor=" + ProductColor + ", ProductColorPhoto=" + ProductColorPhoto + ", Size=" + Size + ", Material=" + Material + '}';
    }

    
}
