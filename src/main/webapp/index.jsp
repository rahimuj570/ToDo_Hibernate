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

				<form class="row g-3">
					<div class="col-md-12">
						<label for="inputEmail4" class="form-label">Headline</label> <input required
							name="headline" type="text" class="form-control" id="headline">
					</div>
					<div class="col-md-6">
						<label for="inputPassword4" class="form-label">Date</label> <input required
							type="date" class="form-control" id="date" name="date">
					</div>
					<div class="col-6">
						<label for="inputAddress" class="form-label">Time</label> <input required
							type="time" class="form-control" id="time" name="time">
					</div>
					<div class="col-12 align-items-center">
						<label for="inputAddress2" class="form-label">Details</label> <br />
						<textarea class="w-100" id="details"></textarea>
					</div>

					<div class="col-12">
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>


			</div>
		</div>
	</div>

</body>
<%@include file="components/alljs.jsp"%>
<script type="text/javascript">
	function digitCount(a) {
		return String(a).length;
	}
	const d = new Date();
	let year = d.getFullYear();
	let month = digitCount((parseInt(d.getMonth()) + 1)) == 2 ? (parseInt(d
			.getMonth()) + 1) : ("0" + (parseInt(d.getMonth()) + 1));
	let date = digitCount(parseInt(d.getDate())) == 2 ? d.getDate() : ("0" + d
			.getDate());
	document.getElementById("date").setAttribute("min", year+"-"+month+"-"+date);
	let current_time = d.toLocaleString("en-US",{
		hour12: false,
		hour:'2-digit',
		minute:"2-digit"
	})
	let timeNode = document.getElementById("time");
	timeNode.setAttribute("min", current_time);
</script>
</html>