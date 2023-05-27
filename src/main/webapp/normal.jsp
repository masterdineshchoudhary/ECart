
<%@page import="com.ecart.entities.User" %>
<% 
	User user = (User) session.getAttribute("current-user");
	if(user==null) {
		session.setAttribute("message", "You're not logged In ! Login first.");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if(user.getUserType().equals("admin")) {
			session.setAttribute("message", "You're admin ! Please access admin page.");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal User Panel</title>
<%@ include file="components/all_css_js.jsp"%>
</head>
<body>
<%@ include file="components/navbar.jsp"%>
	<!-- <h1>Normal User Panel</h1> -->
	<% response.sendRedirect("index.jsp"); %>
<%@ include file="components/footer.jsp"%>
</body>
</html>