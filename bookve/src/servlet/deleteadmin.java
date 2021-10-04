package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilsadmin;

/**
 * Servlet implementation class deleteadmin
 */
@WebServlet(urlPatterns = { "/deleteadmin" })
public class deleteadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		DButilsadmin db = new DButilsadmin();
        if(id!= 1 ) {
        	db.deleteadmin(id);
        	RequestDispatcher dispatcher = request.getServletContext()
    				.getRequestDispatcher("/listuser");
    		dispatcher.forward(request, response);
		} else {;
			request.setAttribute("error", "dont delete admin");
			request.getRequestDispatcher("listuser").include(request, response);
		}

	}

	

}
