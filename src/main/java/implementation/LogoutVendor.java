package implementation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutVendor
 */
@WebServlet("/LogoutVendor")
public class LogoutVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutVendor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  HttpSession session=request.getSession(); 
		  session.invalidate();
		  response.sendRedirect("VendorLogin.jsp");
		 
			/*
			 * try(PrintWriter out=response.getWriter()){
			 * if(request.getSession().getAttribute("vendorname")!=null) {
			 * request.getSession().removeAttribute("vendorname");
			 * response.sendRedirect("VendorLogin.jsp"); } else {
			 * response.sendRedirect("Addfood.jsp"); } }
			 */
	}

}
