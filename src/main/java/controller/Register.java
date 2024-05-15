package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dal.DBContext;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String check = request.getParameter("check");

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            HttpSession session = request.getSession();

            if (name.isEmpty() || email.isEmpty() || phno.isEmpty() || password.isEmpty() || repassword.isEmpty()) {
                request.setAttribute("failMess", "Please fill in all fields");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }

//            Validate email
            if (!email.contains("@")) {
                session.setAttribute("name", name);
                session.setAttribute("phno", phno);
                session.setAttribute("password", password);
                session.setAttribute("failMess", "Email must contain '@'");
                response.sendRedirect("register.jsp");
                return;
            }

            // Validate password
            if (password.length() < 8) {
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phno", phno);
                session.setAttribute("failMess", "Password must be at least 8 characters long");
                response.sendRedirect("register.jsp");
                return;
            }
            if (email.equals("admin@gmail.com")) {
                session.setAttribute("failMess", "Gmail admin@gmail.com not allow.");
                response.sendRedirect("register.jsp");
                return;
            }

            if (!password.equals(repassword)) {
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phno", phno);
                session.setAttribute("password", password);
                // Re-Password does not match
                request.setAttribute("failMess", "Re-Password does not match");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            }
            if (check != null) {
                UserDAOImpl d = new UserDAOImpl(DBContext.getConn());
                boolean f = d.checkUser(email);

                if (f) {
                    boolean f2 = d.userRegister(us);
                    if (f2) {
                        session.setAttribute("succMess", "");
                        response.sendRedirect("login.jsp");
                    } else {
                        // Something Wrong
                        session.setAttribute("name", name);
                        session.setAttribute("email", email);
                        session.setAttribute("phno", phno);
                        session.setAttribute("password", password);

                        session.setAttribute("failMess", "Account registration failed");
                        response.sendRedirect("register.jsp");
                    }
                } else {
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    session.setAttribute("phno", phno);
                    session.setAttribute("password", password);

                    session.setAttribute("failMess", "Account already exists");
                    response.sendRedirect("register.jsp");
                }

            } else {
                // Please check Agree
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phno", phno);
                session.setAttribute("password", password);

                session.setAttribute("failMess", "Please check Agree");
                response.sendRedirect("register.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
