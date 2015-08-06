package com.web.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.Dao.Users;

@Repository
public class LoginDAOImpl {

	@Autowired
	private SessionFactory	sessionFactory;

	@SuppressWarnings("unchecked")
	public Users findUserByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		List<Users> userList = new ArrayList<Users>();
		// Set<UserRole> userRole = new HashSet<UserRole>(0);

		Query query = session
				.createQuery("select from Users u where u.username = :username");
		query.setParameter("username", username);
		userList = query.list();
		if (userList.size() > 0) {
			return userList.get(0);
		} else {
			return null;
		}

	}
}
