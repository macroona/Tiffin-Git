	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed&display=swap" rel="stylesheet">
<style >

    .navbar{
        background-color: #0B0C10;
    }
  		#searchbar{width:50%}
        #searchbutton{margin-left:15px}
        #searchdiv{width:100%}

        @media(min-width: 780px) {
            li{
                padding-left:10%;
                padding-right:10% ;
                
            }
            #logoHead{
                display: inline;
                margin: 10px;
            }
        }
        @media(max-width: 480px) {
            #searchbar{width:100%;margin: 5px;}
            #logoHead{
                display: block;
               margin: 10px;
            }
            
        }
</style>
<!-- CSS only -->

</head>
<nav class="navbar navbar-expand-sm navbar-dark">
  <a class="navbar-brand" href="#">
    <img src="logo.png" width="140" height="100" class="d-inline-block align-middle" style="margin:10px" alt="">
    <h2 id="logoHead" style="font-family:Algerian">Tiffin</h2>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="MenuAll.jsp">Home</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="Cart.jsp">Cart<span class="badge badge-danger px-1">${cart_list.size() }</span></a>
      </li>
        </li>
       <li class="nav-item active">
        <a class="nav-link" href="Orders.jsp">Orders</a>
      </li>
  <!--      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Product
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Veg</a>
          <a class="dropdown-item" href="#">Non Veg</a>
          
        </div>
      </li> -->
       <li class="nav-item active">
        <a class="nav-link" href="Logout">Logout</a>
      </li>
      
      
      <li class="nav-item active" style="font-family: 'Sansita Swashed', cursive;color:white;font-size:20px" >
       <%=session.getAttribute("name") %>
      </li>
      <!-- <li class="nav-item active">
        <a class="nav-link" href="#">Register</a>
      </li> -->
    </ul>
   
  </div>
</nav>
<!-- <div id="searchdiv" class="text-sm-center" style="margin-top:20px">
 <form class="form-inline my-2 my-lg-0" id="formsearchid">
      <input class="m-2 form-control " type="search" placeholder="Search" aria-label="Search" style="display: inline;" id="searchbar">
      <button class="btn btn-outline-success " type="submit" id="searchbutton">Search</button>
    </form>
</div>
 -->
</body>
</html>