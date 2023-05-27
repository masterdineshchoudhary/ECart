<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@ include file="components/all_css_js.jsp" %>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row mt-5 mb-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<%@ include file="components/message.jsp" %>
				<div class="card-body px-5">
					<h1 class="text-center my-3">Register</h1>
			<form action="RegisterServlet" method="post"> 
				<div class="form-group">
					<label for="exampleInputName1">Name</label> 
					<input name="user_name" type="text" class="form-control" id="exampleInputName1" placeholder="Enter Name">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> 
					<input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> 
					<input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>
				<div class="form-group">
					<label for="exampleInputPhone1">Phone</label> 
					<input name="user_phone" type="number" class="form-control" id="exampleInputPhone1" placeholder="Enter Mobile Number">
				</div>
				<div class="form-group">
					<label for="exampleInputAddress1">Address</label> 
					<textarea name="user_address" style="height:200px;" class="form-control" placeholder="Enter here"></textarea>
				</div>
				Already have an Account ? <a href="login.jsp">Login here.</a>
				<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="submit" class="btn btn-warning">Reset</button>				
				</div>
			</form>
				</div>
			</div>
		</div>
	</div>
	</div>
<%@ include file="components/footer.jsp" %>
</body>
</html>