<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.Customer_bean" %>
<!doctype html>
<html lang="en">
  <head>
  <%String path =(String)request.getAttribute("path"); %>
     <title>LunaClass : 회원가입 완료</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name ="google-signin-client_id" content="415182734149-jp3iu7cs3274anh0cqd2qln272ppuslv.apps.googleusercontent.com">

   <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="login/css/style.css">
    <link rel="stylesheet" href="css/style.css">
   </head>

   <body class="img js-fullheight" style="background-image: url(login/images/hero_1.jpg);">
   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section" style="font-size : 50px">LunaClass</h2>
            </div>
         </div>
         <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
               <div class="login-wrap p-0">
               <h3 class="mb-4 text-center" style="font-size : 60px">환영합니다!</h3>
               <p style="font-weight : 10px; text-align : center;">회원가입을 축하합니다.</a>
               <br>
               <a>LunaClass의 새로운 아이디는 입니다. </a>
               <form action="index.jsp" class="signin-form" method="post">
               <div class="form-group">
                  <button type="submit" href="index.do" class="form-control btn btn-primary submit px-3" >홈</button>
               </div>
                   </form>
               <form action="login.jsp" class="signin-form" method="post">
               <div class="form-group">
                  <input type="hidden" class="form-control" placeholder="QA_ID" name="path" value=<%=path%> />
                  <button type="submit" href="login.jsp" class="form-control btn btn-primary submit px-3" >로그인</button>
               </div>
             </form>
        </div>
        </div>
        </div>
        </div>
        </section>
        
   <script src="login/js/jquery.min.js"></script>
  <script src="login/js/popper.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>
<jsp:include page="footer2.jsp"/>
   </body>
</html>