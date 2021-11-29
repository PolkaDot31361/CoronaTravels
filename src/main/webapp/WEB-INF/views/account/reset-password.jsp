<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 초기화</title>
</head>
<body>
	
	<!-- 비밀번호 찾기 -->
	<div>
		<h3>비밀번호 발급기</h3>
		<form id="findMyPasswordForm" method="post" onsubmit="return false;">
			<p>
				<label>이메일</label>
				<input type="text" id="inputEmail" name="inputEmail"
					placeholder="회원가입한 이메일을 압력하세요" required="required">
			</p>
			<button type="button" onclick="resetPassword();">찾기</button>
		</form>
	</div>
	
	<!-- 랜덤 생성 비밀번호 -->
	<div class="printRandomPassword"></div>
	
	<!-- SCRIPT -->
	<!-- Jquery -->
	<script src="/resources/js/jquery-3.4.1.js"></script>
	
	<script src="/resources/js/findPassword.js"></script>
</body>
</html>