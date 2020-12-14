<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.google.appengine.api.datastore.Query.*,
    model.Book,model.User,com.google.appengine.api.datastore.Query,com.google.appengine.api.datastore.Query.Filter,
    com.google.appengine.api.datastore.Query.FilterOperator, javax.jdo.* , java.util.*, 
    com.google.appengine.api.datastore.*,java.io.IOException, com.google.appengine.api.datastore.Query.FilterPredicate,
    java.time.LocalDateTime,java.time.temporal.ChronoUnit"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
		table, th, td {
		  border: 1px solid black;
		}
		 table {
		  width:500px;
		  text-align:center;
		 }
</style>
</head>
<body>

	<% 
		if(request.getSession().getAttribute("userId") == null ) {
			response.sendRedirect("index.jsp");
		}
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate" );
		List<Book> allBooks =(List<Book>)request.getAttribute("books");
		if(allBooks.size()>= 0) { %>
		<h1>All Book List</h1>
			<table>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Barrower ID</th>
					<th>Valid Till</th>
				</tr>
			<% for (Book book : allBooks) { %>
				<tr align="center">
				<td><%= book.id %></td>
				<td><%= book.name %></td>
			<% 	if(book.barrowerId != 0) { %>
					<td><%=book.barrowerId%></td>
			<%	}else { %>
					<td>Nil</td>
				<%} %>
				<td><%= book.name %></td>
				</tr>
			<% } %>
			</table><br>
		<% }else { %>
			<p>No Book in library</p>
		<% } %>
		
		<a href="admin_home.jsp">back</a>
		
	

</body>
</html>