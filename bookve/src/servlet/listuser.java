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
 * Servlet implementation class listuser
 */
@WebServlet(urlPatterns = "/listuser")
public class listuser extends HttpServlet {
	private DButilsadmin user = new DButilsadmin();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	
		request.setAttribute("listuser", user.listuser());
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String SearchStatus = request.getParameter("SearchStatus");
		String word = request.getParameter("word");
		if(SearchStatus.equals("LastName")) {
			request.setAttribute("listuser", user.searchLastName(word));
		}else if(SearchStatus.equals("Name")) {
			request.setAttribute("listuser", user.searchName(word));
		}else if(SearchStatus.equals("Phone")) {
			request.setAttribute("listuser", user.searchPhone(word));
		}else if(SearchStatus.equals("Email")) {
			request.setAttribute("listuser", user.searchEmail(word));
		}else if(SearchStatus.equals("Area")) {
			request.setAttribute("listuser", user.searchArea(word));
		}else if(SearchStatus.equals("Role")) {
			request.setAttribute("listuser", user.searchRole(word));
		}
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
		dispatcher.forward(request, response);
	}

}
