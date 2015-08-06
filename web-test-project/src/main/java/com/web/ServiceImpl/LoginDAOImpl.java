package com.web.ServiceImpl;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.Dao.Users;

/**
 * @author ankur
 * 
 */
@Repository
public class LoginDAOImpl {

	@Autowired
	private EntityManagerFactory	entityManager;

	/**
	 * This method is used to authenticate user by spring security's
	 * user-service-ref="loginService"(LoginServiceImpl.class).
	 * 
	 * @param username
	 * @return user
	 */
	public Users findUserByUsername(String username) {
		EntityManager em = this.entityManager.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("userByUsername", Users.class);
		query.setParameter("username", username);
		Users user = (Users) query.getSingleResult();
		em.close();
		return user;

	}
}
