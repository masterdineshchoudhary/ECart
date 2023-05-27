package com.ecart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecart.dao.UserDao;
import com.ecart.entities.User;
import com.ecart.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String  email = request.getParameter("email");
		String  password = request.getParameter("password");
		
		// validations
		// authenticating user
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		User user = userDao.getUserByEmailandPassword(email, password);
//		System.out.println(user);
		HttpSession httpSession = request.getSession();
		if (user==null) {
			httpSession.setAttribute("message", "Invalid User Details!, Try Again.");
			response.sendRedirect("login.jsp");
			return;
		} else {
			out.println("<h1>Welcome " + user.getUserName()+"</h1");
			
			// login
			httpSession.setAttribute("current-user", user);
			
			if (user.getUserType().equals("admin")) {
				// Admin user - admin.jsp
				response.sendRedirect("admin.jsp");
			} else if (user.getUserType().equals("normal")) {
				// Normal user - normal.jsp
				response.sendRedirect("normal.jsp");
			} else {
				out.println("User's type not Identified");
			}
			
		}
	}

}
