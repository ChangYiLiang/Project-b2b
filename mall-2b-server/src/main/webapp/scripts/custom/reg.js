requirejs(['core', 'common'], function(){
	var reg = MyApp.namespace("Register");
	reg.init = function() {
		// 初始化验证
		$("#addForm").i9heValidate({submitHandler:function(){
			var emailError = $("#emailError").html();
			var usernameError= $("#usernameError").html();
			var username = $("#username").val();
			var mailName = $("#mailName").val();
			var password = $("#password").val();
			var email = $("#email").val();
			var validcode = $("#validcode").val();
			if(!username || username==''){
				return;
			}
			if(!mailName || mailName==''){
				return;
			}
			if(!password || password==''){
				return;
			}
			if(!email || email==''){
				return;
			}
			if(!validcode || validcode==''){
				$("#errorCode").html("请输入验证码");
				return;
			}
			if(!$("input[type='checkbox']").is(':checked')){
				$("#zcxy").html("必选项");
				return;
			}
			if(emailError || emailError!=''){
				return;
			}
			if(usernameError || usernameError!=''){
				return;
			}
			
			$.post("add.do",{username:username,mailName:mailName,password:password,email:email,validcode:validcode},function(data){
				if(data=='error'){
					$("#errorCode").html("验证码错误");
					$("#mCode").click();
				}else if(data=='success'){
					layer.alertEx({content: "注册成功即将跳转到登陆页面", end: function() {
						window.location.href="login.html";
					}});
				}else if(data=='fail'){
					alert("重复注册");
				}
				
			},'json')
		}});
		
		$("#username").blur(function(){
			 var username = $("#username").val();
			 var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
			　if(reg.test(username)){
				$("#usernameError").html("&nbsp;&nbsp;&nbsp;&nbsp;用户名不能包含中文!"); 
				return;
			}
			 $.post("getUser.do",{username:username},function(data){
				 if(data){
					 $("#usernameError").html("&nbsp;&nbsp;&nbsp;&nbsp;该用户名已存在!");
				 }else{
					 $("#usernameError").html("");
				 }
			 },'json')
		});
		
		$("#email").blur(function(){
			var email = $("#email").val();
			if(email && email!=''){
				$.post("getEmail.do",{email:email},function(data){
					if(!data && data!='error'){
						$("#emailError").html("&nbsp;&nbsp;&nbsp;&nbsp;邮箱已被注册!");
					}else{
						$("#emailError").html("");
					}
				},'json')
			}
		})
		
	}
});
function login(){
	window.location.href="login.html";
}
function userRg(){
	$("#user").click();
	$("#qiye").hide();
	$("#email").val("");
	$("#password1").val("");
	$("#password").val("");
	$("#username").val("");
	$("#mailName").val("-1");
	$("#idCode").val("");
	$("#emailError").html("");
	$("#usernameError").html("");
	$("#mailName").next().remove();
	$("#username").next().remove();
	$("#password").next().remove();
	$("#password1").next().remove();
	$("#email").next().remove();
	$("#validcode").val("");
	
}
function companyRg(){
	$("#qiye").show();
	$("#email").val("");
	$("#password1").val("");
	$("#password").val("");
	$("#username").val("");
	$("#mailName").val("");
	$("#idCode").val("");
	$("#emailError").html("");
	$("#usernameError").html("");
	$("#mailName").next().remove();
	$("#username").next().remove();
	$("#password").next().remove();
	$("#password1").next().remove();
	$("#email").next().remove();
	$("#validcode").val("");
}