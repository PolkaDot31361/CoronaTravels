<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원가입 ]</title>

<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function formCheck(){
	

	var user_id = document.getElementById("user_id").value;
	var user_pwd = document.getElementById("user_pwd").value;
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
	return true;
}



</script>
</head>
<body>

<form action="/join" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="user_id" id="user_id">
					<input type="button" id="idCheck" value="중복검사">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="user_pwd" id="user_pwd">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="user_name" id="user_name">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="user_email" id="user_email">
				</td>
			</tr>
			<tr>
				<th>성별</th>			
				<td>
					<label>남성</label>
					<input type="radio" id="user_gender" name="user_gender" value="m">
					<label>여성</label>
					<input type="radio" id="user_gender" name="user_gender" value="f">
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="user_nickname" id="user_nickname">
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="가입">
				</th>
			</tr>

	</table>
</form>




</body>
</html>