package implementation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myconnection.MyconnectionCheck;
import pojo.FoodService;
import pojo.Fooditems;
import pojo.User;
import pojo.Userservice;
import pojo.Vendor;
import pojo.VendorService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("Login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("test/html;charset=UTF-8");
		Connection con = null;
		HttpSession session = request.getSession();
		String uemail = request.getParameter("useremail");
		String upass = request.getParameter("userpassword");

		RequestDispatcher dispatcher = null;

		try (PrintWriter out = response.getWriter()) {

			/*
			 * String uemail=request.getParameter("useremail"); String
			 * upass=request.getParameter("userpassword"); Userservice userservice=new
			 * Userservice(MyconnectionCheck.getConnection()); User
			 * user=userservice.userlogin(uemail, upass); if(user!=null) {
			 * session.setAttribute("name", rs.getString("username"));
			 * dispatcher=request.getRequestDispatcher("MenuAll.jsp");
			 * 
			 * }
			 */
			
			  con=MyconnectionCheck.getConnection() ;
			  
			  PreparedStatement pst=con.
			  prepareStatement("select * from user where useremail=? and userpassword=?");
			  pst.setString(1, uemail); pst.setString(2, upass);
			  
			  
			  ResultSet rs= pst.executeQuery();
			 
			if (rs.next()) {
				User user = new User();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setUseremail(rs.getString("useremail"));
				user.setUser_gender(rs.getString("user_gender"));
				FoodService fs = new FoodService();
				List<Fooditems> list1 = fs.getAllFood();
				session.setAttribute("list1", list1);
				VendorService vs = new VendorService();
				List<Vendor> list = vs.getallvendor();
				session.setAttribute("list", list);
				
				session.setAttribute("name", rs.getString("username"));
				session.setAttribute("userid", rs.getInt("userid"));
				session.setAttribute("useremail", rs.getString("useremail"));
				session.setAttribute("user_gender", rs.getString("user_gender"));
				
				
				dispatcher = request.getRequestDispatcher("MenuAll.jsp");

			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("Login.jsp");
			}
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
