package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilsseller;


@WebServlet("/sellertickettravel")
public class sellertickettravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller();
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("ticket", db.ticktravel(id));
		request.setAttribute("travels", db.viewupinfo(id));
		request.setAttribute("ID", id);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/TicketTravel.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
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
		}
		request.setAttribute("travels", db.viewupinfo(id));
		request.setAttribute("ID", id);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/TicketTravel.jsp");
		dispatcher.forward(request, response);
	}

}
