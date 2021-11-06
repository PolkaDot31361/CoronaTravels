<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<style type="text/css">
    	.container{
    		justify-content: space-between;
    	}
        .container .logo{
            text-align: center;
            font-size: 70px;
            font-weight: 600;
            color : #103e78;
        }
        .container div{
            display: flex;
            flex-direction: column;
            justify-content : space-evenly;
            align-items: center;
            margin: 15px;
            padding: 5px;
        }
    </style>
	<script type="text/javascript" src="/resources/js/jquery-3.4.1.js"></script>
</head>
<body>
<h1>
	로그인 페이지
</h1>

	<c:choose>
	<c:when test="${empty sessionScope.userID }">
	<form action="/account/login" method="post" onsubmit="return formCheck();">
        <div class="container">
        	<div class="logo">LOG IN</div>
        	<div class="inputs">
	        	<input type="text" placeholder="ID" class="in-ctrl" id="id" name="">
    	    	<input type="password" placeholder="Password" class="in-ctrl" id="pw" name="">
        	</div>
        	<div class="buttons">
        		<input type="submit" value="Log In" class="btn btn-primary btn1">
        		<input type="button" value="Sign In" class="btn btn-primary btn2" onclick="">
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
</body>
</html>
