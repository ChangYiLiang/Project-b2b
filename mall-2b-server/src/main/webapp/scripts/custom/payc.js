function yuePay(data){
	    $("#topay").prop("disabled",true);
	    
	    var isp = 0;
	    $.post("ispw.do",{},function(success){
	    	
	    	if(!success){
	    		if(data.type==1){
	    			$("#errorInfo").html("<a href='../../controller/user/security.do'>您未设置账户支付密码，请点击前往设置 。</a>");
	    		}else{
	    			$("#errorInfo").html("<a href='../controller/user/security.do'>您未设置账户支付密码，请点击前往设置 。</a>");
	    		}
	    		return;
	    	}else{
	    		 var url = "";
	    			if(data.type == 1){
	    				url = "../../cart/yuePay.do";
	    			}else{
	    				url = "yuePay.do";
	    			}
	    		    var password = $("#password").val();
	    		    var orderId = $("#orderId").html();
	    		    
	    		    if(!password || password==''){
	    		    	$("#errorInfo").html("支付密码不能为空!");
	    		    	return;
	    		    }
	    			$.post(url,{password:password,orderId:orderId},function(data){
	    				if(data=='success'){
	    					$.post("f5.do",{id:orderId},function(data){
	    						if(data){
	    							window.location.href ="success.do";
	    	    				}
	    					},'json');
	    					
	    				}else if(data =='warning'){
	    					$("#errorInfo").html("余额不足!");
	    				}else if(data =='error'){
	    					$("#errorInfo").html("您今天的输入密码错误次数达到上限，请明天再来吧");
	    				}else if(data =='error1'){
	    					$("#errorInfo").html("支付密码错误，您还有4次输入机会");
	    				}else if(data =='error2'){
	    					$("#errorInfo").html("支付密码错误，您还有3次输入机会");
	    				}else if(data =='error3'){
	    					$("#errorInfo").html("支付密码错误，您还有2次输入机会");
	    				}else if(data =='error4'){
	    					$("#errorInfo").html("支付密码错误，您还有1次输入机会");
	    				}else if(data =='error5'){
	    					$("#errorInfo").html("您今天的输入密码错误次数达到上限，请明天再来吧");
	    				}
	    			},'json');
	    		
	    	}
	    },'json');
	    $("#topay").prop("disabled",false);
}