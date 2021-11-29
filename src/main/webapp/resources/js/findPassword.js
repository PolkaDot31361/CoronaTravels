/**
 * 
 */
 
function resetPassword(){
	var inputEmail = $("#findMyPasswordForm").serialize();
	
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