/**
 * 
 */

// 카카오 로그인
function loginFormWithKakao() {
	$.ajax({
        url: '/login/kakaoLogin',
        type: 'GET',
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });
}


/**
	구글 로그인
 */
 
// Google login function initialization 
function onLoad() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
	});
}
 
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	var id_token = googleUser.getAuthResponse().id_token;
	$("#googleBtn").click(function(){
		$.ajax({
			url: '/login/oauth_google',
			type: 'POST',
			data: 'idtoken=' + id_token, 
			dataType: 'JSON',
			beforeSend : function(xhr){
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			},
			success: function(json) {
				if (json.login_result == "success"){
					location.href = "http://localhost:8888/";
				}//end if
	        }//success
		});//ajax
	});//click
}

/**
	호그아웃
 */
function logout(loginBy) {
	const LOGIN_KAKAO = 200;
	const LOGIN_NAVER = 300;
	const LOGIN_GOOGLE = 400;
	
	switch(loginBy){
		case LOGIN_KAKAO:
			KakaoLogout();
			break;
		case LOGIN_NAVER:
			accessLogout();
			break;
		case LOGIN_GOOGLE:
			googleLogout();
			accessLogout();
			break;
		default:
			console.log("일반 로그아웃");
	}
}

/*
 * default 로그아웃
 */
function accessLogout(){
	location.href = "/logout";
}

/*
 * 카카오 로그아웃
 */
function KakaoLogout() {
	$.ajax({
        url: '/logout/kakao',
        type: 'GET',
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });
}

/*
 * 구글 계정으로 로그인시 로그아웃
 */
function googleLogout(){
	// If you log in to Google Account
	if(gapi.auth2 != undefined){
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {
            console.log('User signed out.');
		});
		auth2.disconnect();
	}
}