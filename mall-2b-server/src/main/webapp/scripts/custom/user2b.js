define( function(){
	
	requirejs(['jquery', 'core','common'],function() {
	
	var user = MyApp.namespace("user");
	
	$("#myDataModify_from").i9heValidate({submitHandler:function(){
		var url = "../user/saveuser.do";
		var data = $("#myDataModify_from").serializeObject();
		
		console.log(data);
		$.ajax({
			url: url,
			type: "POST",
			dataType: "JSON",
			data: data,
			success: function(data){
				if(data == "success"){
					layer.alertEx({content: "修改成功", end: function () {
						//window.location.href="tomydata.do";
						window.location.reload();
					}});
				}else{
					layer.alertEx({content: "修改失败！", end: function () {
					//	window.location.href="tomydata.do";
						window.location.reload();
					}});
				}
			}
		});
	 }});
	
	jQuery.validator.addMethod("mobile", function(value, element) {
		  var length = value.length;
		  var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
		  return this.optional(element) || (length == 11 && mobile.test(value));
		}, "请正确填写您的手机号码"); 
		
	jQuery.validator.addMethod("qq", function(value, element) {  
	    var tel = /^[1-9]\d{4,9}$/;  
	    return this.optional(element) || (tel.test(value));  
	}, "qq号码格式错误");
	
	jQuery.validator.addMethod("wechat", function(value, element) {  
		var tel = /^([0-9a-zA-Z]+)$/;  
		return this.optional(element) || (tel.test(value));  
	}, "微信号输入错误");
		
		
	user.sendMessage = function(){
		var InterValObj; //timer变量，控制时间
		var count = 60; //间隔函数，1秒执行
		var curCount;//当前剩余秒数
		curCount = count;
		　　//设置button效果，开始计时
		     $("#btnSendCode").attr("disabled", "true");
		     $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
		     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		　　  //向后台发送处理数据
		     var url="sendCode.do";
			 var data={
					"email":$("#email").val(),
			};
			$.ajax({
				url:url,data:data,type:"POST",dataType:"JSON",
				success: function(result){
					if(result == "success"){
						alert("success")
					}
				}
			});
			function SetRemainTime() {
	            if (curCount == 0) {                
	                window.clearInterval(InterValObj);//停止计时器
	                $("#btnSendCode").removeAttr("disabled");//启用按钮
	                $("#btnSendCode").val("重新发送验证码");
	            }
	            else {
	                curCount--;
	                $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
	            }
	        }
		}
	
	$("#validateEmail_from").i9heValidate({submitHandler:function(){
		var data = {email:$("#email").val(),validcode:$("#validcode").val()};
		$.ajax({url:"verificationCode.do",data:data,type:"POST",
			success:function(result){
				if(result){
					layer.alertEx({content: "邮箱验证成功！"});
				}else{
					layer.alertEx({content: "邮箱验证失败！"});
				}
			}
			
		});
	}});
	
	user.sendMobileMessage = function(){
		var InterValObj; 
		var count = 60; 
		var curCount;
		curCount = count;
		$("#btnSendCode").prop("disabled", true);
		$("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
		InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		var url="sendsmsvalidcode.do";
		var data={
				"mobile":$("#mobile").val(),
		};
		$.ajax({
			url:url,data:data,type:"POST",dataType:"JSON",
			success: function(result){
				if (result.res==0) {
					layer.alertEx({content: "验证码已发送到您的手机"});
				} else {
					layer.alertEx({content: result.message});
				}
			}
		});
		function SetRemainTime() {
			if (curCount == 0) {                
				window.clearInterval(InterValObj);
				$("#btnSendCode").prop("disabled", false);
				$("#btnSendCode").val("重新发送验证码");
			}
			else {
				curCount--;
				$("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
			}
		}
	 }

	});
	
	var modifyPassword = function(){
		requirejs(['core'],function(){
			var url="modifypassword.do";
			var data={
				"oldpassword":$("#oldpassword").val(),
				"password": $("#password").val()
			};
			$.ajax({
				url: url,
				data: data,
				type: "POST",
				dataType: "JSON",
				success: function(data){
					if(data){
						layer.alertEx({content: "修改密码成功"});
						$("#resetPassword").click();
					}else{
						layer.alertEx({content: "修改密码失败！"});
						$("#resetPassword").click();
					}
				}
			});
		});
	}
	
	var initValidatePassword = function() {
		requirejs(['core','common'], function(){
			
			$("#modifyPassword_from").i9heValidate({submitHandler:modifyPassword});
		});
	}
	
	var initValidateInvoice = function(){
		requirejs(['core'], function(){
			$("#invoice_from").i9heValidate({submitHandler:submitInvoice});
		});
	}
	var submitInvoice = function(){
		var url = "../user/invoicequalifed.do";
		var data = $("#invoice_from").serializeObject();
		$.ajax({url: url,type: "POST",dataType: "JSON",data: data,
			  success: function(data){
				if(data){
					layer.alertEx({content: "提交成功，请耐心等待审核结果..", end: function () {
						$("#reset").click();
					}});
				}else{
					layer.alertEx({content: "提交失败,请重新提交！", end: function () {
						$("#reset").click();
					}});
				}
			}
		});
	}
	var initValidatePayPassword = function(){
		requirejs(['core'], function(){
			$("#payPassword_from").i9heValidate({submitHandler:submitPayPassword});
		});
	}
	var submitPayPassword = function(){
		var url = "paypassword.do";
		var data = $("#payPassword_from").serializeObject();
		$.ajax({url: url,type: "POST",dataType: "JSON",data: data,
			success: function(data){
				if(data=="success"){
					layer.alertEx({content: "支付密码设置成功！", end: function () {
						$("#resetPassword").click();
						$("#message").html("");
					}});
				}
				if(data=="editSuccess"){
					layer.alertEx({content: "支付密码修改成功！", end: function () {
						$("#resetPassword").click();
						$("#message").html("");
					}});
				}
				if(data=="fail"){
					layer.alertEx({content: "操作失败！", end: function () {
						$("#resetPassword").click();
						$("#message").html("");
					}});
				}
				if(data=="passwordError"){
					$("#message").html("登陆密码输入错误！");
				}
			}
		});
	}
	
	return {
		initValidatePassword: initValidatePassword,	
		initValidateInvoice: initValidateInvoice,
		initValidatePayPassword: initValidatePayPassword
	};
});
