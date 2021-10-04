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


import utils.DButilsseller;



@WebServlet("/sellerdeleteticket")
public class sellerdeleteticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller();
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int idTravel = Integer.parseInt(request.getParameter("idTravel"));
		int RS = Integer.parseInt(request.getParameter("RS"));
		int idTicket = Integer.parseInt(request.getParameter("idTicket"));
		if(RS != 0) {
			int seats = RS + 1;
			db.deletetick(idTicket);
			db.updateticket(idTravel, seats);
			int id = Integer.parseInt(request.getParameter("idTravel"));
			request.setAttribute("ticket", db.ticktravel(id));
			request.setAttribute("travels", db.viewupinfo(id));
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/TicketTravel.jsp");
			dispatcher.forward(request, response);
		}else {
			ResultSet upseat = db.listtravel3(idTravel);
			try {
				if(upseat.next()) {
					RS = upseat.getInt("ResidualSeats");
					int seats = RS + 1;
					db.deletetick(idTicket);
					db.updateticket(idTravel, seats);
					int id = Integer.parseInt(request.getParameter("idTravel"));
					request.setAttribute("ticket", db.ticktravel(id));
					request.setAttribute("travels", db.viewupinfo(id));
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/listticket.jsp");
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

}
