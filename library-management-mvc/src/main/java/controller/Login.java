package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import util.Util;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int id;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		String userType = request.getParameter("user");
		Cookie cookie = new Cookie("userType", request.getParameter("user"));
		if(userType.equals("Student")) {
			Student student = Service.getStudent( id);
			if(student.id != 0 && student.password.equals(password)) {
				getServletContext().setAttribute("user", student);
				getServletContext().setAttribute("userType", "Student");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("userId", request.getParameter("id"));
				response.addCookie(cookie);
				response.sendRedirect("home.jsp");
			}else {
				request.setAttribute("error", "Invalid id or password.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else if(userType.equals("Staff")) {
			Staff staff =Service.getStaff(id);
			if(staff.id!=0 && staff.password.equals(password)) {
				getServletContext().setAttribute("user", staff);
				getServletContext().setAttribute("userType", "Student");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("userId", request.getParameter("id"));
				response.addCookie(cookie);
				response.sendRedirect("home.jsp");
			}else {
				request.setAttribute("error", "Invalid id or password.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else {
			if(Util.AdminId == id && Util.AdminPassword.equals("root")) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("userId", request.getParameter("id"));
				response.addCookie(cookie);
				response.sendRedirect("admin_home.jsp");
			}else {
				request.setAttribute("error", "Invalid id or password.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}	
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
