<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Apply to ${job.jobName}</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<jsp:include page="includes/header.jsp" />
		<div style="margin-top:5%"/>
		
		<h2>
			<center> Apply to ${job.jobName}</center>
		</h2>
		<div class="container">
			<form method="post" action="apply" class="form-add">
				<div class="col-md-6">
					<input type="hidden" name="jobid" value="${job.jobId}">
					<label> First Name: </label>
					<input placeholder="First Name" maxlength=100 class="form-add-control" name="firstName" type="text" required="">
					<label> Surname:</label>
					<input placeholder="Surname" class="form-add-control" name="surname" type="text" required="">
					<label> Drivers Licence: </label>
					<input placeholder="Drivers Licence" class="form-add-control" name="licence" type="number" required="">
					<label> Email: </label>
					<input placeholder="Email" class="form-add-control" name="email" type="text" required="">
				</div>
				<div class="col-md-6">
					<label> Phone Number: </label>
					<input placeholder="Phone Number" class="form-add-control" name="phone" type="text" required="">
					<label> Post Code: </label>
					<input placeholder="Post Code" class="form-add-control" name="postcode" min=0 type="number" required="">
					<label> Cover Letter: </label>
					<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="cover" required=""></textarea>
					<label> Resume: </label>
					<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="resume" required=""></textarea>
				</div>
			    <div class="row">
			    	<div class="col-sm-8">
			       		<label></label>
			       	</div>
			       	<div class="col-sm-4">
			       		<input type="submit" name="addItem" value="Add Item" class="btn btn-primary"> 
			       	</div>
			   </div>
			</form>
		</div>
		<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
	</body>
</html>