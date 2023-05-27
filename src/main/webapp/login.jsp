<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="components/all_css_js.jsp"%>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-5 mb-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
			<%@ include file="components/message.jsp" %>
				<div class="card-body px-5">
					<h1 class="text-center my-3">Login</h1>
			<form action="LoginServlet" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						name="email" type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						name="password" type="password" class="form-control" id="exampleInputPassword1"
						placeholder="Password">
				</div>
				Don't have an Account ? <a href="register.jsp">Register here.</a><br>
				<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="components/footer.jsp"%>
</body>
</html>