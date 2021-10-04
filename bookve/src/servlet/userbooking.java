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
 * Servlet implementation class userbookingServlet
 */
@WebServlet("/userbooking")
public class userbooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DButilsseller db = new DButilsseller();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String action = request.getParameter("action");
		if(action.equals("Normal")) {
			request.setAttribute("ticket", db.ticktravel(id));
			request.setAttribute("travels", db.viewupinfo(id));
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/BookingNBusView.jsp");
			rd.forward(request, response);
		}else if(action.equals("Limousine")) {
			request.setAttribute("ticket", db.ticktravel(id));
			request.setAttribute("travels", db.viewupinfo(id));
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/BookingLBusView.jsp");
			rd.forward(request, response);
		}else if(action.equals("Royal")) {
			request.setAttribute("ticket", db.ticktravel(id));
			request.setAttribute("travels", db.viewupinfo(id));
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/BookingRBusView.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		int RS = Integer.parseInt(request.getParameter("RS"));

		String action = request.getParameter("TBus");
		
		String lastname = request.getParameter("lastname");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("mail");
		String TBus = request.getParameter("TBus");
		String NBus = request.getParameter("NBus");
		int fontP = Integer.parseInt(request.getParameter("fontP"));
		int midP = Integer.parseInt(request.getParameter("midP"));
		int lastP = Integer.parseInt(request.getParameter("lastP"));
		String NSeat = request.getParameter("seat");
		String NSeatTest = request.getParameter("seat");
		String PS = request.getParameter("PS");
		String PF = request.getParameter("PF");
		String TT = request.getParameter("TT");
		String form = request.getParameter("form");
		String to = request.getParameter("to");
		String numberSeat = request.getParameter("numberSeat");
		
		
		
		
		if (NSeat=="") {
			if(action.equals("Normal")) {
				request.setAttribute("ticket", db.ticktravel(id));
				request.setAttribute("travels", db.viewupinfo(id));
				RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/BookingNBusView.jsp");
				rd.forward(request, response);
			}else if(action.equals("Limousine")) {
				request.setAttribute("ticket", db.ticktravel(id));
				request.setAttribute("travels", db.viewupinfo(id));
				RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/BookingLBusView.jsp");
				rd.forward(request, response);
			}else if(action.equals("Royal")) {
				request.setAttribute("ticket", db.ticktravel(id));
				request.setAttribute("travels", db.viewupinfo(id));
				RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/BookingRBusView.jsp");
				rd.forward(request, response);
			}
			
		}else
		{
			int Totalmoney = Integer.parseInt(request.getParameter("Totalmoney"));
			request.setAttribute("id", id);
			request.setAttribute("RS", RS);
			request.setAttribute("lastname", lastname);
			request.setAttribute("name", name);
			request.setAttribute("phone", phone);
			request.setAttribute("mail", mail);
			request.setAttribute("TBus", TBus);
			request.setAttribute("NBus", NBus);
			request.setAttribute("fontP", fontP);
			request.setAttribute("midP", midP);
			request.setAttribute("lastP", lastP);
			request.setAttribute("NSeat", NSeat);
			request.setAttribute("NSeatTest", NSeatTest);
			request.setAttribute("PS", PS);
			request.setAttribute("PF", PF);
			request.setAttribute("TT", TT);
			request.setAttribute("form", form);
			request.setAttribute("to", to);
			request.setAttribute("numberSeat", numberSeat);
			request.setAttribute("Totalmoney", Totalmoney);
			request.setAttribute("travels", db.searchtravel());
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/detailBooking.jsp");
			rd.forward(request, response);
		}
			
		
	}

}
