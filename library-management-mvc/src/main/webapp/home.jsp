<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.User, org.apache.commons.codec.binary.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	img{
		max-width: 100%;
		max-height: 100%;
		border-radius: 25%;
	}
	.tooltip {  
		height:150px;
		position: absolute; 
		top: 50px; 
		right: 150px;
		}
		
		.tooltip .tooltiptext {
		  visibility: hidden;
		  width: 120px;
		  background-color: black;
		  color: #fff;
		  text-align: center;
		  border-radius: 6px;
		  padding: 5px 0;
		}
		
		.tooltip:hover .tooltiptext {
		  visibility: visible;
		}
</style>
</head>
<body>
	<%
	if(request.getSession().getAttribute("userId") == null ) {
		response.sendRedirect("index.jsp");
	}
	
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate" );
	User user = (User) getServletContext().getAttribute("user");
	byte[] bytes = user.getProfilePic().getBytes();
    byte[] encodeBase64 = Base64.encodeBase64(bytes);
    String base64Encoded = new String(encodeBase64, "UTF-8");
    String userName = user.getName();
	%>
	<h1>Hi <%= userName %>.!</h1><br>
	<div class="tooltip"> 
		<a href="upload_image.jsp" ><img alt="img"  src="data:image/jpeg;base64, <%= base64Encoded %>" /></a>
  		<span class="tooltiptext">Upload image</span>
	</div>
	
		<a href="DisplayBook">Display borrowed book</a><br>
		<a href="BarrowBook">Get book from Library</a><br>
		<a href="ReturnBook">Return a book to Library</a><br><br>
		<form action ="logout" method = "POST">
			<input type = "submit" value = "Logout" />
		</form>
</body>
</html>