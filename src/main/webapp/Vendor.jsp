<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">    
    <title>Vendor</title>
</head>
<body style="background-color:#DDDEE7;">
    <!--  navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Dropdown
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">Action</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Disabled</a>
              </li>
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>
    
    <div class="container-fluid" style="padding:3%;">
        <!-- card head start -->
        <div class=" mb-3 shadow p-3 mb-5 bg-body rounded" style="max-width: auto;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="profile.jpg" class="img-fluid rounded-start img-thumbnail" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h3 class="card-title">The Great South Indian Food</h5>
                  <p class="card-text">The Best South Indian Food Availbe In Socity.</p>
                  <p>Wing No. A, Floor No.6 ,Flat No. 5<br> Open : 7 am - 8 Pm </p>
                  <p class="card-text"><small class="text-muted">Owner : Shilpa Shetty</small></p>
                </div>
              </div>
            </div>
          </div>
          <!-- card head end -->
    
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
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Masala Dosa</td>
                    <td>100</td>
                    
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Rava Edli</td>
                    <td>60</td>
                  
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td >Uttapam</td>
                    <td>80</td>
                    
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td>Sambar Wada</td>
                    <td>50</td>
                  </tr>
                </tbody>
              </table>
            <!-- table end -->
        
      </div>
    </div>
</body>
</html>