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
 * Servlet implementation class sellerSearchtravel
 */
@WebServlet("/sellerSearchtravel")
public class sellerSearchtravel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsseller db = new DButilsseller(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerSearchtravel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String SearchStatus = request.getParameter("SearchStatus");
		String word = request.getParameter("word");
		if(SearchStatus.equals("TB")) {
			request.setAttribute("travel", db.searchTypeBus(word));
		}else if(SearchStatus.equals("NB")) {
			request.setAttribute("travel", db.searchNumberBus(word));
		}else if(SearchStatus.equals("PS")) {
			request.setAttribute("travel", db.searchPlaceStart(word));
		}else if(SearchStatus.equals("PF")) {
			request.setAttribute("travel", db.searchPlaceFinish(word));
		}else if(SearchStatus.equals("TT")) {
			request.setAttribute("travel", db.searchTypeTravel(word));
		}else if(SearchStatus.equals("Status")) {
			request.setAttribute("travel", db.searchStatus(word));
		}
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/seller/listAllTravel.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
