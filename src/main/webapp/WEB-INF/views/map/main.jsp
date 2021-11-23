<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >
<title>Main</title>
</head>
	<style>
		body {
		  font-family: "Lato", sans-serif;
		}
		.sidenav {
		  height: 100%;
		  width: 0;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  left: 0;
		  background-color: #111;
		  overflow-x: hidden;
		  transition: 0.5s;
		  padding-top: 60px;
		}
		.sidenav a {
		  padding: 8px 8px 8px 32px;
		  text-decoration: none;
		  font-size: 25px;
		  color: #818181;
		  display: block;
		  transition: 0.3s;
		}
		.sidenav a:hover {
		  color: #f1f1f1;
		}
		.sidenav .closebtn {
		  position: absolute;
		  top: 0;
		  right: 25px;
		  font-size: 36px;
		  margin-left: 50px;
		}
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
	</style>
	<script>
		function openNav() {
		  document.getElementById("mySidenav").style.width = "250px";
		}
		function closeNav() {
		  document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	</head>
	<body>
		<!-- 상단 메뉴바 -->
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		  <a class="navbar-brand" href="toMain">Corona Travels</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarsExample03">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item">
		        <a class="nav-link" href="#">login</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">logout</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Inquiry</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<!-- 상단 메뉴바 -->
	<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <form class="form-inline my-2 my-md-0">
	      <input class="form-control" type="text" placeholder="Search">
	  </form>
	  <!-- 
	  <a href="#">About</a>
	  <a href="#">Contact</a>
	   -->
	</div>
	<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; MENU</span>
	<h1>~지도여백~</h1>
	</body>
</html>