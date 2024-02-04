<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - ToDo</title>
<%@include file="components/allcss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-8 mx-auto">
				<form action="LoginServlet" method="post" class="row g-3">
				<h2 class="mt-5">Login</h2>
				<hr/>
					<div class="col-md-12">
						<label for="inputEmail4" class="form-label">Email</label> <input name="email"
							type="email" class="form-control" id="inputEmail4">
					</div>
					<div class="col-md-12">
						<label for="inputPassword4" class="form-label">Password</label> <input name="password"
							type="password" class="form-control" id="inputPassword4">
					</div>
					
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign in</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</body>
<%@include file="components/alljs.jsp"%>
</html>