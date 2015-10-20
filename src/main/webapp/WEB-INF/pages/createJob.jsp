<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create Job</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<jsp:include page="includes/header.jsp" />
		<div style="margin-top:5%"/>
		
		<div class="container">
			<form method="post" action="createJob" class="form-add">
				<div class="col-md-6">
					<label> Job Name: </label>
					<input placeholder="job name" maxlength=100 class="form-add-control" name="jobName" type="text" required="">
					<label> Closing Date:</label>
					<input placeholder="closing date" class="form-add-control" name="closingDate" type="text" required="">
					<label> Salary: </label>
					<input placeholder="salary" class="form-add-control" name="salary" type="number" required="">
					<label> Position: </label>
					<input placeholder="position" class="form-add-control" name="position" type="text" required="">
				</div>
				<div class="col-md-6">
					<label> Location: </label>
					<input placeholder="location" class="form-add-control" name="location" type="text" required="">
					<label> Description: </label>
					<textarea rows="4" cols="20" maxlength=1000 class="form-add-control" name="description" required=""></textarea>
				</div>
			    <div class="row">
			    	<div class="col-sm-8">
			       		<label></label>
			       	</div>
			       	<div class="col-sm-4">
			       		<input type="submit" name="createJob" value="Create Job" class="btn btn-primary"> 
			       	</div>
			   </div>
			</form>
		</div>
		<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
		<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
	</body>
</html>