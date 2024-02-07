package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Todo;
import helper.HibernateFactory;

public class TodoDao {

	public void addTodo(Todo todo) {
		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		s.persist(todo);
		tx.commit();
		s.close();
	}

	public ArrayList<Todo> getAllTodo(int uid) {
		ArrayList<Todo> todos = new ArrayList<Todo>();

		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		String query = "from Todo t where t.user_id=:user_id";
		Query q = s.createQuery(query, Todo.class);
		q.setParameter("user_id", uid);
		todos = (ArrayList<Todo>) q.list();
		s.close();
		return todos;
	}

}
