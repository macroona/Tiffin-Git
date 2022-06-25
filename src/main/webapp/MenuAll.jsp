<%@page import="pojo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Vendor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tiffin</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <jsp:include page="Meta.jsp"></jsp:include>
<jsp:include page="Header.jsp"></jsp:include>
<%
String username=(String)session.getAttribute("name");
if(username==null){
	response.sendRedirect("Login.jsp");
}

%>
</head>

<body style="background-color:#DDDEE7;">
 <%
 ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
 if(cart_list != null){
 	request.setAttribute("cart_list",cart_list);
 }

                List<Vendor> vs=(List<Vendor>)session.getAttribute("list");
                
	             %>
  
  <div class=" shadow-sm p-3 mb-5 bg-body rounded"
    style="margin-left:4%;margin-right:4%;margin-top: 2%;margin-bottom: 1%; ">
    <!-- select food type open -->
    <div class="card-body ">
      <ul class="nav nav-tabs border-end-0 border-warning">
        <li class="nav-item ">
          <a class="nav-link active border border-warning text-warning" aria-current="page" href="MenuAll.jsp">All</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MenuVeg.jsp" style="color: black;">Veg Only</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MenuNonVeg.jsp" style="color: black;">Non-Veg Only</a>
        </li>
      </ul>
      <!-- select food type close -->

      <div class="card-body" style="background-color:#DDDEE7;padding:2%;">
        <!-- Cards Of Vendors Start-->

        <div>
         <div class="row row-cols-auto justify-content-center">
              <%for(Vendor ven : vs){
            	  int forward=ven.getVendorid();
            	  %>
              <div class="col" onclick="">
              
                <div class="card mb-3 shadow p-3 mb-5 bg-body rounded" style="width: 540px; margin: 1%;">
                  <div class="row g-0">
                    <div class="col-md-4">
                      <%--  <img class=" rounded-start img-thumbnail" src="data:image/png;base64,<%=ven.getVendorimage() %>" style="width: 100%; height:200px"   alt="idli.png" /> --%>
                       <img class=" rounded-start img-thumbnail" src="images/<%=ven.getVendorimage() %>" style="width: 100%; height:200px"   alt="idli.png" />
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title"><%=ven.getVendorname() %></h5>
                        <p class="card-text"><%=ven.getVendoraddress() %></p>
                        <p class="card-text"><small class="text-muted"><%=ven.getVendornumber() %></small></p>
                        <a href="FoodDetails.jsp?vendorid=<%=ven.getVendorid()%>">Click here</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <%} %>
  
 
            </div>

         
            <!-- vender cards close -->
          </div>
        </div>
      </div>
    </div>
</body>


</html>