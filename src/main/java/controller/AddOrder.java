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
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Order;

/**
 *
 * @author datla
 */
public class AddOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddOrder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddOrder at " + request.getContextPath() + "</h1>");
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
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String PaymentMethod = request.getParameter("paymentmethod");

            String fullAddress = address + "," + city;

            CartDAOimpl dao = new CartDAOimpl(DBContext.getConn());
            List<Cart> list = dao.getProductByUser(id);

            OrderDAOimpl dao2 = new OrderDAOimpl(DBContext.getConn());

            Order aod = new Order();

            ArrayList<Order> orderList = new ArrayList<Order>();
            for (Cart c : list) {
                aod.setUserID(id);
                aod.setProductID(c.getProductID());
                aod.setName(name);
                aod.setProductName(c.getProductName());
                aod.setQuantityOrder(c.getQuantity());
                float orderPrice = c.getPrice() * c.getQuantity();
                aod.setOrderPrice(orderPrice);
                aod.setFullAddress(fullAddress);
                aod.setPaymentMethod(PaymentMethod);
                orderList.add(aod);
                
            }
            HttpSession session = request.getSession();
            
            if ("cod".equals(PaymentMethod)) {
                session.setAttribute("succMess", "Odered Successfully");
                response.sendRedirect("index.jsp");
            } else if ("card".equals(PaymentMethod)) {
                response.sendRedirect("product-detail/v1.14.0/payment.jsp");
            } else {
                boolean f = dao2.addOrder(orderList);
                
                if (f) {
                    System.out.println("controller.AddOrder.doPost()");
                } else {
                    System.out.println("controller.AddOrder.dqwfqwfqw()");
                }
            }

        } catch (Exception e) {
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
