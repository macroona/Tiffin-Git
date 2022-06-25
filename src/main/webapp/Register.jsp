<%@page import="pojo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<jsp:include page="Meta.jsp"></jsp:include>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<% String m=String.valueOf(request.getAttribute("status"));  %>
 <%ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
 if(cart_list != null){
 	request.setAttribute("cart_list",cart_list);
 }%>
<%
/* Get and show success message if user account is correct.*/
String message = "";
Object messageObj = request.getAttribute("status");
if(messageObj!=null)
{
 message = (String)messageObj;
 out.println(message);
}
%>
<%=message %>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
            <div class="col-xl-6 d-none d-xl-block">
              <img
                src="logo.png"
                alt="Tiffin Logo"
                class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;"
              />
               <h2 align="center"">Take Away Tiffin</h2>
            </div>
           
            <div class="col-xl-6">
              <div class="card-body p-md-5 text-black">
                <h3 class="mb-5 text-uppercase">Customer registration form</h3>
                <form name="MyForm" method="post" action="RegistrationServlet" onsubmit="return validate()">
                <div class="row">
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="user_name" id="user_name" class="form-control form-control-lg" autocomplete="off"/>
                      <label class="form-label" for="form3Example1m">Name</label>
                    </div>
                  </div>
              

                <div class="form-outline mb-4">
                  <input type="text" name="user_address" id="user_address" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example8">Address</label>
                </div>

                <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                  <h6 class="mb-0 me-4">Gender: </h6>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="inlineRadioOptions"
                      id="femaleGender"
                      value="Female"
                    />
                    <label class="form-check-label" for="femaleGender">Female</label>
                  </div>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="inlineRadioOptions"
                      id="maleGender"
                      value="Male"
                    />
                    <label class="form-check-label" for="maleGender">Male</label>
                  </div>

                  <div class="form-check form-check-inline mb-0">
                    <input
                      class="form-check-input"
                      type="radio"
                      name="inlineRadioOptions"
                      id="otherGender"
                      value="Other"
                    />
                    <label class="form-check-label" for="otherGender">Other</label>
                  </div>

                </div>
                <div class="form-outline mb-4">
                  <input type="text" name="User_phonenumber" id="User_phonenumber" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example90">Phone Number</label>
                </div>

       
                <div class="form-outline mb-4">
                  <input type="email" name="user_email"id="form3Example97" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example97">Email ID</label>
                </div>
                
                 <div class="form-outline mb-4">
                  <input type="password" name="User_password" id="User_password" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example90">Password</label>
                </div>
                

                <div class="d-flex justify-content-end pt-3">
                  
                  <input type="submit" name="signup" id="signup"  value="Register" class="btn btn-warning btn-lg ms-2">
                </div>
                
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script type="text/javascript">

function validate(){
	 var uname=document.MyForm.user_name.value;
	 var uaddress=document.MyForm.user_address.value;
	 var ugender=document.MyForm.inlineRadioOptions.value;
	 var uphonenumber=document.MyForm.User_phonenumber.value;
	 var uemail=document.MyForm.user_email.value;
	 var upassword=document.MyForm.User_password.value;
	 var val=true;
	 
	 
	 if(uname==""){
		
		swal("Sorry","Please Enter Name","error");
		document.MyForm.user_name.focus();
		 return false;
	 }
	 if(uaddress==""){
		 swal("Sorry","Please enter Address","error");
			document.MyForm.user_address.focus();
			 return false;
	 }
	 if(uaddress.length<10){
		 swal("Sorry","Address is of Invalid Length","error");
			document.MyForm.user_address.focus();
			 return false;
	 }
	 if(ugender==""){
			
			swal("Sorry","Please Select Gender","error");
			document.MyForm.inlineRadioOptions.focus();
			 return false;
		 }

	 if(uphonenumber==""){
			
			swal("Sorry","Please Enter Phone Number","error");
			document.MyForm.User_phonenumber.focus();
			 return false;
		 }

	 if(uemail==""){
			
			swal("Sorry","Please Enter Email","error");
			document.MyForm.user_email.focus();
			 return false;
		 }

	 if(upassword==""){
			
			swal("Sorry","Please Enter Password","error");
			document.MyForm.User_password.focus();
			 return false;
		 }
}


























</script>



<!-- <script>
var diction = {
		  Maharasthra: ["Mumbai", "Pune", "Nashik"],
		  Karnataka: ["Udupi", "Banglore", "Manglore"],
		  Gujarat:["Ahemdabad","Surat","Vadodara"],
		  UttarPradesh:["Varanasi","Mirzapur","Pahaganj"]
		}

		// bind change event handler
		$('#State').change(function() {
		  // get the second dropdown
		  $('#City').html(
		      // get array by the selected value
		      diction[this.value]
		      // iterate  and generate options
		      .map(function(v) {
		        // generate options with the array element
		        return $('<option/>', {
		          value: v,
		          text: v
		        })
		      })
		    )
		    // trigger change event to generate second select tag initially
		}).change()


</script>
 -->
</body>
</html>