package controller;



import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.Book;
import model.Service;
import model.User;


@WebServlet("/ReturnBook")
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) getServletContext().getAttribute("user");
		List<Book> books = Service.getBooks(user.getId());
		request.setAttribute("books",books );
		request.getRequestDispatcher("return_book.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long bookId = (long) Integer.parseInt(request.getParameter("bookid"));		
		if(Service.updateUserIdInBook(bookId)) {
			response.sendRedirect("home.jsp");
		}else {
			request.setAttribute("error", "Invalid book id, please enter it again.!");
			request.getRequestDispatcher("return_book.jsp").forward(request, response);
		}	
	}

}




