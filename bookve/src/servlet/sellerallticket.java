package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilsseller;

/**
 * Servlet implementation class sellerallticket
 */
@WebServlet("/sellerallticket")
public class sellerallticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller(); 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setAttribute("ticket", db.allticket());
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/listticket.jsp");
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
			request.setAttribute("ticket", db.searchTicketLastName(word));
		}else if(SearchStatus.equals("name")) {
			request.setAttribute("ticket", db.searchTicketName(word));
		}else if(SearchStatus.equals("Phone")) {
			request.setAttribute("ticket", db.searchTicketPhone(word));
		}else if(SearchStatus.equals("Email")) {
			request.setAttribute("ticket", db.searchTicketEmail(word));
		}else if(SearchStatus.equals("Seat")) {
			request.setAttribute("ticket", db.searchTicketNumberSeat(word));
		}else if(SearchStatus.equals("TypeTravel")) {
			request.setAttribute("ticket", db.searchTicketTypeTravel(word));
		}
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/listticket.jsp");
		dispatcher.forward(request, response);
	}
	
}
