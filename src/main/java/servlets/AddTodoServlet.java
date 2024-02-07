package servlets;

import java.io.IOException;

import dao.TodoDao;
import entities.Todo;
import entities.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddTodoServlet
 */
public class AddTodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTodoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String headline = request.getParameter("headline");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		String details = request.getParameter("details");

		HttpSession sc = request.getSession();
		Users u = (Users) sc.getAttribute("current_user");
		if (u != null) {
			Todo todo = new Todo();
			todo.setTodo_date(date);
			todo.setTodo_details(details);
			todo.setTodo_headline(headline);
			todo.setTodo_time(time);
			todo.setUser_id(u.getUser_id());
			System.out.println(todo);
			new TodoDao().addTodo(todo);
		}

		response.sendRedirect("/ToDo_maven_hibernate");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
