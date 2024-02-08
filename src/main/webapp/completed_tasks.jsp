<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Todo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TodoDao"%>
<%@page import="entities.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
int count = 0;
Users u = (Users) session.getAttribute("current_user");
TodoDao dao = new TodoDao();
ArrayList<Todo> todos = dao.getCompletedTodo(u.getUser_id());
count = todos.size();
%>
<title>Missed Tasks (<%=count%>)
</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-8 mx-auto mt-5">
				<div class="text-center">
					<h3 class="mb-2">
						Completed Task (<%=count%>)
					</h3>
					<div id="refresh_loader" style="cursor: pointer;">
						<i class="fa-solid fa-rotate-right fa-2xl"></i>
					</div>
				</div>
				<div class="list-group mt-2 mb-5">

					<%
					if (todos.isEmpty())
						out.print("<center class=\"mt-2\">0 pending Task</center>");
					for (Todo t : todos) {
					%>

					<div style="cursor: pointer;"
						class="mb-2 list-group-item list-group-item-action"
						aria-current="true">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1"><%=t.getTodo_headline()%></h5>
							<button title="1day will extend" onclick="retrive_todo(<%=t.getTodo_id()%>)"
								class="btn btn-danger">Delete</button>
						</div>
						<p class="mb-1"><%=t.getTodo_details()%></p>
						<small> <%
 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
 Date d2 = sdf2.parse(t.getTodo_date());
 String date = new SimpleDateFormat("EEE, MMM d, yyyy").format(d2);
 out.print(date);
 %> || <%
 SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
 Date d = sdf.parse(t.getTodo_time());
 String time = new SimpleDateFormat("hh:mm aa").format(d);
 out.print(time);
 %>
						</small>
					</div>

					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>

</body>
<%@include file="components/alljs.jsp"%>
<script type="text/javascript">
let retrive_todo=(id)=>{
	location="DeleteTask?task_id="+id;
}
</script>
</html>