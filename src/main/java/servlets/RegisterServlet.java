package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public RegisterServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name").strip();
		String email = request.getParameter("email").strip();
		String password = request.getParameter("password").strip();
		String gender = request.getParameter("gender");

		HttpSession sc = request.getSession();
		if (name.equals("") || email.equals("") || password.equals("") || gender.equals("0")) {
			response.sendRedirect("register.jsp");
			sc.setAttribute("reg-empty", "Must Fill All The Data!");
		} else {
			if (sc.getAttribute("reg-empty") != null) {
				sc.removeAttribute("reg-empty");
			}
		}

		System.out.println(name + " " + email + " " + password + " " + gender);
	}

}
