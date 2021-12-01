<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<style type="text/css">
	.wrap {
		  width: 100%;
		  height: 100vh;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  background: rgba(0, 0, 0, 0.1);
	}
	.wrap .review{
		  width: 30%;
		  height: 720px;
		  background: white;
		  border-radius: 20px;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-direction: column;
	}
	.wrap .review form{
		 width : 100%;
		 display: flex;
		 flex-direction: column;
		 align-items: center;
	}	
</style>
</head>
<body>
	<div class="wrap">
		<div class="reivew">
			<div class="name">
				<h3>${sessionScope.user_name }</h3>
			</div>
			<h2>Review</h2>
			<form action="" method="post" onsubmit="return formCheck();">
				<div class="review_item">
					<input type="text" name="review_item" readonly>
				</div>
				<div class="review_context">
					<textarea cols="40" rows="8" name="review_context"></textarea>
				</div>
			</form>
		</div>
	</div>
</body>
</html>