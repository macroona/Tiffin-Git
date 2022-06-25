package implementation;

import java.io.IOException;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myconnection.MyconnectionCheck;
import pojo.Cart;
import pojo.Order;
import pojo.OrderService;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out= response.getWriter()){
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); 
			RequestDispatcher dispatcher=null;
			//retrieve cart product
			ArrayList<Cart> cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
			String name=(String)request.getSession().getAttribute("name");
			int id=(Integer)request.getSession().getAttribute("userid");
			//check auth
			if(cart_list !=null && name!=null) {
				for(Cart c:cart_list) {
					//prepare order object.
					Order order=new Order();
					order.setFoodid(c.getFoodid());
					order.setUid(id);
					order.setQuantity(c.getQuantity());
					order.setDate(simpleDateFormat.format(date));
					
					//Instantiate orderservice.
					OrderService orderService=new OrderService(MyconnectionCheck.getConnection());
					boolean result=orderService.insertorder(order);
					if(!result) break;
				}
				
				cart_list.clear();
				response.sendRedirect("Orders.jsp");
				
				
			}
			else {
				if(name==null) response.sendRedirect("Login.jsp");
				response.sendRedirect("Cart.jsp");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
