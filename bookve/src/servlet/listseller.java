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


@WebServlet(urlPatterns = { "/listseller" })
public class listseller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller();
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("travels", db.searchtravel());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/seller/seller.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String TBus = request.getParameter("tbus");
		String time = request.getParameter("time");
		String PS = request.getParameter("ps");
		String PF = request.getParameter("pf");
		String TT = request.getParameter("tt");
	
		
		 
			  if(db.listtravel(TBus, time, PS, PF,TT)!=null)
			{
				request.setAttribute("travels", db.searchtravel());
				request.setAttribute("error", "There is no bus route !!!");
				request.setAttribute("MyTravel", db.listtravel(TBus, time, PS, PF, TT));
				ResultSet rs = db.listtravel2(TBus, time, PS, PF, TT);
				try {
					if(rs.next()) {
						System.out.println(rs.getInt("idInfo"));
						request.setAttribute("ticket", db.ticktravel(rs.getInt("idInfo")));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//				if (db.listtravel2(TBus, NBus, PS, PF, TT)!=null)
//				{
//					request.setAttribute("ticket", db.ticktravel());
//				}
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/seller/seller.jsp");
				rd.include(request, response);
			}
			 
			
	
	}

}
