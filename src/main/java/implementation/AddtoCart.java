package implementation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Cart;

/**
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddtoCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		

		try (PrintWriter out = response.getWriter()) {
			ArrayList<Cart> cartlist = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setFoodid(id);
			cm.setQuantity(1);
			String value=request.getParameter("vendorid");
			RequestDispatcher requestDispatcher=null;

			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			if (cart_list == null) {
				cartlist.add(cm);
				session.setAttribute("cart-list", cartlist);
				requestDispatcher=request.getRequestDispatcher("FoodDetails.jsp?vendorid="+value);
				requestDispatcher.forward(request, response);
				/*response.sendRedirect("FoodDetails.jsp?vendorid="+value);*/
				/* out.println("session created"); */
			} else {
				cartlist = cart_list;
				boolean exist = false;
				  for(Cart c:cart_list) { 
					  if(c.getFoodid()==id) {
						  exist=true;
						  out.print("<h3 style='color:crimson;text-align:center'>Item Already Exist.<a href='Cart.jsp'>Go to Cart Page</a></h3>");
					  }
					 
					  
				  
				  }
				  if(!exist){
					  cartlist.add(cm);
					  requestDispatcher=request.getRequestDispatcher("FoodDetails.jsp?vendorid="+value);
						requestDispatcher.forward(request, response);
						/* response.sendRedirect("FoodDetails.jsp?vendorid="+value); */
						
						
						 
						
				  }
				 
			}
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
