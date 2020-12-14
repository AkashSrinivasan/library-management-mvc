package controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.google.appengine.api.datastore.Blob;

import model.User;
import model.Service;


@WebServlet("/UploadImage")
@MultipartConfig
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) getServletContext().getAttribute("user");
		String userType = (String) getServletContext().getAttribute("userType");
		InputStream imgStream = request.getPart("myFile").getInputStream();
		Blob imageBlob = new Blob(IOUtils.toByteArray(imgStream));
		if(Service.uploadImage(user.getId(),imageBlob,userType)) {
			user.setProfilePic(imageBlob);
			getServletContext().setAttribute("user", user);
			response.sendRedirect("home.jsp");
		}else {
			request.setAttribute("error", "Can't upload now please try after sometime");
			request.getRequestDispatcher("upload_image.jsp").forward(request, response);
		}
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
