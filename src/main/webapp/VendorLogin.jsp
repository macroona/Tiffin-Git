<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<jsp:include page="Meta.jsp"></jsp:include>
</head>
<body>

<% String m=String.valueOf(request.getAttribute("status"));  %>

<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<section class="vh-100" style="background-color: #9A616D;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img
                src="logo.png"
                alt="login form"
                class="img-fluid" style="border-radius: 1rem 0 0 1rem;"
              />
             <h2 align="center"> Vendor Login</h2>
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">Tiffin</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
             <form name="MyForm" method="post" action="VendorLoginServlet">
                  <div class="form-outline mb-4">
                    <input type="email" name="useremail" id="useremail" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">Email address</label>
                    
                  </div>
                  <span id="user_error"></span>

                  <div class="form-outline mb-4">
                    <input type="password" name="userpassword"id="userpassword" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Password</label>
                  
                  </div>
                    <span id="pass_error"></span>

                  <div class="pt-1 mb-4">
                    <input type="submit" name="login" id="login" onClick="return validate();">
                  </div>
                  </form>

                 
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="Vendorreg.jsp" style="color: #393f81;">Register here</a></p>
                  
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Customer Login? <a href="Login.jsp" style="color: #393f81;">Login here</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
              

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<script type="text/javascript">


var myVar = '<%= request.getAttribute("status") %>';
console.log(myVar);
if(myVar=="success"){
 	swal("Congrats","Registeration Succesfull","success");
 }
else if(myVar=="failed"){
	swal("Sorry","Wrong Email Id or Password","error");
}

function validate(){
	 var uname=document.MyForm.useremail.value;
	 var upass=document.MyForm.userpassword.value;
	 var val=true;
	 var user=document.getElementById('useremail').value;
	 var pass=document.getElementById('userpassword').value;
	 
	 if(uname==""){
		
		swal("Sorry","Please Enter Email","error");
		document.MyForm.useremail.focus();
		 return false;
	 }
	 if(upass==""){
		 swal("Sorry","Please enter Password","error");
			document.MyForm.useremail.focus();
			 return false;
	 }
	 if((uname.length<3)||(uname.length>50)){
		 swal("Sorry","Email is of Invalid Length","error");
			document.MyForm.useremail.focus();
			 return false;
	 }	 
	 if((upass.length<5)||(upass.length>50)){
		 swal("Sorry","Password is of invalid Length","error");
			document.MyForm.useremail.focus();
			 return false;
	 }
	 if(uname.indexof('@')<=0){
		 swal("Sorry","Please fill username is a proper format .extension eg. travel@domain.com/.in","error");
			document.MyForm.useremail.focus();
			 return false;
		
	 }
	 if((uname.charAt(user.length-4)!='.') && (uname.charAt(user.length-3)!='.'))
		{
		 swal("Sorry","Please fill username is a proper format .extension eg. travel@domain.com/.in","error");
			document.MyForm.useremail.focus();
			 return false;
		}
	 return val;
	 
	 
}
</script>

</body>
</html>