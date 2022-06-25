<%@page import="myconnection.MyconnectionCheck"%>
<%@page import="pojo.OrderService"%>
<%@page import="pojo.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   <jsp:include page="Meta.jsp"></jsp:include>
<jsp:include page="Header.jsp"></jsp:include>
<%
String name=(String)request.getSession().getAttribute("name");
int id=(Integer)request.getSession().getAttribute("userid");
List<Order> orders= new OrderService(MyconnectionCheck.getConnection()).userorder(id); %>
</head>
<body>
<div class="container">
<div class="card-header my-3">All orders</div>
<table class="table table-light">
<thead>
<tr>
<th scope="col">Date</th>
<th scope="col">Name</th>
<th scope="col">Quantity</th>
<th scope="col">Price</th>
<th scope="col">Cancel</th>
</tr>
</thead>
<tbody>
<% if(orders!=null){
	for(Order o:orders){%>
	<tr>
	<td><%=o.getDate() %></td>
	<td><%=o.getFoodname() %></td>
	<td><%=o.getQuantity() %></td>
	<td><%=o.getFoodprice() %></td>
	<td><a class="btn btn-sm btn-danger" href="Cancerorderservlet?id=<%=o.getOrderid() %>">Cancel</a></td>
	</tr>
	<%
	}
}
%>

</tbody>

</table>


</div>

</body>
</html>