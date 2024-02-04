package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Users;
import helper.HibernateFactory;

public class UsersDao {
	HibernateFactory hfact = new HibernateFactory();
	SessionFactory sfact = new HibernateFactory().getFactory();

	public void addUser(Users u) {
		Session s = sfact.openSession();
		Transaction tx= s.beginTransaction();
		s.persist(u);
		tx.commit();
		s.close();
	}
}
