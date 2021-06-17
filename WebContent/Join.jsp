<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
     <title>LunaClass : 회원가입</title>
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
               <h2 class="heading-section">Luna Class</h2>
            </div>
         </div>
         <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
               <div class="login-wrap p-0">
               <h3 class="mb-4 text-center">회원가입</h3>
               <form action="Join.do" class="signin-form" method="post">
                  <div class="form-group">
                     <input type="text" class="form-control" placeholder="ID" name="id" required>
                  </div>
               <div class="form-group">
                 <input id="password-field" type="password" class="form-control" placeholder="password" name="password" required>
                 <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
               </div>
               <div class="form-group">
                 <input id="password-field" type="password" class="form-control" placeholder="password" name="confirmPassword" required>
                 <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
               </div>
                <div class="form-group">
                     <input type="text" class="form-control" placeholder="Name" name="name" required>
                  </div>
                <div class="form-group">
                     <input type="text" class="form-control" placeholder="Address" name="addr" required>
                  </div>
                <div class="form-group">
                     <input type="text" class="form-control" placeholder="Tel" name="tel" required>
                  </div>
               <div class="form-group">
                  <button type="submit" class="form-control btn btn-primary submit px-3" >LogIn</button>
               </div>
             </form>
        
             


   <script src="login/js/jquery.min.js"></script>
  <script src="login/js/popper.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>

   </body>
</html>