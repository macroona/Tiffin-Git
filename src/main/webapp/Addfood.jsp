<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="Meta.jsp"></jsp:include>
</head>
<body>
<% int vendid=(Integer)session.getAttribute("vendorid"); 
/* out.println(vendid); */
%>
<h1>THIS IS ADD FOOD</h1>
 <form method="post" action="AddFoodServlet" style="margin:20px">
 <div class="form-group">
 <label for="usr">Add food:</label>
 <input type="text" class="form-control input-sm" id="fooditem" name="fooditem" style="width:200px">
</div>
 <div class="form-group">
 <label for="usr">Add price:</label>
 <input type="text" class="form-control input-sm" id="foodprice" name="foodprice" style="width:100px">
</div>
<input type="hidden" name="flag" value="<%=vendid%>">
<div>
   <h6 class="mb-0 me-4">Food type: </h6>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="inlineRadioOptions"
                      id="femaleGender"
                      value="Veg"
                    />
                    <label class="form-check-label" for="femaleGender">Veg</label>
                  </div>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="inlineRadioOptions"
                      id="maleGender"
                      value="NonVeg"
                    />
                    <label class="form-check-label" for="maleGender">NonVeg</label>
                  </div>
    
  </div>
</div>
</div>
                   <input type="submit" name="signup" id="signup" value="Register" class="btn btn-warning btn-lg">
                   <a class="btn btn-primary shop-item-button btn-lg" type="button" href="LogoutVendor">Logout</a>	
    
</form>
                    
                    
</body>
</html>