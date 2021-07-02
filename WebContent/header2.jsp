<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
       <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <link rel="stylesheet" href="css/jquery.fancybox.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
   
   
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
    <div class="border-bottom top-bar py-2 bg-dark" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            
          </div>
          <div class="col-md-6">
            <ul class="social-media">
             <c:if test="${empty authUser}">
              <li><a href="login.do" style= "font-weight : bold;"><span>Login</span></a></li>
              <li><span> </span></li>
              <li><a href="Join.do" style= "font-weight : bold;"><span>Joinin</span></a></li>
              </c:if>
              <c:if test="${!empty authUser}">
              <c:if test="${authUser.id!='admin'}">
              <li><a href="#" style= "font-weight : bold;"><span>${authUser.name}님</span></a></li>
              <li><span>  </span></li>
              <li><a href="logout.do" style= "font-weight : bold;"><span>Logout</span></a></li>
              </c:if>
              
              <c:if test="${authUser.id=='admin'}">
              <li><a href="MagQnAlist.do" style= "font-weight : bold;"><span>${authUser.name}님</span></a></li>
              <li><span>  </span></li>
              <li><a href="logout.do" style= "font-weight : bold;"><span>Logout</span></a></li>
              </c:if>
                 </c:if>
              
            </ul>
          </div>
        </div>
      </div> 
    </div>
    
    <header class="site-navbar py-4 bg-white js-sticky-header site-navbar-target" role="banner">
    
    <div class="col-11 col-xl-2">
            <h1 class="mb-0 site-logo"><a href="index.do" class="text-black h2 mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LunaClass<span class="text-primary">.</span> </a></h1>
          </div>
    
    </header>
   
    


          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black">
          
        
    
          <span class="icon-menu h3"></span></a></div>

        
      
      
   