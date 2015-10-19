<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Online Recruitment Service</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="custom.css" />
	</head>
	<body>
		<jsp:include page="includes/header.jsp" />
		<div style="margin-top:5%"/>
	
		<div class="container" style="width:55%">
			<header>
				<h1>Online Recruitment Service</h1>
			</header>
			<br>
			
			<table class="table table-striped" style="width:50%" align="CENTER">
			<tr>
				<th> Job </th>
				<th> Description </th>
			</tr>
			<c:forEach var="job" items="${jobList}" varStatus="i">
			<tr>
					<td> <a href="displayJob?jobid=${job.jobId}"">${job.jobName}</a> </td>
					<td> ${job.description} </td>
				</form>
			</tr>	
		
			</c:forEach>
			</table>
	
		</div>
	</body>
</html>