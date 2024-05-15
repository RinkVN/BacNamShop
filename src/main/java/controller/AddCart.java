package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.ProductInfo;

import java.io.IOException;

import dal.DBContext;
import model.VariantInfo;

public class AddCart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Servlet#getServletInfo()
     */
    public String getServletInfo() {
        // TODO Auto-generated method stub
        return null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int ProductID = Integer.parseInt(request.getParameter("ProductID"));
            int userID = Integer.parseInt(request.getParameter("userID"));
//	            Float price = Float.valueOf(request.getParameter("price"));
//	            Float totalPrice = Float.valueOf(request.getParameter("total_price"));
            String productColor = request.getParameter("productColor");
            String productSize = request.getParameter("productSize");

            ProductDAOimpl dao = new ProductDAOimpl(DBContext.getConn());

            ProductInfo p = dao.getProductById(ProductID);
            VariantInfo variant = dao.getVariantByProductId(ProductID);

            Cart c = new Cart();
            c.setProductID(ProductID);
            c.setUserID(userID);
            c.setProductName(p.getProductName());
            c.setPrice(Float.parseFloat(p.getPrice()));
            c.setTotalPrice(Float.parseFloat(p.getPrice()));
            c.setProductColor(variant.getProductColor());
            c.setSize(variant.getSize());
            c.setQuantity(p.getQuantity());

//            c.setProductColor(productColor);
//            c.setSize(productSize);

            CartDAOimpl dao2 = new CartDAOimpl(DBContext.getConn());

            if (dao2.isProductInCart(userID, ProductID)) {
                HttpSession session = request.getSession();
                session.setAttribute("failMess", "Products already in the cart");
                response.sendRedirect("product-detail/v1.14.0/cart.jsp");
                return;
            }
            boolean f = dao2.addCart(c);

            HttpSession session = request.getSession();

            if (f) {
                session.setAttribute("cartInfo", c);

                session.setAttribute("succMess", "Product Added To Cart");
                response.sendRedirect("product-detail/v1.14.0/cart.jsp");
            } else {
                session.setAttribute("failMess", "Something Wrong");
                response.sendRedirect("product-detail/v1.14.0/cart.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
