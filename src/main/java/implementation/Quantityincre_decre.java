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

import pojo.Cart;

/**
 * Servlet implementation class Quantityincre_decre
 */
@WebServlet("/Quantityincre_decre")
public class Quantityincre_decre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quantityincre_decre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter()){
			RequestDispatcher requestDispatcher=null;
			String action=request.getParameter("action");
			int id=Integer.parseInt(request.getParameter("id"));
			ArrayList<Cart> cart_list= (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			if(action!=null && id>=1) {
				if(action.equals("inc")) {
					for(Cart c: cart_list) {
						if(c.getFoodid()==id) {
							int quantity=c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							requestDispatcher=request.getRequestDispatcher("Cart.jsp");
							requestDispatcher.forward(request, response);
							/* response.sendRedirect("Cart.jsp"); */
						}
					}
				}
				if(action.equals("dec")) {
					for(Cart c: cart_list) {
						if(c.getFoodid()==id && c.getQuantity()>1) {
							int quantity=c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
							/* response.sendRedirect("Cart.jsp"); */
						}
					}
					requestDispatcher=request.getRequestDispatcher("Cart.jsp");
					requestDispatcher.forward(request, response);
				}
			}else {
				requestDispatcher=request.getRequestDispatcher("Cart.jsp");
				requestDispatcher.forward(request, response);
				
			}
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
