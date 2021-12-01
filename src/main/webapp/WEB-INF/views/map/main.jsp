<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<!-- link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" -->
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
		  display:flex;
		  flex-direction: column;
		  align-items: center;
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
		.sidenav form{
			display: flex;
			flex-direction : column;
			align-items: flex-start;
		} 
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
		.sidenav ul li{
			color : #ffffff;
		}
		.sidenav i{
			font-size: 32px;
		  	color: #ffffff;
		  	margin-right: 5px;
		}
		.map_section{
			z-index: 0;
			postion: relative;
			height: 100vh;
			width: 100%;
			overflow: auto;
		}
		.reviewBtn{
			width: 80%;
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
	<script>
		function openNav() {
		  document.getElementById("mySidenav").style.width = "250px";
		}
		function closeNav() {
		  document.getElementById("mySidenav").style.width = "0";
		}
		function addReview(place){
			location.href("/review/addReivew?place=" + place);
		}
	</script>
	</head>
	<body>
	
		<!-- 상단 메뉴바 -->
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<span style="font-size:30px;cursor:pointer; color:white; margin-right: 16px;" onclick="openNav()">&#9776;</span>
		  <a class="navbar-brand" href="toMain">Corona Travels</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarsExample03">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item">
		        <a class="nav-link" href="javascript:void(0)" onclick="logout(${sessionScope.loginBy });">logout</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Inquiry</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<!-- 측면 메뉴바 -->
		<div id="mySidenav" class="sidenav">
	  		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  		<form class="form-inline my-2 my-md-0">
	  			<i class='bx bx-search' id="searchBtn"></i>
	      		<input class="form-control" type="text" placeholder="Search" id="searchText">
	  		</form>
	  		<!-- 
	  		<ul>
	  			<li>
	  				list test
	  			</li>
	  			<li>
	  				does not Show
	  			</li>
	  		</ul>
	  		 -->
		  <!-- 
		  <a href="#">About</a>
		  <a href="#">Contact</a>
		   -->
		</div>
		
		<!-- 지도 표시되는 section -->
		<section class="map_section" id='map'></section>
		
		<!-- kakao map api -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2090152ede9a9b2a0147836b9f6e01eb&libraries=services"></script>
		
		<!-- Oauth -->
		<script src="/resources/js/Oauth.js"></script>
		
		<!-- 지도 생성 관련 javascript -->
		<script>
			var infowindow = new kakao.maps.InfoWindow({zIndex : 1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.510903, 127.060172), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			if (navigator.geolocation){
				
				navigator.geolocation.getCurrentPosition(function(position){
					
					var lat = position.coords.latitude;
					var lon = position.coords.longitude;
					
					var locPosition = new kakao.maps.LatLng(lat, lon);
					map.setCenter(locPosition);
				});
			}else{
				var locPostion = new kakao.map.LatLng(33.450701, 126.570667);
				map.setCenter(locPosition);
			}
			
			$('#searchBtn').click(function(){
				var searchText = $("#searchText").val();
				
				if (searchText == ''){
					alert("검색어를 입력해 주세요.");
					return false;
				}
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
				// 키워드로 장소를 검색합니다
				ps.keywordSearch(searchText, placesSearchCB); 
			
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
		
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
			
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
			
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
			
				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });
					
				    var infoContent = '<div style="padding:5px;font-size:12px;" class="infoWindow">'
				    	infoContent += "<a href=" + place.place_url + " target='_blank'>"
				    	infoContent += place.place_name
				    	infoContent += "</a><br>"
				    	infoContent += '</div>'
				    	
				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent(infoContent);
				        infowindow.open(map, marker);
				    });
				}
			});
		</script>
	</body>
</html>