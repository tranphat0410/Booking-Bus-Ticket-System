package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import utils.DButilsadmin;

/**
 * Servlet implementation class updateadmin
 */
@WebServlet(urlPatterns = { "/updateadmin" })
public class updateadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DButilsadmin db = new DButilsadmin();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(id!= 1 ) {
			request.setAttribute("updateadmin", db.updateuser(id));
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp");
			dispatcher.forward(request, response);
		} else {;
			request.setAttribute("error", "dont update admin");
			request.getRequestDispatcher("listuser").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String error = null;

		int id = Integer.parseInt(request.getParameter("id"));
		String UserName = request.getParameter("name");
		String LastName = request.getParameter("lastname");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("mail");
		String Oldpass = request.getParameter("oldpass");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("passagain");
		String Area = request.getParameter("area");
		String Role = request.getParameter("role");
		String Cseat = request.getParameter("cSeat");
		
//		if(Cseat.equals("Customer") && db.cseat(Email)) {
//			request.setAttribute("updateadmin", db.updateuser(id));
//			error = "This account has booked ticket";
//			request.setAttribute("error", error);
//
//			request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
//		}else if (UserName == null ||LastName==null|| Phone == null || Email == null || Area == null || Role == null || UserName.length() == 0
//				||LastName.length()==0|| Phone.length() == 0 || Email.length() == 0 || Area.length() == 0 || UserName.length() == 0) {
//			request.setAttribute("updateadmin", db.updateuser(id));
//			error = "Required";
//			request.setAttribute("error", error);
//			request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
//		} else if (pass == null || pass2 == null || pass.length() == 0 || pass2.length() == 0) {
//			if (db.update(id, UserName, LastName, Phone, Oldpass, Area, Role)) {
//				request.setAttribute("listuser", db.listuser());
//				RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
//				dispatcher.forward(request, response);
//			}
//		} else {
//			boolean mh = BCrypt.checkpw(nhappass,Oldpass);
//			if(mh==true)
//			{
//				if (!pass.equals(pass2)) {
//					request.setAttribute("updateadmin", db.updateuser(id));
//					error = "The password and its confirm are not the same.";
//					request.setAttribute("error", error);
//
//					request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
//
//				} else if (pass.equals(pass2)) {
//					String mapass = BCrypt.hashpw(pass, BCrypt.gensalt(12));
//					if (db.update(id, UserName, LastName, Phone, mapass, Area, Role)) {
//						System.out.println("123456789");
//						request.setAttribute("listuser", db.listuser());
//						RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
//						dispatcher.forward(request, response);
//					}
//				}
//			}else {
//				request.setAttribute("updateadmin", db.updateuser(id));
//				error = "Password wrong";
//				request.setAttribute("error", error);
//
//				request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
//			}
//			
//			
//		}

		if(Cseat.equals("Customer") && db.cseat(Email))
		{
			String Role1 = "Customer";
			if (UserName == null ||LastName==null|| Phone == null || Email == null || Area == null || Role == null || UserName.length() == 0
					||LastName.length()==0|| Phone.length() == 0 || Email.length() == 0 || Area.length() == 0 || UserName.length() == 0) {
				request.setAttribute("updateadmin", db.updateuser(id));
				error = "Required";
				request.setAttribute("error", error);
				request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
			} else if (pass == null || pass2 == null || pass.length() == 0 || pass2.length() == 0) {
				if (db.update(id, UserName, LastName, Phone, Oldpass, Area, Role1)) {
		
					request.setAttribute("listuser", db.listuser());
					RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
					dispatcher.forward(request, response);
		
				}
			} else {
					if (!pass.equals(pass2)) {
						request.setAttribute("updateadmin", db.updateuser(id));
						error = "The password and its confirm are not the same.";
						request.setAttribute("error", error);
		
						request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
		
					} else if (pass.equals(pass2)) {
						String mapass = BCrypt.hashpw(pass, BCrypt.gensalt(12));
						if (db.update(id, UserName, LastName, Phone, mapass, Area, Role1)) {
		
							request.setAttribute("listuser", db.listuser());
							RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
							dispatcher.forward(request, response);
						}
					}
			}
		
		}
		else if (UserName == null ||LastName==null|| Phone == null || Email == null || Area == null || Role == null || UserName.length() == 0
				||LastName.length()==0|| Phone.length() == 0 || Email.length() == 0 || Area.length() == 0 || UserName.length() == 0) {
			request.setAttribute("updateadmin", db.updateuser(id));
			error = "Required";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
		} else if (pass == null || pass2 == null || pass.length() == 0 || pass2.length() == 0) {
			if (db.update(id, UserName, LastName, Phone, Oldpass, Area, Role)) {
		
				request.setAttribute("listuser", db.listuser());
				RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
				dispatcher.forward(request, response);
		
			}
		} else {
				if (!pass.equals(pass2)) {
					request.setAttribute("updateadmin", db.updateuser(id));
					error = "The password and its confirm are not the same.";
					request.setAttribute("error", error);
		
					request.getRequestDispatcher("/WEB-INF/view/admin/updateuser.jsp").include(request, response);
		
				} else if (pass.equals(pass2)) {
					String mapass = BCrypt.hashpw(pass, BCrypt.gensalt(12));
					if (db.update(id, UserName, LastName, Phone, mapass, Area, Role)) {
		
						request.setAttribute("listuser", db.listuser());
						RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/view/admin/listuser.jsp");
						dispatcher.forward(request, response);
					}
				}
		}
		
	}

}




