<%@page import="pojo.FoodService"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String username = (String) session.getAttribute("name");
if (username == null) {
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style type="text/css">
.table tbody td{
vertical-align:middle;
}
.btn-incre,.btn-decre{
box-shadow:none;
font-size:25px;
}
</style>
</head>
<jsp:include page="Meta.jsp"></jsp:include>
<jsp:include page="Header.jsp"></jsp:include>
<body>
<%
String name=(String)request.getSession().getAttribute("name");
int id=(Integer)request.getSession().getAttribute("userid");
String address=(String)request.getSession().getAttribute("useremail");
String gender=(String)request.getSession().getAttribute("user_gender");
/* out.println(name);
out.println(id);
out.println(address);
out.println(gender); */
ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
List<Cart> cartproduct=null;
if(cart_list != null){
	FoodService foo= new FoodService();
	cartproduct=foo.getCartProducts(cart_list);
	request.setAttribute("cart_list",cart_list);
	int total=foo.gettotalcartprice(cart_list);
	request.setAttribute("total",total);
}

%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>Total price: ${ (total>0)?total:0}</h3>
			<a class="mx-3 btn btn-primary" href="CheckoutServlet">Check Outs</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>	
			<%if(cart_list !=null){
				for(Cart c:cartproduct){ %>
					
					<tr>
					<td><%=c.getFoodname() %></td>
					<td><%=c.getFoodprice() %></td>
					<td>	
					<form action="OrderNow" method ="post" class="form-inline">
					<input type="hidden" name="id" value="<%=c.getFoodid() %>" class="form-input" size="4" style="width:50%">
					<div class="form-group d-flex justify-content-between w-50">
					<a class="btn btn-sm btn-incre" href="Quantityincre_decre?action=inc&id=<%=c.getFoodid()%>"><i style="font-size:24px" class="fas fa-plus-square"></i></a>
					<input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity() %>" size="1"style="width:50%" readonly>
					<a class="btn btn-sm btn-decre" href="Quantityincre_decre?action=dec&id=<%=c.getFoodid()%>"><i style="font-size:24px" class="fas fa-minus-square"></i></a>
					<button type="submit" class="btn btn-primary btn-sm">Buy</button>
					</div>
					
					</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="Removefromcartservlet?id=<%=c.getFoodid() %>">Remove</a></td>
					</tr>
				<%	
					
				}
				
				}%>
			
			
			

			</tbody>


		</table>


	</div>

</body>
</html>