/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import controller.ProductDAOimpl;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import model.ProductInfo;

/**
 *
 * @author datla
 */
@MultipartConfig
public class EditProduct extends HttpServlet {

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
            out.println("<title>Servlet EditProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProduct at " + request.getContextPath() + "</h1>");
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
            String productName = request.getParameter("pname");
            String price = request.getParameter("price");
            String sku = request.getParameter("sku");
            Part part = request.getPart("pimg");
            String fileName = part.getSubmittedFileName();
            int unitsInStock = Integer.parseInt(request.getParameter("unitsInStock"));
            String description = request.getParameter("description");
            String status = request.getParameter("pstatus");
            String categoryName = request.getParameter("categoryName");
            String newCategory = request.getParameter("newCategory");

            ProductInfo p = new ProductInfo();
            p.setProductName(productName);
            p.setPrice(price);
            p.setSku(sku);
            p.setProductPhoto(fileName);
            p.setUnitsInStock(unitsInStock);
            p.setDescription(description);
            p.setStatus(status);
            p.setCategoryName(categoryName);
            p.setNewCategory(newCategory);

            ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
            boolean f = d.editProduct(p);

            HttpSession session = request.getSession();
            if (f) {
                String path = getServletContext().getRealPath("") + File.separator + "img";
                File file = new File(path);
                part.write(path + File.separator + fileName);

                session.setAttribute("succMess", "Product Added Successfully");
                response.sendRedirect("admin/all-products.jsp");
            } else {
                session.setAttribute("failMess", "Something Wrong");
                response.sendRedirect("admin/edit-product.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failMess", "Error");
            response.sendRedirect("admin/edit-product.jsp");
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
