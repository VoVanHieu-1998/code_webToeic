$(document).ready(
		function() {
			
			$("#username").blur(function(){
				username = $("#username").val();
				$.ajax({
					url : "/toeic2020/api/checkUser",
					type : "POST",
					data : {
						username : username
					},
					success : function(value) {
						if (value == "false") {
							 $("#message").css("display","block");
					        $("#message").text("Username not exiest.");
					        $("#sub").prop('disabled', true);
						}
						else  {
							$("#message").css("display", "none");
							 $("#sub").prop('disabled', false);
								
						}

					}
				})
				
				
			})
			

			
				
			
			$("#dangnhap").click(function() {
				$(".container-login-form").show();
				$(".container-signup-form").css("display", "none");
				$("#dangnhap").addClass("actived");
				$("#dangki").removeClass("actived");

			});
			
			$("#dangki").click(function() {
				$(".container-login-form").hide();

				$(".container-signup-form").show();
				$("#dangki").addClass("actived");
				$("#dangnhap").removeClass("actived");
			});

			
		})