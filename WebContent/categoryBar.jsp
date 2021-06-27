<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/848d8f1fa9.js" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
 
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900"
	rel="stylesheet">
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

<style>

ul:after{
    content:'';
    display: block;
    clear:both;
}
.list {
    float: left;
    
}
.flex-sm-fill {
    display: block;
    color: grey;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.flex-sm-fill:hover:not(.active) {
    background-color: white;
}

</style>





</header>

<body>

	<div style= "background-color: #F6F4F4"><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-4">
  <form class="d-flex" action="searchClassList.do" method="get">
        <input name="CL_NAME" class="form-control me-2" type="text" placeholder="어떤 재능을 찾으시나요?" aria-label="어떤 재능을 찾으시나요?">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form></div>
  <div class="col-md-4"></div>
</div>

<br><br>
</div>

<div class="nav nav-pills flex-column flex-sm-row" style= "background-color: #F6F4F4">
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <a class="flex-sm-fill" href="artClassList.do"><i class="fas fa-palette"></i><br>예술</a>
  <a class="flex-sm-fill" href="lifeClassList.do" ><i class="fas fa-hand-holding-heart"></i><br>문화, 생활</a>
  <a class="flex-sm-fill" href="healthClassList.do"><i class="fas fa-walking"></i><br>건강, 미용</a>
  <a class="flex-sm-fill" href="developmentClassList.do"><i class="fas fa-file-code"></i><br>IT/개발</a>
  <a class="flex-sm-fill" href="therapyClassList.do"><i class="fas fa-user-nurse"></i><br>심리</a>
  <a class="flex-sm-fill" href="etcClassList.do"><i class="fab fa-rocketchat"></i><br>기타</a>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
</div>

<div class="nav nav-pills flex-column flex-sm-row">
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
</div>

	
</body>
</html>