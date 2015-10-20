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
			
			<form action="verifyLogin" method="post">
				Username (UID)<br>
				<input type="text" name="username" required> 
				<br>
				Password 
				<br>
				<input type="password" name="password" required>
				<br>
				<input class="btn" type="submit" value="Login">
			</form>
	
		</div>
	</body>
</html>