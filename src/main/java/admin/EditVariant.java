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
import model.VariantInfo;

/**
 *
 * @author datla
 */
@MultipartConfig
public class EditVariant extends HttpServlet {

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
            out.println("<title>Servlet EditVariant</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditVariant at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int variantID = Integer.parseInt(request.getParameter("variantID"));
            String productColor = request.getParameter("productColor");
            String size = request.getParameter("size");
            String material = request.getParameter("material");

            Part part = request.getPart("productSubphoto");
            String fileName = extractFileName(part);

            VariantInfo v = new VariantInfo();
            v.setVariantID(variantID);
            v.setProductSubphoto(fileName); // Update the file name

            v.setProductColor(productColor);
            v.setSize(size);
            v.setMaterial(material);

            ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
            boolean f = d.editVariant(v);

            HttpSession session = request.getSession();
            if (f) {
                String path = getServletContext().getRealPath("") + "img";
                File file = new File(path);
                part.write(path + File.separator + fileName);

                session.setAttribute("succMess", "Variant Updated Successfully");
            } else {
                session.setAttribute("failMess", "Something Wrong");
            }
            response.sendRedirect("admin/all-products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failMess", "Error");
            response.sendRedirect("admin/edit-variant.jsp");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
