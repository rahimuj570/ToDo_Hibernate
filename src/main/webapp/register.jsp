<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up - ToDo</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-10 mx-auto">
				<form action="RegisterServlet" method="post" class="row g-3">
					<h2 class="mt-5">Register</h2>
					<hr />
					<div class="col-12">
						<label for="inputAddress" class="form-label">Name</label> <input
							name="name" type="text" class="form-control" id="inputAddress"
							placeholder="Rahimujjjaman">
					</div>
					<div class="col-md-6">
						<label for="inputEmail4" class="form-label">Email</label> <input
							name="email" type="email" class="form-control" id="inputEmail4">
					</div>
					<div class="col-md-6">
						<label for="inputPassword4" class="form-label">Password</label> <input
							name="password" type="password" class="form-control"
							id="inputPassword4">
					</div>
					<div class="col-md-4">
						<label for="inputState" class="form-label">Gender</label> <select name="gender"
							id="inputState" class="form-select">
							<option selected value="0">Choose...</option>
							<option value="1">Male</option>
							<option value="2">Female</option>
						</select>
					</div>

					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign Up</button>
					</div>
				</form>
			</div>

		</div>
	</div>

</body>
<%@include file="components/alljs.jsp"%>
<script type="text/javascript">
<%if(session.getAttribute("reg-empty")!=null){%>
alert("<%=session.getAttribute("reg-empty")%>")
<%}%>

</script>
</html>