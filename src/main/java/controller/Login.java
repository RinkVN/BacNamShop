package controller;

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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	
	public String getServletInfo() {
		return null;
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("index.jsp").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			UserDAOImpl d = new UserDAOImpl(DBContext.getConn());
			HttpSession session = request.getSession();

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				response.sendRedirect("admin/all-products.jsp");
			} else {
				User us = d.login(email, password);

				if (!email.contains("@")) {
					session.setAttribute("failMess", "Email must contain '@'");
					response.sendRedirect("login.jsp");
					return; 
				}

				if (us != null) {
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				} else {
					session.setAttribute("email", email);
					session.setAttribute("failMess", "Email & Password Invalid");
					response.sendRedirect("login.jsp");
				}
				response.sendRedirect("admin/home.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
