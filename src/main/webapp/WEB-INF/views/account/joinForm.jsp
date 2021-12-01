<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원가입 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	var idCheck = false;
	
	function formCheck(){
		
	
		var user_id = document.getElementById("user_id").value;
		var user_pwd = document.getElementById("user_pwd").value;
		var pwCheck = $("#pwCheck").val();
		var user_name = document.getElementById("user_name").value;
		var user_gender = document.getElementsByName("user_gender");
	
		if(user_id == ""){
			alert("아이디를 입력해주세요");
			return false;
		}else if(user_id.length < 5 || user_id.length > 10){
			alert("아이디는 5~10글자로 입력해 주세요");
			return false;
		}
		
		if(user_pwd == ""){
			alert("비밀번호를 입력해주세요");
			return false;
		}else if(user_pwd.length < 4 || user_pwd.length > 8){
			alert("비밀번호는 4~8글자로 입력해 주세요");
			return false;
		}
			
		if(pwCheck != user_pwd){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		if(user_name == ""){
			alert("이름을 입력해주세요");
			return false;
		}
		
		var cnt = 0;
		for(var i=0; i<user_gender.length; i++){
			if(user_gender[i].checked == true){
				cnt++;
			}
		}
		
		if(cnt == 0){
			alert("성별을 선택해 주세요");
			return false;
		}
		if(!idCheck){
			alert("ID를 변경해 주세요")
			return false;
		}
		
		return true;
	}
	
	$(function(){
		
		
		$("#user_id").on("focusout", function(){
			var user_id = $("#user_id").val();
			
			if (user_id = ''){
				alert("ID를 입력해 주세요");
				return;
			}
			
			$.ajax({
				url: "/account/idCheck"
				,type :"get"
				,data :{
					user_id : user_id
				}
				,success(resp){
					if(resp){
						var check = confirm("해당 아이디는 사용이 가능합니다. 사용하시겠습니까?")
						if(check){
							idCheck = true;
						}else{
							idCheck = false;
						}
					}else{
						idCheck = false;
						alert("해당 아이디는 사용 불가능 합니다.");
					}
				}
				,error(e){
					console.log(e);
				}
			});
		});
	});
	
	
</script>
<style type="text/css">
	.wrap {
		  width: 100%;
		  height: 100vh;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  background: rgba(0, 0, 0, 0.1);
		}
	.wrap .join{
		width: 30%;
		height: 720px;
		background: white;
	  	border-radius: 20px;
	  	display: flex;
	 	justify-content: space-evenly;
	 	align-items: center;
	  	flex-direction: column;
	}
	.wrap .join h2{
		color: black;
		font-size: 2em;
	}
	.wrap .join form{
		height: 480px;
		width: 100%;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items:center;
	}
	.wrap .join form div{
		width: 80%;
		display: flex;
		align-items: center;
	}
	.wrap .join form div input[type="text"], input[type="password"]{
		width: 100%;
	  	height: 50px;
		border-radius: 30px;
		margin-top: 10px;
		padding: 0px 20px;
		border: 1px solid lightgray;
		outline: none;
	}
	.wrap .join form .gender{
		height: 50px;
		display: flex;
		justify-content: space-around;
	}
	.wrap .join form .gender .header{
		font-weight: 600;
	}
	.wrap .join form .submit{
		display: flex;
		flex-direction: column;
	}
	.wrap .join form .submit input{
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
<div class="wrap">
	<div class="join">
		<h2>Sign Up</h2>
		<form action="/account/join" method="post" onsubmit="return formCheck();">
			<div class="user_id">
				<input type="text" name="user_id" id="user_id" placeholder="ID" autocomplete="off">
			</div>
			<div class="password">
				<input type="password" name="user_pwd" id="user_pwd" placeholder="Password">
			</div>
			<div class="password">
				<input type="password" id="pwCheck" placeholder="Confirm">
			</div>
			<div class="name">
				<input type="text" name="user_name" id="user_name" placeholder="Name">
			</div>
			<div class="e-mail">
				<input type="text" name="user_email" id="user_email" placeholder="E-mail">
			</div>
			<div class="nickname">
				<input type="text" name="user_nickname" id="user_nickname" placeholder="Nickname">
			</div>
			<div class="gender">
				<span class="header">Gender</span>	
				<label>Male</label>
				<input type="radio" name="user_gender" value="m">
				<label>Female</label>
				<input type="radio" name="user_gender" value="f">
			</div>
			<div class="submit">
				<input type="submit" value="Sign up">
			</div>
		</form>
	</div>
</div>




</body>
</html>