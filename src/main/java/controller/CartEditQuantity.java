/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.ProductInfo;

/**
 *
 * @author datla
 */
public class CartEditQuantity extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditQuantity</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditQuantity at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productID = Integer.parseInt(request.getParameter("productID"));
            int userID = Integer.parseInt(request.getParameter("userID"));

            ProductDAOimpl productDAO = new ProductDAOimpl(DBContext.getConn());
            ProductInfo product = productDAO.getProductById(productID);
            if (product != null && product.getUnitsInStock() >= quantity) {
                Cart c = new Cart();
                c.setProductID(productID);
                c.setUserID(userID);
                c.setQuantity(quantity);

                CartDAOimpl dao2 = new CartDAOimpl(DBContext.getConn());
                boolean success = dao2.updateCartQuantity(c);

                HttpSession session = request.getSession();
                if (success) {
                    response.sendRedirect("product-detail/v1.14.0/cart.jsp");
                } else {
                    session.setAttribute("failMess", "Failed to Update Cart");
                    response.sendRedirect("product-detail/v1.14.0/cart.jsp");
                }
            } else {
                // S? l??ng t?n kho không ??
                HttpSession session = request.getSession();
                session.setAttribute("failMess", "Not enough stock available");
                response.sendRedirect("product-detail/v1.14.0/cart.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
