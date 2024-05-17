/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ProductInfo;
import model.VariantInfo;

/**
 *
 * @author datla
 */
public class ProductDAOimpl implements ProductDAO {

    private Connection conn;

    public ProductDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addProduct(ProductInfo p) {
        boolean f = false;

        try {
            String sql = "INSERT INTO product (ProductName, price, sku, ProductPhoto, ProductVideo, UnitsInStock, Description, Status, CategoryName, NewCategory) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getPrice());
            ps.setString(3, p.getSku());
            ps.setString(4, p.getProductPhoto());
            ps.setString(5, p.getProductVideo());
            ps.setInt(6, p.getUnitsInStock());
            ps.setString(7, p.getDescription());
            ps.setString(8, p.getStatus());
            ps.setString(9, p.getCategoryName());
            ps.setString(10, p.getNewCategory());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //    Add Variant ---------------------------------------------
    public boolean addVariant(VariantInfo v) {
        boolean f = false;

        try {
            String sql = "INSERT INTO variant (ProductID, ProductSubphoto,ProductColor, Size, Material) VALUES ( ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, v.getProductID());
            ps.setString(2, v.getProductSubphoto());
            ps.setString(3, v.getProductColor());
            ps.setString(4, v.getSize());
            ps.setString(5, v.getMaterial());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 1) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean editVariant(VariantInfo v) {
        boolean f = false;

        try {
            String sql = "UPDATE variant SET ProductSubphoto=?, ProductColor=?, Size=?, Material=? WHERE ProductID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, v.getProductSubphoto());
            ps.setString(2, v.getProductColor());
            ps.setString(3, v.getSize());
            ps.setString(4, v.getMaterial());
            ps.setInt(5, v.getVariantID());

            int affectedRows = ps.executeUpdate();
            if (affectedRows == 1) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<ProductInfo> getAllProduct() {
        List<ProductInfo> list = new ArrayList<ProductInfo>();
        ProductInfo p = null;
//Where ProductName IS NOT NULL AND Status IS NOT NULL
        try {
            String sql = "Select * From product WHERE Status = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setProductVideo(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setSku(rs.getString(6));
                p.setUnitsInStock(rs.getInt(7));

                p.setDescription(rs.getString(8));
                p.setCategoryName(rs.getString(10));
                p.setNewCategory(rs.getString(11));
                p.setStatus(rs.getString(12));

                p.setQuantity(rs.getInt(13));
                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductInfo> getFlashSaleProduct() {
        List<ProductInfo> list = new ArrayList<>();
        ProductInfo p = null;
        try {
            String sql = "SELECT * FROM product WHERE Status = ? ORDER BY ProductId DESC LIMIT 15";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setProductVideo(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setSku(rs.getString(6));
                p.setUnitsInStock(rs.getInt(7));
                p.setDescription(rs.getString(9));
                p.setCategoryName(rs.getString(10));
                p.setNewCategory(rs.getString(11));
                p.setStatus(rs.getString(12));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductInfo> getPopularProduct() {
        List<ProductInfo> list = new ArrayList<>();
        ProductInfo p = null;
        try {
            String sql = "SELECT * FROM product WHERE ProductID BETWEEN 30 AND 55";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setProductVideo(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setSku(rs.getString(6));
                p.setUnitsInStock(rs.getInt(7));
                p.setDescription(rs.getString(9));
                p.setCategoryName(rs.getString(10));
                p.setNewCategory(rs.getString(11));
                p.setStatus(rs.getString(12));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<VariantInfo> getProductSubphoto(int id) {
        List<VariantInfo> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT VariantID, ProductID, "
                    + "SUBSTRING_INDEX(SUBSTRING_INDEX(ProductSubphoto, ',', numbers.n), ',', -1) AS ProductSubphoto "
                    + "FROM variant "
                    + "CROSS JOIN ( "
                    + "    SELECT (a.a + (10 * b.a)) + 1 AS n "
                    + "    FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL "
                    + "          SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a "
                    + "    CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL "
                    + "                SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b "
                    + ") AS numbers "
                    + "WHERE numbers.n <= (SELECT MAX(LENGTH(ProductSubphoto) - LENGTH(REPLACE(ProductSubphoto, ',', '')) + 1) FROM variant) "
                    + "AND ProductID = ? "
                    + "ORDER BY ProductSubphoto";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VariantInfo v = new VariantInfo();
                v.setVariantID(rs.getInt(1));
                v.setProductID(rs.getInt(2));
                v.setProductSubphoto(rs.getString(3));

                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<VariantInfo> getProductColor(int id) {
        List<VariantInfo> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT VariantID, ProductID, "
                    + "SUBSTRING_INDEX(SUBSTRING_INDEX(ProductColor, ',', numbers.n), ',', -1) AS ProductColor, "
                    + "SUBSTRING_INDEX(SUBSTRING_INDEX(ProductColorPhoto, ',', numbers.n), ',', -1) AS ProductColorPhoto "
                    + "FROM variant "
                    + "CROSS JOIN ( "
                    + "    SELECT (a.a + (10 * b.a)) + 1 AS n "
                    + "    FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL "
                    + "          SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a "
                    + "    CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL "
                    + "                SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b "
                    + ") AS numbers "
                    + "WHERE numbers.n <= (SELECT MAX(LENGTH(ProductColor) - LENGTH(REPLACE(ProductColor, ',', '')) + 1) FROM variant) "
                    + "AND ProductID = ? "
                    + "ORDER BY ProductColorPhoto ;";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VariantInfo v = new VariantInfo();
                v.setVariantID(rs.getInt(1));
                v.setProductID(rs.getInt(2));
                v.setProductColor(rs.getString(3));
                v.setProductColorPhoto(rs.getString(4));

                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<VariantInfo> getSizeMaterial(int id) {
        List<VariantInfo> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT VariantID, ProductID,\n"
                    + "    SUBSTRING_INDEX(SUBSTRING_INDEX(Size, ',', numbers.n), ',', -1) AS Size,\n"
                    + "    SUBSTRING_INDEX(SUBSTRING_INDEX(Material, ',', numbers.n), ',', -1) AS Material\n"
                    + "FROM variant\n"
                    + "CROSS JOIN (\n"
                    + "    SELECT (a.a + (10 * b.a) + (100 * c.a)) + 1 AS n\n"
                    + "    FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL\n"
                    + "          SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a\n"
                    + "    CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL\n"
                    + "                SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b\n"
                    + "    CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL\n"
                    + "                SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c\n"
                    + ") AS numbers\n"
                    + "WHERE numbers.n <= (SELECT MAX(LENGTH(Size) - LENGTH(REPLACE(Size, ',', '')) + 1) FROM variant)\n"
                    + "AND ProductID = ?\n"
                    + "ORDER BY Size ;";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VariantInfo v = new VariantInfo();
                v.setVariantID(rs.getInt(1));
                v.setProductID(rs.getInt(2));
                v.setSize(rs.getString(3));
                v.setMaterial(rs.getString(4));

                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductInfo getProductById(int id) {
        ProductInfo p = null;
        try {
            String sql = "select * from product WHERE ProductID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();

                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setProductVideo(rs.getString(4));
                p.setPrice(rs.getString(5));
                p.setSku(rs.getString(6));
                p.setUnitsInStock(rs.getInt(7));

                p.setDescription(rs.getString(8));
                p.setCategoryName(rs.getString(10));
                p.setNewCategory(rs.getString(11));
                p.setStatus(rs.getString(12));

                p.setQuantity(rs.getInt(13));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public VariantInfo getVariantByProductId(int id) {
        VariantInfo v = null;

        try {
            String sql = "SELECT * FROM variant WHERE ProductID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                v = new VariantInfo();
                v.setProductID(rs.getInt(1));
                v.setProductSubphoto(rs.getString(3));
                v.setProductColor(rs.getString(4));
                v.setSize(rs.getString(6));
                v.setMaterial(rs.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return v;
    }

    public ProductInfo getNewProductId() {
        ProductInfo p = null;
        try {
            String sql = "SELECT MAX(ProductID) FROM product";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

//    Edit Product ---------------------------------------------
    public boolean editProduct(ProductInfo p) {
        boolean f = false;

        try {
            String sql = "UPDATE product SET ProductName=?, ProductPhoto=?, ProductVideo=?, price=?, sku=?, UnitsInStock=?, Description=?, Status=?, CategoryName=?, NewCategory=?, Status=? WHERE ProductID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getProductPhoto());
            ps.setString(3, p.getProductVideo());
            ps.setString(4, p.getPrice());
            ps.setString(5, p.getSku());
            ps.setInt(6, p.getUnitsInStock());
            ps.setString(7, p.getDescription());
            ps.setString(8, p.getStatus());
            ps.setString(9, p.getCategoryName());
            ps.setString(10, p.getNewCategory());
            ps.setString(11, p.getStatus());
            ps.setInt(12, p.getProductID());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //    Delete Product ---------------------------------------------
    public boolean deleteProduct(int id) {
        boolean f = false;
        try {
            String sql = "Delete From product Where ProductId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<ProductInfo> getSearchProduct(String ch) {
        List<ProductInfo> list = new ArrayList<ProductInfo>();
        ProductInfo p = null;
        try {
            String sql = "Select * From product WHERE ProductName LIKE ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + ch + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductInfo();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setProductPhoto(rs.getString(3));
                p.setProductVideo(rs.getString(4));

                p.setPrice(rs.getString(5));
                p.setSku(rs.getString(6));
                p.setUnitsInStock(rs.getInt(7));

                p.setDescription(rs.getString(8));
                p.setCategoryName(rs.getString(9));
                p.setNewCategory(rs.getString(10));
                p.setStatus(rs.getString(11));

                p.setQuantity(rs.getInt(12));
                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //    NEW Product ---------------------------------------------
//
//    //    RECENT Book ---------------------------------------------
//    public List<ProductInfo> getRecentBook() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where status=? Order by BookId ASC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            int i = 1;
//            while (rs.next() && i <= 4) {
//
//                b = new ProductInfo();
//                p.setBookId(rs.getInt(1));
//                p.setBookName(rs.getString(2));
//                p.setAuthor(rs.getString(3));
//                p.setPrice(rs.getString(4));
//                p.setBookCategory(rs.getString(5));
//                p.setStatus(rs.getString(6));
//                p.setPhoto(rs.getString(7));
//                p.setVendor(rs.getString(8));
//                list.add(b);
//                i++;
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//      //    OLD Book ---------------------------------------------
//    Get ProductID for Variant table
//    public ProductInfo getProductId(int id) {
//        ProductInfo b = null;
//        try {
//            String sql = "Select * From book Where bookID = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, id);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                b = new ProductInfo();
//                p.setBookId(rs.getInt(1));
//                p.setBookName(rs.getString(2));
//                p.setAuthor(rs.getString(3));
//                p.setPrice(rs.getString(4));
//                p.setBookCategory(rs.getString(5));
//                p.setStatus(rs.getString(6));
//                p.setPhoto(rs.getString(7));
//                p.setVendor(rs.getString(8));
//                p.setSku(rs.getString(9));
//                p.setDescription(rs.getString(10));
//                p.setDescriptionAuthor(rs.getString(11));
//                p.setPageNumber(rs.getString(12));
//                p.setLanguage(rs.getString(13));
//                p.setPublisher(rs.getString(14));
//                p.setQuantity(rs.getString(15));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return b;
//    }
//
//    //    ALL NEW Book ---------------------------------------------
//    public List<ProductInfo> getAllNewBooks() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where bookCategory=? And status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "New");
//            ps.setString(2, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                b = new ProductInfo();
//                p.setBookId(rs.getInt(1));
//                p.setBookName(rs.getString(2));
//                p.setAuthor(rs.getString(3));
//                p.setPrice(rs.getString(4));
//                p.setBookCategory(rs.getString(5));
//                p.setStatus(rs.getString(6));
//                p.setPhoto(rs.getString(7));
//                p.setVendor(rs.getString(8));
//                list.add(b);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //    RECENT Book ---------------------------------------------
//    public List<ProductInfo> getAllRecentBooks() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                b = new ProductInfo();
//                p.setBookId(rs.getInt(1));
//                p.setBookName(rs.getString(2));
//                p.setAuthor(rs.getString(3));
//                p.setPrice(rs.getString(4));
//                p.setBookCategory(rs.getString(5));
//                p.setStatus(rs.getString(6));
//                p.setPhoto(rs.getString(7));
//                p.setVendor(rs.getString(8));
//                list.add(b);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //    OLD Book ---------------------------------------------
//    public List<ProductInfo> getAllOldBooks() {
//
//        List<ProductInfo> list = new ArrayList<ProductInfo>();
//        ProductInfo b = null;
//
//        try {
//            String sql = "Select * From book Where bookCategory=? And status=? Order by BookId DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, "Old");
//            ps.setString(2, "Active");
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                b = new ProductInfo();
//                p.setBookId(rs.getInt(1));
//                p.setBookName(rs.getString(2));
//                p.setAuthor(rs.getString(3));
//                p.setPrice(rs.getString(4));
//                p.setBookCategory(rs.getString(5));
//                p.setStatus(rs.getString(6));
//                p.setPhoto(rs.getString(7));
//                p.setVendor(rs.getString(8));
//                list.add(b);
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
}
