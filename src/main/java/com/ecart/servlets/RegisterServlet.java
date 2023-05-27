package com.ecart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.usertype.UserType;

import com.ecart.entities.User;
import com.ecart.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			PrintWriter out = response.getWriter();
			// validations
			if (userName.isEmpty()) {
				out.println("Name is blank");
				return;
			}

			// creating user object to store data
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
			Session session = FactoryProvider.getFactory().openSession();
			Transaction t = session.beginTransaction();
			int userId = (Integer) session.save(user);
			t.commit();
			session.close();
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration Successful!, User Id is " + userId);
			response.sendRedirect("register.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
