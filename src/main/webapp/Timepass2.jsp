<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Login Panel..</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="validatemethod.js"></script>

</head>
<body>


<br>
<h1 align="center"  class="p-3 mb-2 bg-info text-white">Login Page</h1>
<br><br>
 <div class="hero-image1">
      
<form action="login" method="post"> <!-- onsubmit="return validation()" -->
<div class="form-group">
<label class="badge">UserName : </label>
<input type="text" name="username" id="username" class="form-control">
<span id="user_error"></span>
</div>
<br>
<div class="form-group">
<label class="badge">Password : </label>
<input type="password" name="password" id="password" class="form-control">
<span id="pass_error"></span>
</div>

<!-- <div>
<label class="form-group" id="checkbox">
<input type="checkbox"  name="remember" onclick=" return checkoutd()">Remember me</label>
<span id="check_error"></span>
</div> -->



<input type="submit" value="Login" id="submit"  class="btn btn-success" onclick="logvalid();"> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="Clear" class="btn btn-danger"> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="forgetpassword.jsp" class="btn btn-warning">I don't know my password </a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="Registraction.jsp" class="btn btn-info">New User...!</a> 

</form>
</div>
 <script type="text/javascript">
/* function checkoutd()
{
	var check = document.getElementById('checkbox').value;
	
	if(check == "")
		{
		document.getElementById('check_error').innerHTML = "Please fill all details";
		return false;
		}
} */
 function validation()
{
	var user = document.getElementById('username').value;
	var pass = document.getElementById('password').value;
	
	
	
	if(user == "")
		{
		document.getElementById('user_error').innerHTML = "Please fill username!";
		return false;
		}
	if(pass == "")
		{
		document.getElementById('pass_error').innerHTML = "Please fill password";
		return false;
		}
	if((user.length < 3) || (user.length > 50))
	{
		document.getElementById('user_error').innerHTML = "username must be 3 to 20 character";
		return false;
	}
	if((pass.length < 5) || (pass.length > 20))
	{
		document.getElementById('pass_error').innerHTML = "password must be 5 to 20 ";
		return false;
	}
	if(user.indexOf('@')<=0)
		{
		document.getElementById('user_error').innerHTML = "Please fill username is a proper format eg. travel@domain.com/.in";
		return false;
		}
	if((user.charAt(user.length-4)!='.') && (user.charAt(user.length-3)!='.'))
		{
		document.getElementById('user_error').innerHTML = "Please fill username is a proper format .extension eg. travel@domain.com/.in";
		return false;
		}
	
	
} 
</script>

 

</body>
</html>