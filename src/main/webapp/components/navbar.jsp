<%@page import="entities.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TodoDao"%>
<nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
	<div class="container-fluid">
		<a class="navbar-brand" href="/ToDo_maven_hibernate">ToDo</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/ToDo_maven_hibernate">Home</a></li>

				<%
				Users userNav = new Users();
				userNav = (Users) session.getAttribute("current_user");
				if (userNav != null) {
				%>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Date </a>
					<ul class="dropdown-menu">

						<%
						ArrayList<String> allDate;
						allDate = new TodoDao().getAlldate(userNav.getUser_id());
						for(String s:allDate){
						%>

						<li><a class="dropdown-item" href="<%="?targetDate="+s%>"><%=s %></a></li>
						<%} %>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="index.jsp">View All Pending Tasks</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link"
					href="missed_tasks.jsp">Missed Tasks</a></li>
				<li class="nav-item"><a class="nav-link"
					href="completed_tasks.jsp">Completed Tasks</a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="register.jsp">Sign
						Up</a></li>
				<%
				}
				%>
			</ul>
			<form action="index.jsp" class="d-flex" role="search">
				<input name="search" class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>