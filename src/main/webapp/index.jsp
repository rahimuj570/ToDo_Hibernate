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
				<div class="list-group">
					<div style="cursor:pointer;" class="list-group-item list-group-item-action"
						aria-current="true">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">List group item heading</h5>
							<button class="btn btn-success">Done</button>
						</div>
						<p class="mb-1">Some placeholder content in a paragraph.</p> <small>12-12-2024 2:20 pm</small>
					</div> 
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