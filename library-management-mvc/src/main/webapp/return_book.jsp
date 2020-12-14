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
		  text-align:center;}
		  .error{
		  color: red;
		  align: center}
</style>
	
</head>
<body>
		<%
		if(request.getSession().getAttribute("userId") == null ) {
			response.sendRedirect("index.jsp");
		}
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate" );
		String error = (String)request.getAttribute("error");
		if(error != null){%>
			<p class="error"><%=error %></p>
		<% }
		ArrayList<Book> books = (ArrayList<Book>)request.getAttribute("books");
		int barrowedBookCount = books.size();
		
		if(books != null && barrowedBookCount>0 ) { %>
			<h1> Your book list</h1>
			<table>
				<tr>
					<th>Id</th>
					<th>Valid till</th>
					</tr>
		<% 	for(Book book: books){%>
						<tr><td><%= book.id%></td>
						<td><%= ChronoUnit.DAYS.between(LocalDateTime.now(), book.getDueDate())%></td></tr>
				<% 	
			} %>
			</table>
			<form action="returnBook" method="POST">
				Enter the book id :<input type="number" placeholder="Enter book Id" name="bookid" required>
				<button type="submit">remove</button>
			</form>
		<% }else { %>
			<h1>No book in the list</h1>
			<a href="home.jsp">back</a>
		<%} %>

</body>
</html>