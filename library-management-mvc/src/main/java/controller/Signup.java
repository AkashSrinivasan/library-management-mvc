package controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.google.appengine.api.datastore.Blob;import com.google.appengine.api.images.Image;

import model.Service;


@WebServlet("/signup")
@MultipartConfig
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");
		Part part = request.getPart("myFile");
		InputStream imgStream = request.getPart("myFile").getInputStream();
		System.out.println(imgStream);
		if(part.getSize()==0) {
			File file = new File(getServletContext().getRealPath("/default.jpg"));
			imgStream = new FileInputStream(file);
		}
        Blob imageBlob = new Blob(IOUtils.toByteArray(imgStream));
		
		System.out.println("getting in signup page");
		
		
		if(userType.equals("Student")) {	
			if(Service.addStudent(id,name,password,imageBlob)) {
				response.sendRedirect("index.jsp");
			}else {
				request.setAttribute("error", "Already have account please login");
				request.getRequestDispatcher("index.jsp");
			}
		}else {
			if(Service.addStaff(id,name,password,imageBlob)) {
				
				response.sendRedirect("index.jsp");
			}else {
				request.setAttribute("error", "Already have account please login");
				response.sendRedirect("index.jsp");
			}
		}
	}

}
