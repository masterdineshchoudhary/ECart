package com.ecart.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
	public static String get10Words(String desc) {
		String strs[] = desc.split(" ");
		if (strs.length>10) {
			String res="";
			for (int i = 0; i < 10; i++) {
				res = res + strs[i] + " ";
			}
			return (res+" ....");
 		} else {
			return (desc+" ...");
		}
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		Session session = factory.openSession();
		Query q1 = session.createQuery("Select count(*) from User");
		Query q2 = session.createQuery("Select count(*) from Product");
		
		Long userCount = (Long) q1.list().get(0);
		Long productCount = (Long) q2.list().get(0);
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		
		session.close();
		return map;
	}
}
