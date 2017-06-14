
$(function(){
	
	$("#submit").click(function(){
		$("#userform").submit();
	});
	
	$("#userform").i9heValidate({submitHandler: function(){

		var data = $("#userform").serialize();
		$.ajax({  
		       url : "saveUser.do",  
		       data: data,
		       type:'post',  
		       success : function(data) {
		       	if(data=="success"){
		       		alert("保存成功")
		       		window.location.href="toMyData.do";
		       	}else{
		       		alert("系统异常")
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
	
})
	
	
	 
