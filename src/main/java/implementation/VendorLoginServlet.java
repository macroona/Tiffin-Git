package implementation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myconnection.MyconnectionCheck;
import pojo.User;
import pojo.Vendor;

/**
 * Servlet implementation class VendorLoginServlet
 */
@WebServlet("/VendorLoginServlet")
public class VendorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorLoginServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("test/html;charset=UTF-8");
		Connection con = null;
		HttpSession session = request.getSession();
		String uemail = request.getParameter("useremail");
		String upass = request.getParameter("userpassword");

		RequestDispatcher dispatcher = null;
		try (PrintWriter out = response.getWriter()) {
			con=MyconnectionCheck.getConnection() ;
			  
			  PreparedStatement pst=con.prepareStatement("select * from vendor1 where vendormail=? and vendorpassword=?");
			  pst.setString(1, uemail); 
			  pst.setString(2, upass);
			  
			  
			  ResultSet rs= pst.executeQuery();
			  if (rs.next()) {
					Vendor ven=new Vendor();
					ven.setVendorid(rs.getInt("vendorid"));
					ven.setVendormail(rs.getString("vendormail"));
					ven.setVendorname(rs.getString("vendorname"));
					ven.setVendoraddress(rs.getString("vendoraddress"));
					ven.setVendorname(rs.getString("vendornumber"));
					ven.setVendortype(rs.getString("vendortype"));
					ven.setVendorimage(rs.getString("vendorimage"));
					
					session.setAttribute("vendorname", rs.getString("vendorname"));
					session.setAttribute("vendorid", rs.getInt("vendorid"));
					session.setAttribute("vendoraddress", rs.getString("vendoraddress"));
					session.setAttribute("vendornumber", rs.getString("vendornumber"));
					session.setAttribute("vendortype", rs.getString("vendortype"));
					session.setAttribute("vendormail", rs.getString("vendormail"));
					session.setAttribute("vendortype", rs.getString("vendortype"));
					session.setAttribute("vendorimage", rs.getString("vendorimage"));
					dispatcher = request.getRequestDispatcher("Addfood.jsp");
					dispatcher.forward(request, response);

				} 
			  else
			  {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("VendorLogin.jsp");
					dispatcher.forward(request, response);
				}
				
					
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Executed login");
		
			
			
	}

}
