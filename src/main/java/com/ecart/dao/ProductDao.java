package com.ecart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecart.entities.Category;
import com.ecart.entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// save product to database
	public boolean saveProduct(Product product) {
		boolean f=false;
		try {
			Session session = this.factory.openSession();
			Transaction t = session.beginTransaction();
			session.save(product);
			t.commit();
			session.close();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	// get all products
	public List<Product> getAllProducts() {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		return list;
	}
	
	// get all product of given category
	public List<Product> getAllProductById(int cid) {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}
}
