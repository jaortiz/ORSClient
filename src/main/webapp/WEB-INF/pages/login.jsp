<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>Login</title>
</head>
<body>

	<form action="verifyLogin" method="post">
		Username (UID):<br>
		<input type="text" name="username" required> 
		Password:<br>
		<input type="password" name="password" required>
		<br>
		<input class="btn" type="submit" value="Login">
	</form>
 
</body>
</html>