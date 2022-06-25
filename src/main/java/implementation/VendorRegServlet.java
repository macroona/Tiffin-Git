package implementation;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import myconnection.MyconnectionCheck;

/**
 * Servlet implementation class VendorRegServlet
 */
@MultipartConfig
@WebServlet("/VendorRegServlet")
public class VendorRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorRegServlet() {
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
		Connection con=null;
		String uname=request.getParameter("user_name");
		String uaddress=request.getParameter("user_address");
		String vtype=request.getParameter("inlineRadioOptions");
		String uphonenumber=request.getParameter("User_phonenumber");
		String umail=request.getParameter("user_email");
		String upass=request.getParameter("User_password");
		Part file=request.getPart("image");
		System.out.println("in the vendorregservlet");
		String imageFilename=file.getSubmittedFileName();  //get selected image filename
		System.out.println("selected image:"+imageFilename);
		System.out.println(uname);
		System.out.println(uphonenumber);
		RequestDispatcher dispatcher=null;
		HttpSession session=request.getSession(true);  
	    String contextPath = request.getServletContext().getContextPath();
		
		String uploadPath="D:/Project/Tiffin/src/main/webapp/images/"+imageFilename;//upload path where we have to upload our actual image
		System.out.println("upload path:"+uploadPath);
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		//uploading our selected image into images folder
				try {
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				}
				catch (Exception e) {
					e.printStackTrace();	
				}
				
				//getting database connection(jdbc code)
				
				try {
					con=MyconnectionCheck.getConnection();
					
					PreparedStatement pst;
					
					String query="insert into vendor1(vendorname,vendorpassword,vendormail,vendornumber,vendoraddress,vendorimage,vendortype) values(?,?,?,?,?,?,?)";
					pst=con.prepareStatement(query);
					pst.setString(1, uname);
					pst.setString(2, upass);
					pst.setString(3, umail);
					pst.setString(4, uphonenumber);
					pst.setString(5, uaddress);
					pst.setString(6,imageFilename);
					pst.setString(7,vtype);
					int row=pst.executeUpdate();
					if(row>0) {
						request.setAttribute("status", "success");
				dispatcher=request.getRequestDispatcher("VendorLogin.jsp");
				dispatcher.forward(request, response); 
				
				

			}
			else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("Vendorreg.jsp");
				dispatcher.include(request, response);
				
			}
		
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		
	}

}
