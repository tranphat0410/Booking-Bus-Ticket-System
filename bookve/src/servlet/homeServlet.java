package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DButilscustomer;
import utils.DButilsseller;



/**
 * Servlet implementation class homeServlet
 */
@WebServlet(urlPatterns = { "/home" })
public class homeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		request.setAttribute("travels", db.searchtravel());
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String TT = request.getParameter("nut");
		String PS = request.getParameter("PS");
		String PF = request.getParameter("PF");
		String DG = request.getParameter("nkh");
		String DH = request.getParameter("nv");
		String Status = "wait";
		DButilscustomer db2 = new DButilscustomer();
		
		if(TT.equals("Round")) {
			request.setAttribute("travels", db.searchtravel());
			request.setAttribute("MyTravel", db2.listtravelCus(TT, PS, PF, DG, DH, Status));
			request.setAttribute("GO", PS);
			request.setAttribute("END", PF);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customer/listtravelview.jsp");
			rd.include(request, response);
		}else {
			request.setAttribute("travels", db.searchtravel());
			request.setAttribute("MyTravel", db2.listtravelCusONE(TT, PS, PF, DG, Status));
			request.setAttribute("GO", PS);
			request.setAttribute("END", PF);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customer/listtravelview.jsp");
			rd.include(request, response);
		}
	}

}
