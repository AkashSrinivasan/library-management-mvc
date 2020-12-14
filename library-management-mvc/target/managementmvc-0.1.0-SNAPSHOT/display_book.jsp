<%@page import="com.google.appengine.repackaged.com.google.rpc.context.SystemHeaderContextOrBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.google.appengine.api.datastore.Query.*,
    model.Book,com.google.appengine.api.datastore.Query,com.google.appengine.api.datastore.Query.Filter,
    com.google.appengine.api.datastore.Query.FilterOperator, javax.jdo.* , java.util.*, 
    com.google.appengine.api.datastore.*,java.io.IOException, com.google.appengine.api.datastore.Query.FilterPredicate,java.time.LocalDateTime,java.time.temporal.ChronoUnit"%>
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
		ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
	    
		int barrowedBookCount = books.size();
		if(books != null && barrowedBookCount>0) {
			
		%>
		<h1>Book List</h1>
		<table>
			<tr>
				<th>Name</th>
				<th>Valid till</th>
				<th>no of days</th>
			</tr>
		<% for(int i=0;i<books.size();i++){ %>
			<tr>
				<td><%= books.get(i).name%></td>
				<td><%= books.get(i).getBorrowedOn().toLocalDate()%></td>
				<td><%= ChronoUnit.DAYS.between(LocalDateTime.now(), books.get(i).getDueDate())%></td>
			</tr>
		</table>
		<% }
		}else { %>
			<h1>No books to display..!</h1>
		<% } %>
		<a href="home.jsp">back</a>

</body>
</html>