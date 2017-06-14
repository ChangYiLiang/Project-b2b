define(function(){
	var totalTime = 30;
	var sendMobileCodeTimeout = function(time) {
		if (time > 0) {
			$("#btnSendMobileCode").prop("disabled", true);
			$("#btnSendMobileCode").val("请在{time}秒后重试.".format({time: time}));
			setTimeout(function(){ sendMobileCodeTimeout(time - 1) }, 1000);
		} else {
			$("#btnSendMobileCode").prop("disabled", false);
		}
	}
	
	var sendMobileCode = function() {
		var mobile = $("#mobile").val();
		if (!mobile) {
			$("#errorInfo").html("请输入手机号码!");
			return;
		}
		$("#errorInfo").html("");
		
		sendMobileCodeTimeout(totalTime);
		$.post("sendmobilecode.do", {mobile: mobile}, function(ret) {
			if (ret.res) {
				$("#errorInfo").html(ret.message);
			} else {
				$("#errorInfo").html('登录验证码已发送到您的手机!');
				$("#btnMobileLogin").prop("disabled", false);
			}
		});
	};
	
	var mobileLogin = function () {
		var mobile = $("#mobile").val(),
			mobileCode = $("#mobileCode").val();
		if (!mobile) {
			$("#errorInfo").html("请输入手机号码!");
			return;
		}
		if (!mobileCode) {
			$("#errorInfo").html("请输入验证码!");
			return;
		}
		$.post("mobilelogin.do", {mobile: mobile, code: mobileCode}, function(ret) {
			if (ret.res) {
				$("#errorInfo").html(ret.message);
			} else {
				var service = $("[name=service]").val() || "../../";
				window.location = service;
			}
		});
	}
	
	requirejs(['core'], function() {
		var login = MyApp.namespace("Login");
		login.sendMobileCode = sendMobileCode;
		login.mobileLogin = mobileLogin;
	});
	
	return {
		// sendMobileCode: sendMobileCode
	}	
});


function doLogin(){
	var username = $("#username").val();
	var password = $("#password").val();
	var code = $("#code").val();
	if(!username || username==''){
		$("#errorInfo").html("用户名不能为空!");
		return;
	}
	if(!password || password==''){
		$("#errorInfo").html("密码不能为空!");
		return;
	}
	if(!code || code==''){
		$("#errorInfo").html("验证码不能为空!");
		return;
	}
	if($("input[type='checkbox']").is(':checked')){
		$("#rememberpw").val("1");
	}
	$("#myFm").submit();
}
function getPwd(){
	var username = $("#username1").val();
	var email = $("#email").val();
	
	if(!$.trim(username) || username==null){
		$("#errorInfo1").html("请输入用户名!");
		return;
	}
	if(!$.trim(email) || email==null){
		$("#errorInfo1").html("请输入邮箱!");
		return;
	}
	
	$.post("sendforgetemail.do",{username:username,email:email},function(data){
			if(data=='1'){
				$("#errorInfo1").html("用户名不存在!");
			}else if(data=='2'){
				$("#errorInfo1").html("邮箱不匹配!");
			}else if(data=='3'){
				$("#errorInfo1").html("邮箱未验证!");
			}else if(data=='4'){
				$("#errorInfo1").html("邮件发送失败!");
			}else{
				alert("验证通过，相关链接已发送到您的邮箱，请注意查收")
				$("#username1").val("");
				$("#email").val("");
				$("#errorInfo1").html("");
			}
	},'json')
	
}