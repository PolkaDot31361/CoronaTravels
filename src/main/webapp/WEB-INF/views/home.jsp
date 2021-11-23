<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./login.css">
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
		
		.login {
		  width: 30%;
		  height: 600px;
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
	<c:when test="${empty sessionScope.userID }">
	<form action="/account/login" method="post" onsubmit="return formCheck();">
	    <div class="wrap">
	        <div class="login">
	            <h2>Log-in</h2>
	            <div class="login_id">
	                <input type="text" name="" id="" placeholder="Username">
	            </div>
	            <div class="login_pw">
	                <input type="password" name="" id="" placeholder="Password">
	            </div>
	            <br>
	            <div class="forgot_pw" style="color: gray;">
	                Forgot your <a href="" style="color: gray;" class="forgot_pw_"><I>Password</I></a>?
	            </div>
	            <div class="submit">
	                <input type="submit" value="Sign in">
	            </div>
	        </div>
	    </div>
    </form>
	</c:when>
	<c:otherwise>
	<div class="container">
		<div class="logo">거리두기 여행</div>
		<div class="buttons">
       		<input type="submit" value="Book Keeper" class="btn btn1 btn-primary" onclick="">
       		<input type="button" value="Log Out" class="btn btn2 btn-primary" onclick="">
     	</div>
	</div>
	</c:otherwise>
	</c:choose>
<a href = "map/toMap">지도 바로가기</a>
<br>
<a href="map/toMain">메인페이지</a>
</body>
</html>
