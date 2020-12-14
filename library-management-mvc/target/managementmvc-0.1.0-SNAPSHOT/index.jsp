<%@page import="com.google.appengine.repackaged.com.google.rpc.context.SystemHeaderContextOrBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style> 
Body {
  font-family: Calibri, Helvetica, sans-serif;
}
button { 
       
       width: 100%;
        padding: 15px; 
        margin: 10px 0px; 
        border: none; 
        cursor: pointer; 
         } 
 form { 
        border: 3px solid black; 
        margin-left: 25%;
        margin-right: 25%;
    } 
 input[type=text], input[type=password],input[type=number] { 
        width: 100%; 
        margin: 8px 0;
        padding: 12px 20px; 
        display: inline-block; 
       
        box-sizing: border-box; 
    }
 button:hover { 
        opacity: 0.7; 
    } 
  .cancelbtn { 
        width: auto; 
        padding: 10px 18px;
        margin: 10px 5px;
    } 
 .container { 
        padding: 25px; 
    } 
    .error{
		  color: red;
		  align: center}
</style> 
</head>
<body>

	<%
		String img = getServletContext().getRealPath("/default.jpg");
		out.print(img);
		String error = (String)request.getAttribute("error");
		if(error!=null){ %>
			<p class="error"><%=error %></p>
		<% }
	%>
	<img alt="no" src="C:\Users\akash\eclipse-workspace\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp15\library-management-mvc\default.jpg">
	<h1 align="center"> Login Form </h1> 
    <form action="login" method="POST">
        <div class="container"> 
            <label>Id : </label> 
            <input type="number" placeholder="Enter Id" name="id" required>
            <label>Password : </label> 
            <input type="password" placeholder="Enter Password" name="password" required>
            <label>Select : </label>
            <select name="user" id="user">
			    <option value="Student">Student</option>
			    <option value="Staff">Staff</option>
			    <option value="Admin">Admin</option>
			 </select>
            <button type="submit">Login</button> 
            New <a href="signup.html"> Signup </a><br>
        </div> 
    </form>   

</body>
</html>