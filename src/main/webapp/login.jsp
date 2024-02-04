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
				<form id="login_form" action="LoginServlet" method="post"
					class="row g-3">
					<h2 class="mt-5">Login</h2>
					<hr />
					<div class="col-md-12">
						<label for="inputEmail4" class="form-label">Email</label> <input
							name="email" type="email" class="form-control" id="email">
					</div>
					<div class="col-md-12">
						<label for="inputPassword4" class="form-label">Password</label> <input
							name="password" type="password" class="form-control"
							id="password">
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
<script type="text/javascript">
	document.getElementById("login_form").addEventListener("submit",(e)=>{
		e.preventDefault();
		const email= document.getElementById("email").value;
		const password= document.getElementById("password").value;
		const ajx= new XMLHttpRequest();
		ajx.open("post","LoginServlet");
		ajx.onreadystatechange=function(){
			if(this.readyState===4){ if( this.status===200 && this.responseText===""){
					location="/ToDo_maven_hibernate";
			}else{
				if(this.status!=200){
					alert("Something Went wrong!")
				}
				if(this.responseText!==""){
					alert(this.responseText)
				}
			}
		}}
		ajx.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		ajx.send("email="+email+"&password="+password);
	})
</script>
</html>