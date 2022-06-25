<%@page import="pojo.Vendor"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="myconnection.MyconnectionCheck"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<jsp:include page="Meta.jsp"></jsp:include>
<jsp:include page="Header.jsp"></jsp:include>
<%
String username=(String)session.getAttribute("name");
if(username==null){
	response.sendRedirect("Login.jsp");
}

%>
</head>
<body>

<%-- <%

ResultSet rs=null;
Statement st=null;
try{
	Connection con=MyconnectionCheck.getConnection();
	st=con.createStatement();
	
	String query="select * from vendor1";
	rs=st.executeQuery(query);
	
	
	
}
catch(Exception e){
	e.printStackTrace();
}


%> --%>

<div class="container " >
 <%
                List<Vendor> vs=(List<Vendor>)session.getAttribute("list");
                
	             %>
<%--         <div class="row">
         
        <
          <div class="col">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
              
                  <div class="col-md-4">
                    <img src="Idli.png" class="img-fluid rounded-start" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title"><%=ven.getVendorname() %></h5>
                      <p class="card-text"><%=ven.getVendoraddress() %></p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                  </div>
                </div>
              </div>
          </div> --%>
          
          <div class='row card-group'>
<%for(Vendor ven : vs){ %>
  <div class="col-4">
    <div class="card h-100">
     <img src="data:image/png;base64,<%=ven.getVendorimage() %>"  alt="Red dot" />
       
      <div class="card-body">
        <h5 class="card-title"><%=ven.getVendorname() %></h5>
            <h4 class="font-weight-bold blue-text">
                <strong>
                 <%=ven.getVendoraddress() %>
                </strong>
            </h4>
        <p class="card-text">
        <%=ven.getVendormail()%>
        </p>
      </div>
      <div class="card-footer">
        <small class="text-muted">Last updated 3 mins ago</small>
      </div>
    </div>
  </div>
<%} %>
</div>
        <!--   <div class="col">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                  <div class="col-md-4">
                    <img src="Idli.png" class="img-fluid rounded-start" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
      
<div class="container">
        <div class="row">
          <div class="col">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                  <div class="col-md-4">
                    <img src="Idli.png" class="img-fluid rounded-start" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                  </div>
                </div>
              </div>
          </div>
          <div class="col">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                  <div class="col-md-4">
                    <img src="Idli.png" class="img-fluid rounded-start" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div> -->
      


</body>
</html>