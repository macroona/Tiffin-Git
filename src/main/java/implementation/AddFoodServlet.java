package implementation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myconnection.MyconnectionCheck;

/**
 * Servlet implementation class AddFoodServlet
 */
@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFoodServlet() {
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
		PrintWriter out=response.getWriter();
		Connection con=null;
		String fooditem=request.getParameter("fooditem");
		String foodprice=request.getParameter("foodprice");
		String foodtype=request.getParameter("inlineRadioOptions");
		String flag=request.getParameter("flag");
		int vendid=Integer.parseInt(flag);
		out.println("Fooditem:"+fooditem);
		out.println("Foodprice:"+foodprice);
		out.println("Foodtype:"+foodtype);
		out.println("Flag:"+flag);
		RequestDispatcher dispatcher=null;
		try {
		    con=MyconnectionCheck.getConnection();
			PreparedStatement pst=con.prepareStatement("insert into fooditem(foodname,foodprice,vendorid,foodtype) values(?,?,?,?)");
			
			pst.setString(1,fooditem );
			pst.setString(2, foodprice);
			pst.setInt(3,vendid);
			pst.setString(4,foodtype);
			int rowcount=pst.executeUpdate();
			
			
			if(rowcount>0) {
				request.setAttribute("status", "success");
				dispatcher=request.getRequestDispatcher("Addmorefood.jsp");
				dispatcher.forward(request, response); 
			  }
		
		

	
	else {
		request.setAttribute("status", "failed");
		 out.print("<h3 style='color:crimson;text-align:center'>Failed</h3>");
	  }		
	}
		

		catch(Exception e) {
			e.printStackTrace();
		}

}}
