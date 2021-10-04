package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilscustomer;
import utils.DButilsseller;

/**
 * Servlet implementation class userDeleteTicket
 */
@WebServlet("/userDeleteTicket")
public class userDeleteTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller();
	private DButilscustomer db2 = new DButilscustomer();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userDeleteTicket() {
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
		int idTravel = Integer.parseInt(request.getParameter("idTravel"));
		int idTicket = Integer.parseInt(request.getParameter("idTicket"));
		ResultSet upseat = db.listtravel3(idTravel);
		try {
			if(upseat.next()) {
				int RS = upseat.getInt("ResidualSeats");
				int seats = RS + 1;
				db.deletetick(idTicket);
				db.updateticket(idTravel, seats);
				
				String mail = request.getParameter("mail");
				request.setAttribute("Seat", db2.showSeat(mail));
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp");
				dispatcher.forward(request, response);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
