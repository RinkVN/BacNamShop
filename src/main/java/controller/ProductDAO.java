/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package controller;

import java.util.List;
import model.ProductInfo;
import model.VariantInfo;

/**
 *
 * @author datla
 */
public interface ProductDAO {

    public boolean addProduct(ProductInfo p);

    public boolean addVariant(VariantInfo v);

    public ProductInfo getNewProductId();

    public List<ProductInfo> getAllProduct();

    public List<ProductInfo> getFlashSaleProduct();

    public List<ProductInfo> getPopularProduct();
            
    public List<VariantInfo> getProductSubphoto(int id);

    public List<VariantInfo> getProductColor(int id);
    
    public List<VariantInfo> getSizeMaterial(int id);

    public ProductInfo getProductById(int id);
    
    public VariantInfo getVariantByProductId(int id);

    public boolean editProduct(ProductInfo p);
    
    public boolean editVariant(VariantInfo v);

    public boolean deleteProduct(int id);
    
    public List<ProductInfo> getSearchProduct (String ch);

//    public List<ProductInfo> getRecentBook();
//
//    public List<ProductInfo> getOldBook();
//
//    public List<ProductInfo> getAllNewBooks();
//
//    public List<ProductInfo> getAllRecentBooks();
//
//    public List<ProductInfo> getAllOldBooks();
}
