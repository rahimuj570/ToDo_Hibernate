package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Todo;
import helper.HibernateFactory;

public class TodoDao {

	boolean isExpired(String date, String time) {
		boolean f = false;
		Date currentDate = new Date();
		String prevDateinString = date + " " + time;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Date prevDate;
		try {
			prevDate = sdf.parse(prevDateinString);
			System.out.println(prevDateinString);
			System.out.println(prevDate);
			System.out.println(currentDate);
			f = prevDate.before(currentDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

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

		System.out.println(isExpired("2023/07/09", "10:00"));

		return todos;
	}

}
