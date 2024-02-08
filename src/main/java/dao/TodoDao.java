package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.MutationQuery;
import org.hibernate.query.Query;

import entities.Todo;
import helper.HibernateFactory;

public class TodoDao {

	boolean isExpired(String date, String time) {
		boolean f = false;
		Date currentDate = new Date();
		String prevDateinString = date + " " + time;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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

	public ArrayList<Todo> getExpiredTodo(int uid) {
		ArrayList<Todo> todos = new ArrayList<Todo>();
		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("from Todo t where t.isExpired=true", Todo.class);
		todos = (ArrayList<Todo>) q.list();
		s.close();
		return todos;
	}

	public int retriveTodo(int todo_id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:MM");
		Date d = new Date();
		d.setTime(d.getTime()+24*60*60*1000);
		String newDate = sdf.format(d);
		String newTime = sdf2.format(d);

		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		MutationQuery q = s.createMutationQuery(
				"update Todo set isExpired=false, todo_time=:newTime, todo_date=:newDate where todo_id=:todoId");
		q.setParameter("todoId", todo_id);
		q.setParameter("newTime", newTime);
		q.setParameter("newDate", newDate);
		int res = q.executeUpdate();
		tx.commit();
		s.close();
		return res;
	}

	public ArrayList<Todo> getAllTodo(int uid) {
		ArrayList<Todo> todos = new ArrayList<Todo>();
		ArrayList<Todo> finalTodos = new ArrayList<Todo>();

		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		String query = "from Todo t where t.user_id=:user_id and t.isExpired =false and t.isDone=false";
		Query q = s.createQuery(query, Todo.class);
		q.setParameter("user_id", uid);
		todos = (ArrayList<Todo>) q.list();
		s.close();
		for (Todo t : todos) {
			if (isExpired(t.getTodo_date(), t.getTodo_time())) {
				System.out.println("tttttttttt");
				Session s2 = sf.openSession();
				String query2 = "update Todo set isExpired=:t where todo_id=:todo_id";
				MutationQuery q2 = s2.createMutationQuery(query2);
				q2.setParameter("todo_id", t.getTodo_id());
				q2.setParameter("t", true);
				Transaction tx = s2.beginTransaction();
				q2.executeUpdate();
				tx.commit();
				s2.close();
			} else {
				finalTodos.add(t);
			}
		}

//		System.out.println(isExpired("2023/07/09", "10:00"));

		return finalTodos;
	}

}
