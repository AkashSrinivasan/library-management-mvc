<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.google.appengine.api.datastore.Query.*,
    model.Book,com.google.appengine.api.datastore.Query,com.google.appengine.api.datastore.Query.Filter,
    com.google.appengine.api.datastore.Query.FilterOperator, javax.jdo.* , java.util.*, 
    com.google.appengine.api.datastore.*, com.google.appengine.api.datastore.Query.FilterPredicate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<style>
		table, th, td {
		  border: 1px solid black;
		  }
		  table{
		  width:500px;
		  text-align:center;
		  }
		  .error{
		  color: red;
		  align: center}
	</style>
</head>
<body>
	<%
		if(request.getSession().getAttribute("userId") == null ) {
			response.sendRedirect("index.html");
		}
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate" );
		String error = (String)request.getAttribute("error");
		if(error == null){%>
			<p class="error"><%=error %></p>
		<% }
		
		List<Book> allBooks = (List<Book>)request.getAttribute("books");
		int availableBookCount = allBooks.size();
		if(availableBookCount == 0) {
		%>
			<h1>No book are available right now.!</h1>
		<%}
		else { %>
			<h1>These book available right now !</h1>
			<table>
				<tr>
					<th>Id</th>
					<th>Name</th>
				</tr>
				<% 
				for(int i=0;i<allBooks.size();i++){
					%>
							<tr><td><%= allBooks.get(i).id %></td>
							<td><%= allBooks.get(i).name %></td></tr>
					<%
				}%>
				</table><br>
				<form action="barrowBook" method="POST">
					Enter the book id :<input type="number" placeholder="Enter book Id" name="bookid" required>
					<button type="submit">add</button>
				</form><br>
		<%} %>
		<a href="home.jsp">back</a>
</body>
</html>