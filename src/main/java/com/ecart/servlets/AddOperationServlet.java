package com.ecart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.ProductDao;
import com.ecart.entities.Category;
import com.ecart.entities.Product;
import com.ecart.helper.FactoryProvider;

@MultipartConfig
public class AddOperationServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String op = request.getParameter("operation");
		
		if (op.trim().equals("addCategory")) {
			// ADD CATEGORY
			// Fetching Category data
			String title = request.getParameter("catTitle");
			String description = request.getParameter("catDesc");
			
			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			
			// Save Category in Database
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			int catId = categoryDao.saveCategory(category);
//			out.println("Category Saved, Id is " + catId);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Category Added Successfully, Category ID: "+catId);
			response.sendRedirect("admin.jsp");
			return;
			
		} else if (op.trim().equals("addProduct")) {
			// ADD PRODUCT
			// Fetching Product data
			String name = request.getParameter("proName");
			String description = request.getParameter("proDesc");
			Part part = request.getPart("proPhoto");
			int price = Integer.parseInt(request.getParameter("proPrice"));
			int discount = Integer.parseInt(request.getParameter("proDiscount"));
			int quantity = Integer.parseInt(request.getParameter("proQuantity"));
			int category = Integer.parseInt(request.getParameter("proCat"));
			
			Product product = new Product();
			product.setProductName(name);
			product.setProductDescription(description);
			product.setProductPhoto(part.getSubmittedFileName());
			product.setProductPrice(price);
			product.setProductDiscount(discount);
			product.setProductQuantity(quantity);
			
			
			// Get Category by Id
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			Category categoryId = categoryDao.getCategoryById(category);
			product.setCategory(categoryId);
//			out.println("Category Saved, Id is " + catId);
			
			// Save Product
			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			pDao.saveProduct(product);
			
			// Photo upload
			// find out the path to upload photo
			String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
			System.out.println("path is " + path);
			
			try {
				// Uploading code
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
				// Reading data
				byte data[] = new byte[is.available()];
				is.read(data);
				
				// Writing data
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//			out.println("Product saved Successfully!");
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Product Added Successfully");
			response.sendRedirect("admin.jsp");
			return;
		}
		
		
	}

}
