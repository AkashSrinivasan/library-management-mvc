<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<% 
			if(request.getSession().getAttribute("userId") == null ) {
				response.sendRedirect("index.jsp");
				response.setHeader("Cache-Control","no-cache, no-store, must-revalidate" );
			} 
		%>
		
		<h1>Hi Admin.!</h1><br>
			<a href="AddNewBook">Add a new book</a><br>
			<a href="DisplayAllUser">Display all staff and student</a><br>
			<a href="DisplayAllBook">Display all Books</a><br>
		<form action ="logout" method = "POST">
			<input type = "submit" value = "Logout" />
		</form>
</body>
</html>