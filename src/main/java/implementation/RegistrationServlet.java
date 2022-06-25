package implementation;

import java.io.IOException;
import myconnection.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.SessionFactory;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=null;
		String uname=request.getParameter("user_name");
		String uaddress=request.getParameter("user_address");
		String ugender=request.getParameter("inlineRadioOptions");
		String uphonenumber=request.getParameter("User_phonenumber");
		String umail=request.getParameter("user_email");
		String upass=request.getParameter("User_password");
		PrintWriter out=response.getWriter();
		RequestDispatcher dispatcher=null;
		HttpSession session=request.getSession(true);  
	    String contextPath = request.getServletContext().getContextPath();

		
	
		
		try {
	    con=MyconnectionCheck.getConnection();
		PreparedStatement pst=con.prepareStatement("insert into user(username,userpassword,useremail,user_address,user_gender,user_phonenumber) values(?,?,?,?,?,?)");
		
		pst.setString(1, uname);
		pst.setString(2, upass);
		pst.setString(3, umail);
		pst.setString(4, uaddress);
		pst.setString(5, ugender);
		pst.setString(6, uphonenumber);
		
		int rowcount=pst.executeUpdate();
		
		
				if(rowcount>0) {
					request.setAttribute("status", "success");
			dispatcher=request.getRequestDispatcher("Login.jsp");
			dispatcher.forward(request, response); 
			
			

		}
		else {
			request.setAttribute("status", "failed");
			dispatcher=request.getRequestDispatcher("Register.jsp");
			dispatcher.include(request, response);
			
		}
	
		 
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
//		finally {
//			try {
//				con.close();
//				
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
	System.out.println("Executed");
	}

}
