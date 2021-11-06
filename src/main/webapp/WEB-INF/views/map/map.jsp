<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/sidebar.css">
</head>
<body>
	<div class="sidebar">
        <div class="logo_details">
            <i class='bx bx-menu' ></i>
            <span class="logo_name">Polkadot31361</span>
        </div>
        <ul class="nav_links">
            <li>
                <a href="aboutMe.html">
                    <i class='bx bx-user' ></i>
                    <span class="link_name">menu 0</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">About Me</a></li>
                </ul>
            </li>
            <li>
                <a href="aboutMe.html">
                    <i class='bx bx-coffee' ></i>
                    <span class="link_name">Menu 1</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">About Me</a></li>
                </ul>
            </li>
            <li>
                <a href="aboutMe.html">
                    <i class='bx bxl-python' ></i>
                    <span class="link_name">Menu 4</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">About Me</a></li>
                </ul>
            </li>
            <li>
                <a href="aboutMe.html">
                    <i class='bx bx-coffee' ></i>
                    <span class="link_name">Menu 5</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">About Me</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxl-html5'></i>
                    <span class="link_name">menu 2</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">menu 2</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxl-spring-boot' ></i>
                    <span class="link_name" href="#">Menu 3</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">Menu 3</a></li>
                </ul>
            </li>
            <li>
                <a href="https://www.github.com/PolkaDot31361" target="_blank">
                    <i class='bx bxl-github' ></i>
                    <span class="link_name" href="#">Github</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">Github</a></li>
                </ul>
            </li>
            <li> 
            <div class="profile_details">
                <div class="profile_content">
                    <img src="#" alt="profile">
                </div>
                    
                    <div class="name_job">
                        <div class="profile_name">Big</div>
                        <div class="profile_job">small</div>
                    </div>
                    <a href="index.html"><i class='bx bx-home' ></i></a>
                </div>
            </li>
        </ul>
    </div>
    <section class="home_section" id = 'map'></section>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2090152ede9a9b2a0147836b9f6e01eb"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
	<script type="text/javascript" src="/resources/js/sidebar.js"></script>
</body>
</body>
</html>