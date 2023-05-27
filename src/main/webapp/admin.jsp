<%@page import="com.ecart.helper.Helper"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.ecart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.ecart.helper.FactoryProvider"%>
<%@page import="com.ecart.dao.CategoryDao"%>
<%@page import="com.ecart.entities.User" %>
<% 
	User user = (User) session.getAttribute("current-user");
	if(user==null) {
		session.setAttribute("message", "You're not logged In ! Login first.");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if(user.getUserType().equals("normal")) {
			session.setAttribute("message", "You're not admin ! Do not access this page.");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

<%
	CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
   	List<Category> list = cDao.getCategories();	
   	
   	// getting count
   	Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@ include file="components/all_css_js.jsp"%>
<style type="text/css">
.card {
	border-radius: 50px;
}
.card:hover {
	background-color: #fafafa;
	cursor: pointer;
}
</style>
</head>
<body>
<%@ include file="components/navbar.jsp"%>
	<div class="container text-center mt-4">
		<h1>Admin Panel</h1>
	</div>
	<div class="container-fluid">
		<%@include file="components/message.jsp" %>
	</div>
	<div class="container p-5 text-center">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<img class="img-fluid" style="max-width:100px;" src="img/users.png" alt="users" />
						<h1><%= m.get("userCount") %></h1>
						<h1 class="text-muted">Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<img class="img-fluid" style="max-width:100px;" src="img/categories.png" alt="categories" />
						<h1><%= list.size() %></h1>
						<h1 class="text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<img class="img-fluid" style="max-width:100px;" src="img/products.png" alt="products" />
						<h1><%= m.get("productCount") %></h1>
						<h1 class="text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add_Category_Modal">
					<div class="card-body">
						<img class="img-fluid" style="max-width:100px;" src="img/add_category.png" alt="add_category" />
						<p>Click here to Add new Category.</p>
						<h1 class="text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add_Products_Modal">
					<div class="card-body">
						<img class="img-fluid" style="max-width:100px;" src="img/add_product.png" alt="add_product" />
						<p>Click here to Add new Product.</p>
						<h1 class="text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<!-- Start Category Modal -->
<div class="modal fade" id="add_Category_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
      </div>
      <div class="modal-body">
        <form action="AddOperationServlet" method="post">
    		<input type="hidden" name="operation" value="addCategory">
  			<div class="form-group">
    			<label for="catTitle">Category Title</label>
    			<input type="text" class="form-control" name="catTitle" id="catTitle" required>
  			</div>
  			<div class="form-group">
    			<label for="catDesc">Category Description</label>
    			<textarea style="height:100px;" class="form-control" name="catDesc" id="catDesc" required></textarea>
  			</div>
  			<div class="container text-center">
  			<button type="submit" class="btn btn-success">Add Category</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>  			
  			</div>
		</form>
      </div>
    </div>
  </div>
</div>
<!-- End Category Modal -->


<!-- Start Product Modal -->
<div class="modal fade" id="add_Products_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fill Products Details</h5>
      </div>
      <div class="modal-body">
        <form action="AddOperationServlet" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="operation" value="addProduct">
  			<div class="form-group">
    			<label for="proName">Product Name</label>
    			<input type="text" class="form-control" name="proName" id="proName" required>
  			</div>
  			<div class="form-group">
    			<label for="proDesc">Product Description</label>
    			<textarea style="height:100px;" class="form-control" name="proDesc" id="proDesc" required></textarea>
  			</div>
  			<div class="form-group">
    			<label for="proPhoto">Add Photo</label>
    			<input type="file" class="form-control-file" name="proPhoto" id="proPhoto" required>
  			</div>
  			<div class="row">
  			<div class="col-md-4">
  			<div class="form-group">
    			<label for="proPrice">Price</label>
    			<input type="number" class="form-control" name="proPrice" id="proPrice" required>
  			</div></div>
  			<div class="col-md-4">
  			<div class="form-group">
    			<label for="proDiscount">Discount</label>
    			<input type="number" class="form-control" name="proDiscount" id="proDiscount" required>
  			</div></div>
  			<div class="col-md-4">
  			<div class="form-group">
    			<label for="proQuantity">Quantity</label>
    			<input type="number" class="form-control" name="proQuantity" id="proQuantity" required>
  			</div></div>	
  			
  			
  			
  			<div class="col-md-4">
  			<div class="form-group">
    			<label for="proCat">Select Category</label>
    			<select class="form-control" name="proCat" id="proCat" required="required">
    				<%
    					for(Category c: list) {
    				%>
    				<option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
    				<%
    					}
    				%>
    			</select>
  			</div></div>	
  			</div>
  			<div class="container text-center">
  			<button type="submit" class="btn btn-success">Add Product</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>  			
  			</div>
		</form>
      </div>
    </div>
  </div>
</div>
<!-- End Product Modal -->

<%@ include file="components/common_modals.jsp" %>
<%@ include file="components/footer.jsp"%>
</body>
</html>