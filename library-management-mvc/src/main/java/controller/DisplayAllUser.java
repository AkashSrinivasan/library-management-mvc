package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Service;
import model.Staff;
import model.Student;

@WebServlet("/DisplayAllUser")
public class DisplayAllUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<Student> allStudent = Service.getAllStudent();
			request.setAttribute("students", allStudent);
			List<Staff> allStaff = Service.getAllStaff();
			request.setAttribute("staffs", allStaff);
			
			request.getRequestDispatcher("display_all_user.jsp").forward(request, response);
	}

}
