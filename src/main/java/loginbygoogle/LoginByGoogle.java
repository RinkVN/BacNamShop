/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package loginbygoogle;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controller.UserDAOImpl;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static loginbygoogle.GoogleUtils.getToken;
import static loginbygoogle.GoogleUtils.getUserInfo;

import model.UserGoogle;

/**
 *
 * @author datla
 */
public class LoginByGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogle user = getUserInfo(accessToken);
        System.out.println(user);

        saveUserToDatabase(user);
        HttpSession session = request.getSession();
        session.setAttribute("userGoogle", user);
        response.sendRedirect("index.jsp");
    }

    private void saveUserToDatabase(UserGoogle user) {

        try (Connection conn = DBContext.getConn()) {
            String sql = "INSERT INTO users (name, email, photo ) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(2, user.getEmail());
                stmt.setString(1, user.getName());
                stmt.setString(3, user.getPicture());

                stmt.executeUpdate();

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
