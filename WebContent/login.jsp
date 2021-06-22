<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Login 10</title>
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
		      	<h3 class="mb-4 text-center">Have an account?</h3>
		      	<form action="login.do" class="signin-form" method="post">
		      		<div class="form-group">
		      			<input type="text" class="form-control" placeholder="Username" name="id" required>
		      		</div>
	            <div class="form-group">
	              <input id="password-field" type="password" class="form-control" placeholder="Password" name="password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3" >LogIn</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<a href="#" style="color: #fff">Forgot ID</a>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
	            </div>
	          </form>
	          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
	          <div class="social d-flex text-center">
	          
	          
<div class="col-lg-12;">	          
 <p id="GgCustomLogin" class="col-lg-12;">
  <a href="javascript:void(0)" class="px-2 py-2 mr-md-1 rounded">
   <span class="ion-logo-twitter mr-2">Login with Google</span>
  </a>
</p>




   <p onclick="kakaoLogin();" class="col-lg-12;">
      <a href="javascript:void(0)" class="px-2 py-2 mr-md-1 rounded">
          <span class="ion-logo-twitter mr-2">카카오 로그인</span>
      </a>
   </p>
      </div>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('9f103bed4cb96f9f79465e272affdad7'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
           console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
<script>

//처음 실행하는 함수
function init() {
   gapi.load('auth2', function() {
      gapi.auth2.init();
      options = new gapi.auth2.SigninOptionsBuilder();
      options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
      options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
      gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
   })
}

function onSignIn(googleUser) {
   var access_token = googleUser.getAuthResponse().access_token
   $.ajax({
       // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
      url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
      , data: {personFields:'birthdays', key:'AIzaSyCghBN6Hpuoth6sgwI3DQjHZF73CINnObQ', 'access_token': access_token}
      , method:'GET'
   })
   .done(function(e){
        //프로필을 가져온다.
      var profile = googleUser.getBasicProfile();
      console.log(profile)
   })
   .fail(function(e){
      console.log(e);
   })
}
function onSignInFailure(t){      
   console.log(t);
}
</script>

<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="login/js/jquery.min.js"></script>
  <script src="login/js/popper.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>

	</body>
</html>

    