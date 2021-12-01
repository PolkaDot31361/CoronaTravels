/**
 * 
 */
 
function resetPassword(){
	var inputEmail = $("#findMyPasswordForm").serialize();
	var user_email = $("#inputEmail").val();
	var user_id = $("#user_id").val();
	
	if(user_id == ''){
		alert("Enter Your ID");
		return;
	}
	if(user_email ==''){
		alert("Enter your E-mail");
		return;
	}
	
	$.ajax({
		url : "/account/idCheck"
		,type : "get"
		,data : {
			user_id : user_id
			,user_email : user_email
		}
		,success(resp){
			if(resp){
				var check = confirm("Reset Your Password?");
				if (!check){
					return;
				}
			}else{
				alert("There are no ID matching with the E-mail address");
				return;
			}
		}
		,error(e){
			console.log(e)
		}
		
	});
	
	
	$.ajax({
		url: "/reset-password",
		type: "POST",
		data: inputEmail,
		success: function(newPW){
			$("#findMyPasswordForm").each(function(){
				this.reset();
			});
			$(".printRandomPassword").text(newPW);
		}
	});
}