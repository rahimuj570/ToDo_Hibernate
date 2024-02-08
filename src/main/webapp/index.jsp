<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Users"%>
<%@page import="entities.Todo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ToDo_Hibernate</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto mt-5 px-3 px-md-0">

				<form action="AddTodoServlet" class="row g-3">
					<div class="col-md-12">
						<label for="inputEmail4" class="form-label">Headline</label> <input
							required name="headline" type="text" class="form-control"
							id="headline">
					</div>
					<div class="col-md-6">
						<label for="inputPassword4" class="form-label">Date</label> <input
							required type="date" class="form-control" id="date" name="date">
					</div>
					<div class="col-6">
						<label for="inputAddress" class="form-label">Time</label> <input
							required type="time" class="form-control" id="time" name="time">
					</div>
					<div class="col-12 align-items-center">
						<label for="inputAddress2" class="form-label">Details</label> <br />
						<textarea name="details" class="w-100" id="details"></textarea>
					</div>

					<div class="col-12">
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>


			</div>
		</div>

		<div class="row">
			<div class="col-md-8 mx-auto mt-5">
				<center>
					<h3 class="mb-2">Pending Task</h3>
					<div id="refresh_loader"  style="cursor:pointer;">
						<i class="fa-solid fa-rotate-right fa-2xl"></i>
					</div>
				</center>
				<div class="list-group">

					<%
					Users u = (Users) session.getAttribute("current_user");

					TodoDao dao = new TodoDao();
					ArrayList<Todo> todos = dao.getAllTodo(u.getUser_id());
					for (Todo t : todos) {
					%>

					<div style="cursor: pointer;"
						class="mb-2 list-group-item list-group-item-action"
						aria-current="true">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1"><%=t.getTodo_headline()%></h5>
							<button class="btn btn-success">Done</button>
						</div>
						<p class="mb-1"><%=t.getTodo_details()%></p>
						<small>
							<%
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
	function digitCount(a) {
		return String(a).length;
	}
	let d=new Date();
	let year;
	let month;
	let current_date;
	let date;
	let time_node;
	const refresh=()=>{
		d=new Date();
		year = d.getFullYear();
		month = digitCount((parseInt(d.getMonth()) + 1)) == 2 ? (parseInt(d
				.getMonth()) + 1) : ("0" + (parseInt(d.getMonth()) + 1));
		date = digitCount(parseInt(d.getDate())) == 2 ? d.getDate() : ("0" + d
				.getDate());
		document.getElementById("date").setAttribute("min", year+"-"+month+"-"+date);
		document.getElementById("date").setAttribute("value", year+"-"+month+"-"+date);
		current_time = d.toLocaleString("en-US",{
			hour12: false,
			hour:'2-digit',
			minute:"2-digit"
		})
		timeNode = document.getElementById("time");
		timeNode.setAttribute("min", current_time);
		d.setMinutes(d.getMinutes()+10);
		timeNode.setAttribute("value", d.toLocaleTimeString('en-us',{'hour12':false, hour:'2-digit', minute:"2-digit"}));
		
		console.log("change")
	}
	setInterval(refresh,5000);
	
	year = d.getFullYear();
	month = digitCount((parseInt(d.getMonth()) + 1)) == 2 ? (parseInt(d
			.getMonth()) + 1) : ("0" + (parseInt(d.getMonth()) + 1));
	date = digitCount(parseInt(d.getDate())) == 2 ? d.getDate() : ("0" + d
			.getDate());
	document.getElementById("date").setAttribute("min", year+"-"+month+"-"+date);
	document.getElementById("date").setAttribute("value", year+"-"+month+"-"+date);
	current_time = d.toLocaleString("en-US",{
		hour12: false,
		hour:'2-digit',
		minute:"2-digit"
	})
	timeNode = document.getElementById("time");
	timeNode.setAttribute("min", current_time);
	d.setMinutes(d.getMinutes()+10);
	timeNode.setAttribute("value", d.toLocaleTimeString('en-us',{'hour12':false, hour:'2-digit', minute:"2-digit"}));
	
	
</script>
</html>