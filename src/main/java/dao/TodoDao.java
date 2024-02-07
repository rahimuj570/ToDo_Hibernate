package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Todo;
import helper.HibernateFactory;

public class TodoDao {
	
	public void addTodo(Todo todo) {
		SessionFactory sf=new HibernateFactory().getFactory();
		Session s= sf.openSession();
		Transaction tx= s.beginTransaction();
		s.persist(todo);
		tx.commit();
		s.close();
	}
	
//	public ArrayList<Todo> getAllTodo(){
//		
//	}

}
