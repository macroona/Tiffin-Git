<%@page import="pojo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Vendor"%>
<%@page import="pojo.Fooditems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">    
    <title>FoodDetails</title>
    <jsp:include page="Meta.jsp"></jsp:include>
<jsp:include page="Header.jsp"></jsp:include>
  
</head>
<body style="background-color:#DDDEE7;">
<%
ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
if(cart_list != null){
	request.setAttribute("cart_list",cart_list);
}
                		    List<Fooditems> fs=(List<Fooditems>)session.getAttribute("list1");
                  List<Vendor> vs=(List<Vendor>)session.getAttribute("list");
                  
                  String value = request.getParameter("vendorid");
                  int price=0;
                  for(Vendor ven : vs){
                  	int venid=ven.getVendorid();
                  	String valueid=Integer.toString(venid);
                  	if(value.equalsIgnoreCase(valueid)){
%>

    
    <div class="container-fluid" style="padding:3%;">
        <!-- card head start -->
        <div class=" mb-3 shadow p-3 mb-5 bg-body rounded" style="max-width: auto;">
            <div class="row g-0">
              <div class="col-md-4" >
              <%-- <img class="img-fluid rounded-start img-thumbnail" src="data:image/png;base64,<%=ven.getVendorimage() %>"  alt="Red dot" / > --%>
                 <img class=" rounded-start img-thumbnail" src="images/<%=ven.getVendorimage() %>" style="height:450px;width:100%" alt="idli.png" />
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h3 class="card-title">

<%=ven.getVendorname() %></h5>
                  <p class="card-text">Best Home Made Food.</p>
                  <p><%=ven.getVendoraddress() %></p>
                  <p class="card-text"><small class="text-muted"><%=ven.getVendornumber() %></small></p>
                </div>
              </div>
            </div>
          </div>
          <!-- card head end -->
          <%}} %>
    
    <!-- menu -->
   
    
    <div class="shadow p-3 mb-5 bg-body rounded">
      
            <!-- table start -->
            <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">Sr. No.</th>
                    <th scope="col">Food Name</th>
                    <th scope="col">Price</th>
                  </tr>
       
                </thead><%int count=1; %>
                     <% for(Fooditems foo : fs){
        price=foo.getFoodprice();
    	int venid=foo.getVendorid();
    	String venid1=Integer.toString(venid);
    	if(value.equalsIgnoreCase(venid1)){
    		
    	%>
                <tbody>
       
                  <tr>
                                    
                    <td scope="row"><%=count %>
                    <%count=count+1; %>
                    </td>
 
                    <td><%=foo.getFoodname() %></td>
                    <td><%=foo.getFoodprice() %></td>
                    <td><a href="AddtoCart?id=<%=foo.getFoodid()%>&vendorid=<%=value %>" class="btn btn-dark" type="button">ADD TO CART</a></td>
                    <!-- <td><a href="#" class="btn btn-primary shop-item-button" type="button">BUY</a></td> -->
                  </tr>
             
                </tbody>
                  <%} }%>
              </table>
            <!-- table end -->
              
           <%--   <section class="container content-section">
              <h2 class="section-header">CART</h2>
              <% for(Fooditems foo : fs){ %>
              <div class="cart-row">
                  <span class="cart-item cart-header cart-column">ITEM</span>
                  <span class="cart-price cart-header cart-column"><%=foo.getFoodprice()%>E</span>
                  <span class="cart-quantity cart-header cart-column">QUANTity</span>
              </div>
              <div class="cart-total">
                  <strong class="cart-total-title">Total</strong>
                  <span class="cart-total-price">$39.97</span>
              </div>
              
          </section> --%>
         

      </div>
    </div>
</body>
</html>