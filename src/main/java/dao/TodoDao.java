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

	public ArrayList<String> getAlldate(int uid) {
		ArrayList<String> alldate = new ArrayList<String>();
		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("select distinct t.todo_date from Todo t where t.user_id=:uid and t.isExpired=false and t.isDone=false", Todo.class);
		q.setParameter("uid", uid);
		alldate = (ArrayList<String>) q.list();
		return alldate;
	}

	public void deleteTodo(int todo_id) {
		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		if (todo_id == 0) {
			MutationQuery q = s.createMutationQuery("delete Todo where isDone=true");
			Transaction tx = s.beginTransaction();
			q.executeUpdate();
			tx.commit();
		} else {
			Todo todo = s.get(Todo.class, todo_id);
			Transaction tx = s.beginTransaction();
			s.remove(todo);
			tx.commit();
		}
		s.close();
	}

	public ArrayList<Todo> getCompletedTodo(int uid) {
		ArrayList<Todo> todos = new ArrayList<Todo>();
		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		Query q = s.createQuery("from Todo t where t.isDone=true", Todo.class);
		todos = (ArrayList<Todo>) q.list();
		s.close();
		return todos;
	}

	public void doneTodo(int todo_id) {
		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		Todo todo = s.get(Todo.class, todo_id);
		todo.setDone(true);
		Transaction tx = s.beginTransaction();
		s.merge(todo);
		tx.commit();
		s.close();
	}

	public int retriveTodo(int todo_id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:MM");
		Date d = new Date();
		d.setTime(d.getTime() + 24 * 60 * 60 * 1000);
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

	public ArrayList<Todo> getAllTodo(int uid, String targetDate) {
		ArrayList<Todo> todos = new ArrayList<Todo>();
		ArrayList<Todo> finalTodos = new ArrayList<Todo>();

		SessionFactory sf = new HibernateFactory().getFactory();
		Session s = sf.openSession();
		String query = null;
		if (targetDate.equals("0")) {
			query = "from Todo t where t.user_id=:user_id and t.isExpired =false and t.isDone=false";
		} else {
			query = "from Todo t where t.todo_date=:targetDate and t.user_id=:user_id and t.isExpired =false and t.isDone=false";
		}
		Query q = s.createQuery(query, Todo.class);
		q.setParameter("user_id", uid);
		if (!targetDate.equals("0"))
			q.setParameter("targetDate", targetDate);
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
