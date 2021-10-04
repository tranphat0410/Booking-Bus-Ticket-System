package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilscustomer;
import utils.DButilsseller;

/**
 * Servlet implementation class userPay
 */
@WebServlet("/userPay")
public class userPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller();
	private DButilscustomer db2 = new DButilscustomer();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userPay() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		int RS = Integer.parseInt(request.getParameter("RS"));

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
		String PS = request.getParameter("PS");
		String PF = request.getParameter("PF");
		String TT = request.getParameter("TT");
		LocalDate DateNow = LocalDate.now();
		System.out.println(NSeat);
		System.out.println(id);
		System.out.println(TT);
		
		for(int i = 1; i < NSeat.length();)
		{
			String SeatBook= NSeat.substring(0, 3);
			NSeat= NSeat.substring(3, NSeat.length());
			RS -= 1;
			if(db2.cseat(id, SeatBook)) {
				System.out.println("NOT OK");
			}else {
				if(SeatBook.substring(0, 1).equals("F")) {
					db2.bookTicket(id, lastname, name, phone, mail, TBus, NBus, fontP, SeatBook, PS, PF, TT, DateNow);
					db.updateticket(id, RS);
				}else if(SeatBook.substring(0, 1).equals("C")) {
					db2.bookTicket(id, lastname, name, phone, mail, TBus, NBus, midP, SeatBook, PS, PF, TT, DateNow);
					db.updateticket(id, RS);
				}else if(SeatBook.substring(0, 1).equals("L")) {
					db2.bookTicket(id, lastname, name, phone, mail, TBus, NBus, lastP, SeatBook, PS, PF, TT, DateNow);
					db.updateticket(id, RS);
				}
			}
		}
		String action = request.getParameter("TBus");
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
			rd.forward(request, response);}
	}

}
