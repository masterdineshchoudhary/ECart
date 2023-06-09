<%@page import="com.ecart.entities.User" %>
<%
	User user1 = (User) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="index.jsp">MyCart</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Categories </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Laptop</a> <a
						class="dropdown-item" href="#">Mobiles</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
		</form>
		<ul class="navbar-nav ml-auto">
		<li class="nav-item active">
		<a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"> <i class="fa-solid fa-cart-plus" style="font-size: 30px;"></i><span class="cart-items">(0)</span>  </a>
		</li>
		
		<%
			if(user1==null) {
				%>
				<li><a class="dropdown-item" href="login.jsp">Login</a></li>
				<li><a class="dropdown-item" href="register.jsp">Register</a></li>	
				<%
			} else {
				%>
				<li><a class="dropdown-item" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"><%= user1.getUserName() %></a></li>
				<li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>	
				<%				
			}
		
		%>
		
		</ul>
	</div>
</nav>