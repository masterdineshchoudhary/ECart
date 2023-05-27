<%@page import="com.ecart.helper.Helper"%>
<%@page import="com.ecart.entities.Category"%>
<%@page import="com.ecart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecart.dao.ProductDao"%>
<%@page import="com.ecart.helper.FactoryProvider"%>
<%@page import="com.ecart.entities.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ECart:Home</title>
<style type="text/css">
body {
	overflow-x: hidden;
}
</style>
<%@ include file="components/all_css_js.jsp" %>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
	<%-- <h1>Hello, world!</h1>
	<%
	out.println(FactoryProvider.getFactory());
	%> --%>
	
	<div class="row mt-3 mx-2">
	<%
		String cat = request.getParameter("category");
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = null;
		if (cat==null || cat.trim().equals("all")) {
			list = dao.getAllProducts();
		} else {
			int cid = Integer.parseInt(cat.trim());
			list = dao.getAllProductById(cid);
		}
		
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
	%>
		<!-- show categories -->
		<div class="col-md-2">
		
			<div class="list-group">
  				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Category</a>
				<%
					for(Category category : clist) {
						%>
  						<a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>
						<%
					}
				%>
			</div>
		</div>
		<!-- show products -->
		<div class="col-md-8">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
						<!-- traversing products -->
						<%
							for(Product product : list) {
								%>
								<div class="card">
  									
    									<img class="card-img-top" src="img/products/<%= product.getProductPhoto() %>" alt="Card image cap">
  										<div class="card-body">
    									<h5 class="card-title"><%= product.getProductName() %></h5>
    									<p class="card-text"><%= Helper.get10Words(product.getProductDescription()) %></p>
    									<div class="container">
    									<h6 href="#" class="text">Price: &#8377;<%= product.getProductPrice() %></h6>
    									<p class="text-secondary" style="font-size: 15px; font-style: italic;">-<%= product.getProductDiscount()%>% Off</p>
    									
    									<h4 href="#" class="text">&#8377;<%= product.getPriceAfterDiscount() %></h4>
    									<button class="btn btn-primary" onclick="addToCart(<%= product.getProductId() %>, '<%= product.getProductName() %>', <%= product.getPriceAfterDiscount()%>)">Add to Cart</button>
    									</div>
  									</div>
								</div>
								<%
							}
							if(list.size()==0) {
								out.println("<h4>No Items Found</h4>");
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="components/common_modals.jsp" %>
<%@ include file="components/footer.jsp" %>

</body>
</html>