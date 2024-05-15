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
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productName = request.getParameter("pname");
            String price = request.getParameter("price");
            String sku = request.getParameter("sku");
            Part part = request.getPart("pimg");
            Part part_video = request.getPart("pvideo");

            String fileName = part.getSubmittedFileName();
            String fileNameVideo = part_video.getSubmittedFileName();

            int UnitsInStock = Integer.parseInt(request.getParameter("unitsInStock"));
            String description = request.getParameter("description");
            String status = request.getParameter("pstatus");
            String categoryName = request.getParameter("categoryName");
            String newCategory = request.getParameter("newCategory");

            ProductInfo p = new ProductInfo(productName, price, sku, fileName, fileNameVideo, UnitsInStock, description, status, categoryName, newCategory);
            ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
            boolean f = d.addProduct(p);

            HttpSession session = request.getSession();
            if (f) {

                // Basic validation: check if required fields are empty or null
//                if (bookName == null || author == null || price == null || categories == null || status == null || part == null || fileName == null || vendor == null || sku == null || description == null || descriptionAuthor == null || pageNumber == null || language == null || publisher == null || quantity == null
//                        || bookName.isEmpty() || author.isEmpty() || categories.isEmpty() || status.isEmpty() || fileName.isEmpty() || vendor.isEmpty() || sku.isEmpty() || description.isEmpty() || descriptionAuthor.isEmpty() || pageNumber.isEmpty() || language.isEmpty() || publisher.isEmpty() || quantity.isEmpty()) {
//                    session.setAttribute("failMess", "Please fill in all required fields");
//                    response.sendRedirect("admin/add-books.jsp");
//                    return;
//                }
                String path = getServletContext().getRealPath("") + "img" + File.separator + "product";
                File file = new File(path);
                part.write(path + File.separator + sku + "_" + fileName);

                String path_video = getServletContext().getRealPath("") + "img" + File.separator + "product";
                File file_video = new File(path_video);
                part_video.write(path_video + File.separator + sku + "_" + "video" + "_" + fileNameVideo);
                System.out.println(fileName + path_video);

                session.setAttribute("succMess", "Product Added Successfully");
                response.sendRedirect("admin/add-variant.jsp");
            } else {
                session.setAttribute("failMess", "Something Wrong");
                response.sendRedirect("admin/add-product.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failMess", "Error");
            response.sendRedirect("admin/add-product.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
