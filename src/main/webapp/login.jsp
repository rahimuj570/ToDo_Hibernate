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
	<div style="position:relative;" class="container">

		<div id="load" class="spinner-border "
			style="border-radius: 50%; border-top: 16px solid blue; border-right: 16px solid green; border-bottom: 16px solid red; border-left: 16px solid pink; width: 150px; height: 150px; position: absolute; top: 25%; left: 30%;">
		</div>

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
let load=document.getElementById("load");
load.style.visibility="hidden";
	document.getElementById("login_form").addEventListener("submit",(e)=>{
		load.style.visibility="visible";
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
				load.style.visibility="hidden";
			}
		}}
		ajx.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		ajx.send("email="+email+"&password="+password);
	})
</script>
</html>