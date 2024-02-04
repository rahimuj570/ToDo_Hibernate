package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Users;
import helper.HibernateFactory;

public class UsersDao {
	HibernateFactory hfact = new HibernateFactory();
	SessionFactory sfact = new HibernateFactory().getFactory();
	Session s;

	public void addUser(Users u) {
		s = sfact.openSession();
		Transaction tx = s.beginTransaction();
		s.persist(u);
		tx.commit();
		s.close();
	}

	public Users isValidUser(String email, String password) {
		Users u;
		s = sfact.openSession();
		String query = "from Users u where u.user_email=:email and u.user_password=:password";
		Query q = s.createQuery(query, Users.class);
		q.setParameter("email", email);
		q.setParameter("password", password);
		u = (Users) q.uniqueResult();
		s.close();
		return u;
	}
}
