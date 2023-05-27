package com.ecart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecart.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// save category to database
	public int saveCategory(Category cat) {
		Session session = this.factory.openSession();
		Transaction t = session.beginTransaction();
		int catId = (Integer) session.save(cat);
		t.commit();
		session.close();
		return catId;
	}
	
	public List<Category> getCategories() {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> list = query.list();
		return list;
	}
	
	public Category getCategoryById(int cid) {
		Category cat = null;
		try {
			Session session = this.factory.openSession();
			cat = session.get(Category.class, cid);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
}
