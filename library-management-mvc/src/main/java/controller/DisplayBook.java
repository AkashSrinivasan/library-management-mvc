package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;
import model.Service;
import model.User;

@WebServlet("/DisplayBook")
public class DisplayBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) getServletContext().getAttribute("user");
		ArrayList<Book> books = Service.getBooks(user.getId());
	    request.setAttribute("books", books);
	    request.getRequestDispatcher("display_book.jsp").forward(request, response);
	}
}
