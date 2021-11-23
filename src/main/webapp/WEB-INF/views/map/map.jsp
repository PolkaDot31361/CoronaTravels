<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/sidebar.css">
<script type="text/javascript" src="/resources/js/jquery-3.4.1.js"></script>
</head>
<body>
	<div class="sidebar">
        <div class="logo_details">
            <i class='bx bx-menu' ></i>
            <span class="logo_name">TRAVELS</span>
        </div>
        <ul class="nav_links">
            <li>
                <a>
                    <i class='bx bx-search' id="searchBtn"></i>
                	<input type="text" placeholder="Search" id="searchText">
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">Search</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-coffee' ></i>
                    <span class="link_name">Info</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">Info</a></li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class='bx bxl-python' ></i>
                    <span class="link_name">Reviews</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="#">Reviews</a></li>
                </ul>
            </li>
            <li>
                <a href="https://github.com/PolkaDot31361/CoronaTravels" target="_blank">
                    <i class='bx bxl-github' ></i>
                    <span class="link_name" href="#">Github</span>
                </a>
                <ul class="sub_menu blank">
                    <li><a class="link_name" href="https://github.com/PolkaDot31361/CoronaTravels">Github</a></li>
                </ul>
            </li>
            <li>
            	<div class="stats">
            		hello it's me 
            	</div>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2090152ede9a9b2a0147836b9f6e01eb&libraries=services"></script>
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
			
		    var infoContent = '<div style="padding:5px;font-size:12px;">'
		    	infoContent += place.place_name + "<br>"
		    	infoContent += "<a href=" + place.place_url + " target='_blank'>"
		    	infoContent += place.place_url 
		    	infoContent += "</a><br>"
		    	infoContent += "<input type='button' value='Add Review' class='btn reviewBtn'>"
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
	<script type="text/javascript" src="/resources/js/sidebar.js"></script>
</body>
</body>
</html>