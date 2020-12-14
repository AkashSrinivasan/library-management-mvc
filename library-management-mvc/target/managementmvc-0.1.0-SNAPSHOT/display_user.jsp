<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.google.appengine.api.datastore.Query.*,
    model.Book,model.User,model.Student,model.Staff,com.google.appengine.api.datastore.Query,com.google.appengine.api.datastore.Query.Filter,
    com.google.appengine.api.datastore.Query.FilterOperator, javax.jdo.* , java.util.*, 
    com.google.appengine.api.datastore.*,java.io.IOException, com.google.appengine.api.datastore.Query.FilterPredicate,
    java.time.LocalDateTime,java.time.temporal.ChronoUnit,org.apache.commons.codec.binary.Base64"%>
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
		  width: 400px;
   			 text-align: center;
		  }
		  .col1{
		  width:30%}
		  .col2{
		  width:30%}
		  .col3{
		  width:40%}
		 img{
		 height:150px;
		 }
</style>
</head>
<body>
	
		<% 
		if(request.getSession().getAttribute("userId") == null ) {
			response.sendRedirect("index.jsp");
		}
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate" );
		
		List<Student> allStudent = (List<Student>)request.getAttribute("students");
		if(allStudent.size() == 0) {%>
			<p>Student List is empty</p>
		<% }else { %>
			<h1>Student List</h1>
			<table>
				<tr>
					<th class= "col1">Id</th>
					<th class= "col2">Name</th>
					<th class= "col3">Photo</th>			
				</tr>
			<% for(Student student:allStudent) {
				byte[] bytes = student.getProfilePic().getBytes();
	            byte[] encodeBase64 = Base64.encodeBase64(bytes);
	            String base64Encoded = new String(encodeBase64, "UTF-8"); %>
				<tr><td><%= student.getId() %></td>
				<td><%= student.getName() %></td>
				<td><img alt="img" src="data:image/jpeg;base64,<%= base64Encoded %>"/></td></tr>
			<% }%>
			</table>
		<% } %>
		
		<% 
		List<Staff> allStaff = (List<Staff>)request.getAttribute("Staff");
		if(allStaff.size() == 0) { %>
			<p>Staff List is empty</p>
		<% }else { %>
			<h1>Staff List</h1>
			<table>
				<tr>
					<th class= "col1">Id</th>
					<th class= "col2">Name</th>
					<th class= "col3">Photo</th>
				</tr>
			<% for(Staff staff:allStaff) {
				byte[] bytes = staff.getProfilePic().getBytes();
	            byte[] encodeBase64 = Base64.encodeBase64(bytes);
	            String base64Encoded = new String(encodeBase64, "UTF-8"); %>
				<tr><td><%= staff.getId() %></td>
				<td><%= staff.getName() %></td>
				<td><img alt="img" src="data:image/jpeg;base64,<%= base64Encoded %>"/></td></tr>
			<%} %>
			</table>
		<%} %>
		<a href="admin_home.jsp">back</a>

</body>
</html>