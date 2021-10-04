package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import utils.DBUtils;
import utils.DButilsadmin;
import utils.DButilscustomer;

/**
 * Servlet implementation class userAccountServlet
 */
@WebServlet("/userAccount")
public class userAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilscustomer db = new DButilscustomer();
	private DButilsadmin db2 = new DButilsadmin();
	DBUtils db3 = new DBUtils();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String mail = request.getParameter("mail");
		request.setAttribute("Seat", db.showSeat(mail));
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp");
		rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String error = null;

		int id = Integer.parseInt(request.getParameter("id"));
		String UserName = request.getParameter("name");
		String LastName = request.getParameter("lastname");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("mail");
		String Oldpass = request.getParameter("oldpass");
		String nhappass = request.getParameter("nhappass");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("passagain");
		String Area = request.getParameter("area");
		String Role = "Customer";

		
		
		if (UserName == null ||LastName==null|| Phone == null || Email == null || Area == null || Role == null || UserName.length() == 0
				||LastName.length()==0|| Phone.length() == 0 || Email.length() == 0 || Area.length() == 0 || UserName.length() == 0) {
			request.setAttribute("updateadmin", db2.updateuser(id));
			error = "Required";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp").include(request, response);
		} else if (pass == null || pass2 == null || pass.length() == 0 || pass2.length() == 0||nhappass==null||nhappass.length()==0) {
			if (db2.update(id, UserName, LastName, Phone, Oldpass, Area, Role)) {

				
				request.setAttribute("unameCustomer",  db3.sessionUser(Email));
				request.setAttribute("Seat", db.showSeat(Email));
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp");
				rd.include(request, response);

			}
		} else {
			boolean mh = BCrypt.checkpw(nhappass,Oldpass);
			if(mh==true)
			{
			if (!pass.equals(pass2)) {
				request.setAttribute("updateadmin", db2.updateuser(id));
				error = "The password and its confirm are not the same.";
				request.setAttribute("error", error);

				request.getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp").include(request, response);

			} else if (pass.equals(pass2)) {
				if (db2.update(id, UserName, LastName, Phone, pass, Area, Role)) {

					String mail = request.getParameter("mail");
					request.setAttribute("Seat", db.showSeat(mail));
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp");
					rd.include(request, response);
				}
			}
			}else {
				request.setAttribute("unameCustomer",  db3.sessionUser(Email));
				request.setAttribute("Seat", db.showSeat(Email));
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customer/accountUser.jsp");
				rd.include(request, response);
	}
		}

	}

}
