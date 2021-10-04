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
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import utils.DBUtils;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DBUtils db = new DBUtils();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
//		boolean mh = BCrypt.checkpw(pass,);
		ResultSet rs = db.loginUser(mail);
		try {
			
			if(rs.next())
			{
				boolean mh = BCrypt.checkpw(pass,rs.getString("Password"));
				System.out.println(mh);
				if(mh==true)
				{
					if(rs.getString("Role").equals("admin")) {
						HttpSession session = request.getSession();
						session.setAttribute("unameAdmin", db.sessionUser(mail));
						response.sendRedirect("listuser");
					}else if(rs.getString("Role").equals("Customer")) {
						HttpSession session = request.getSession();
						session.setAttribute("unameCustomer", db.sessionUser(mail));
						response.sendRedirect("home");
					}else if(rs.getString("Role").equals("TicketSeller")) {
						HttpSession session = request.getSession();
						session.setAttribute("unameSeller", db.sessionUser(mail));
						response.sendRedirect("listseller");
					}
				}
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp");
				request.setAttribute("thongbao", "User name or Password wrong");
				rd.include(request, response);
				
			} else {
//				response.sendRedirect("login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/LoginAndSignUpView.jsp");
				request.setAttribute("thongbao", "User name or Password wrong");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
