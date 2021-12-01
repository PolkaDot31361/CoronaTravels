<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 초기화</title>
<style type="text/css">
	.wrap {
		  width: 100%;
		  height: 100vh;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: center;
		  background: rgba(0, 0, 0, 0.1);
	}
	.wrap .container{
		  width: 30%;
		  height: 720px;
		  background: white;
		  border-radius: 20px;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-direction: column;
	}
	.wrap .container form{
		width : 100%;
		display : flex;
		flex-direction: column;
		align-items: center;
		justify-content: space-around; 
	}
	.wrap .container input{
		  width: 80%;
		  height: 50px;
		  border-radius: 30px;
		  margin: 10px 0;
		  padding: 0px 20px;
		  border: 1px solid lightgray;
		  outline: none;
	}
	.wrap .container form button{
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
</style>
</head>
<body>
	
	<!-- 비밀번호 찾기 -->
	<div class="wrap">
		<div class="container">
			<h2>Forgot your password?</h2>
			<input type="text" placeholder="Your ID" id="user_id">
			<form id="findMyPasswordForm" method="post" onsubmit="return false;">
				<input type="text" id="inputEmail" name="inputEmail" placeholder="Your E-mail Address" required="required">
				<button type="button" onclick="resetPassword();">찾기</button>
			</form>
		</div>
		<div class="printRandomPassword"></div>
	</div>
	
	<!-- 랜덤 생성 비밀번호 -->
	
	<!-- SCRIPT -->
	<!-- Jquery -->
	<script src="/resources/js/jquery-3.4.1.js"></script>
	
	<script src="/resources/js/findPassword.js"></script>
</body>
</html>