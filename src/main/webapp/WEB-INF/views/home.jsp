<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
	
	<!-- google OAuth2.0 client ID -->
	<meta name ="google-signin-client_id" content="419270486004-1tcf5tfk0p2sps8hf7ugatckrqeghtnc.apps.googleusercontent.com">
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./login.css">
    <!-- Jquery -->
	<script src="/resources/js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
    	function toJoinForm(){
    		location.href = "/account/toJoinForm"
    	}
    	function toMain(){
    		location.href = "/map/toMain";
    	}
    	function formCheck(){
    		var user_id = $("#user_id").val();
    		var user_pwd = $("#user_pwd").val();
    		
    		if (user_id == ""){
    			alert("Enter ID");
    			return false;
    		}
    		if (user_pwd ==""){
    			alert("Enter Password");
    			return false;
    		}
    		return true;
    	}
    </script>
    <style type="text/css">
    	a {
  			text-decoration: none;
 			color: black;
		}
		
		li {
		  list-style: none;
		}
		
		.wrap {
		  width: 100%;
		  height: 100vh;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  background: rgba(0, 0, 0, 0.1);
		}
		.wrap form{
			width : 100%;
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		.login {
		  width: 30%;
		  height: 720px;
		  background: white;
		  border-radius: 20px;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-direction: column;
		}
		
		h2 {
		  color: black;
		  font-size: 2em;
		}
		.login_id {
		  margin-top: 20px;
		  width: 80%;
		}
		
		.login_id input {
		  width: 100%;
		  height: 50px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		
		.login_pw {
		  margin-top: 20px;
		  width: 80%;
		}
		.login_pw input {
		  width: 100%;
		  height: 50px;
		  border-radius: 30px;
		  margin-top: 10px;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
		}
		.login_etc {
		  padding: 10px;
		  width: 80%;
		  font-size: 14px;
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  font-weight: bold;
		}
		.submit {
		  margin-top: 50px;
		  width: 80%;
		  text-align: center;
		  display: flex;
		  justify-content: space-evenly;
		}
		.submit input {
		  width: 40%;
		  height: 50px;
		  border: 0;
		  outline: none;
		  border-radius: 10px;
		  background: linear-gradient(to left, rgb(145, 145, 145), rgb(46, 46, 46));
		  color: white;
		  font-size: 1.2em;
		  letter-spacing: 2px;
		}
		.forgot_pw_:hover {
			text-decoration: underline;
		}
    </style>
</head>
<body>
	<c:choose>
	<c:when test="${empty sessionScope.user_name }">
	    <div class="wrap">
	        <div class="login">
	            <h2>Log-in</h2>
	            <form action="/account/login" method="post" onsubmit="return formCheck();">
		            <div class="login_id">
		                <input type="text" name="user_id" id="user_id" placeholder="User ID" autocomplete="off">
		            </div>
		            <div class="login_pw">
		                <input type="password" name="user_pwd" id="user_pwd" placeholder="Password">
		            </div>
		            <div class="submit">
		                <input type="submit" value="Sign in">
		                <input type="button" value="Sign up" onclick="toJoinForm();">
		            </div>
	            </form>
	            
	            <div class="forgot_pw" style="color: gray;">
		        	Forgot your <a href="/account/resetpasswordPage" style="color: gray;" class="forgot_pw_"><I>Password</I></a>?
		        </div>

	            
	            <!-- 카카오 로그인 -->
	            <div>
			    	<!-- 카카오 로그인 창으로 이동 -->
					<a id="reauthenticate-popup-btn" href="javascript:loginFormWithKakao();">
					  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
					</a>
					<p id="reauthenticate-popup-result"></p>
			    </div>
			    <!-- end 카카오 로그인 -->
	            
	            <!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
					</a>
				</div>
				<!-- end 네이버 로그인 -->

				<!-- 구글 로그인 창으로 이동 -->
				<div id="googleBtn" class="g-signin2" data-onsuccess="onSignIn"></div>
				<!-- end 구글 로그인 -->
			</div>
	        <!-- end login div -->
	    </div>
    	<!-- end wrap div -->

	</c:when>
	<c:otherwise>
	<div class="wrap">
		<div class="login">
			<h1>안녕하세요!!</h1> 
			<h1>${sessionScope.user_name } 님!</h1>
			
			<h2>거리두기 여행</h2>
			<div class="submit">
	       		<input type="submit" value="Map" onclick="toMain();">
	       		<input type="button" value="Log Out" onclick="logout(${sessionScope.loginBy });">
	     	</div>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
	<a href="map/toMain">메인페이지</a>
	<!-- SCRIPT -->
	
	
	<!-- Kakao login API -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<!-- Google login API -->
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	
	<script src="/resources/js/Oauth.js"></script>
</body>
</html>
