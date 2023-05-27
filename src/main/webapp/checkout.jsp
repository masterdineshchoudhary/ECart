<%
User user = (User) session.getAttribute("current-user");
if(user==null) {
	session.setAttribute("message", "You're not logged In ! Login to access Checkout Page.");
	response.sendRedirect("login.jsp");
	return;
}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout Page</title>
<%@ include file="components/all_css_js.jsp" %>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Your selected Items</h4>
						<div class="cart-body">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Enter you Details</h4>
						<form>
						  <div class="form-group">
						    <label for="name">Name</label>
						    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" placeholder="Enter name" required>
						  </div>
						  <div class="form-group">
						    <label for="email">Email address</label>
						    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="email" placeholder="Enter email" required>
						  </div>
						  <div class="form-group">
						    <label for="phone">Phone Number</label>
 						   <input value="<%= user.getUserMobile() %>" type="number" class="form-control" id="phone" placeholder="Enter Phone Number" required>
						  </div>
						  <div class="form-group">
						    <label for="address">Shipping Address</label>
 						   <textarea value="<%= user.getUserAddress() %>" class="form-control" id="address" placeholder="Enter Address" required></textarea>
						  </div>
						<div class="container text-center">
						  <button type="submit" class="btn btn-success">Place Order</button>
						  <button type="submit" class="btn btn-primary">Continue Shopping</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="components/common_modals.jsp" %>
<%@ include file="components/footer.jsp" %>
</body>
</html>