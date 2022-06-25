package implementation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
/*import java.sql.Date;*/
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myconnection.MyconnectionCheck;

import java.util.*;

import pojo.Cart;
import pojo.Order;
import pojo.OrderService;
import pojo.User;

/**
 * Servlet implementation class OrderNow
 */
@WebServlet("/OrderNow")
public class OrderNow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderNow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()){
			RequestDispatcher requestDispatcher=null;
			SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();  
			/* java.util.Date date= new java.util.Date(); */
			/* User user=(User)request.getSession().getAttribute("userid"); */
			String name=(String)request.getSession().getAttribute("name");
			int id=(Integer)request.getSession().getAttribute("userid");
			String stringid=String.valueOf(id);
			String address=(String)request.getSession().getAttribute("useremail");
			String gender=(String)request.getSession().getAttribute("user_gender");
			
				if(stringid!=null) {
					String foodid=request.getParameter("id");
					out.println(foodid);
					int quantity=Integer.parseInt(request.getParameter("quantity"));
					if(quantity<=0) {
						quantity=1;
					}
					Order order= new Order();
					order.setFoodid(Integer.parseInt(foodid));
					order.setUid(id);
					order.setQuantity(quantity);
					order.setDate(simpleDateFormat.format(date));
					
					OrderService orderService=new OrderService(MyconnectionCheck.getConnection());
					boolean result=orderService.insertorder(order);
					
					if(result) {
						
						ArrayList<Cart> cart_list=(ArrayList<Cart>)request.getSession().getAttribute("cart-list");
						if(cart_list!=null) {
							for(Cart c:cart_list) {
								if(c.getFoodid()==Integer.parseInt(foodid)) {
									cart_list.remove(cart_list.indexOf(c));
									break;
								}
							}
							requestDispatcher=request.getRequestDispatcher("Cart.jsp");
							requestDispatcher.forward(request, response);
						}
					}else {
						out.println("order failed");
					}
					
					
				}
				else {
					requestDispatcher=request.getRequestDispatcher("Login.jsp");
					requestDispatcher.forward(request, response);
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
