<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码找回</title>
		<#include '_inc_head.ftl'>
		<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
   		<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
    	<link rel="stylesheet" type="text/css" href="${BasePath}/css/reg.css"/>
    	<link rel="stylesheet" type="text/css" href="${BasePath}/css/login.css"/>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
		<script type="text/javascript" src="${BasePath}/scripts/custom/reg.js"></script>
		<link rel="stylesheet" type="text/css" href="${BasePath}/css/about.css" />
		<link rel="shortcut icon" href="favicon.ico"/>
		<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jqslide.js"></script>
		<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoopAll.js"></script>
	</head>
<body>
<!--登录部分-->
    <div class="nav_ti">
        <div class="nav_center nav_center3">
            <div class="nav_left">
            	<#if user ??>
					<span><a style="text-decoration:none" href="${BasePath}/controller/toUserCenter.do" target="_self">${user.username?default("")}，欢迎来到九河网&nbsp;&nbsp; </a></span>
					<span><a style="text-decoration:none" href="${BasePath}/controller/logout.do" target="_self">退出</a></span>	
				<#else>
	  				<span class="current_r">欢迎访问九河网！请&nbsp;<a style="text-decoration:none" href="${BasePath}/i9he/login.do" target="_self" id="toLogin">登录</a></span>
                	<span><a style="text-decoration:none" href="${BasePath}/i9he/register.do" target="_self">注册</a></span>
				</#if>
            </div>
            <div class="nav_right">
                <ul class="clearfix">

                    <li class="xiugai1"><a href="${BasePath}">九河网首页</a></li>
                    <li class="xiugai1"><a href="${BasePath}/controller/toUserCenter.do">我的九河网</a><em class="you1"></em>
                        <ul class="liebiao1">
                            <li><a href="#" class="xiugai3">我的订单</a></li>
                            <li>   <a href="#" class="xiugai3">我的积分</a></li>

                        </ul>
                    </li>
                    <li class="nav_xiaoxi">消息中心 
                        <ul class="liebiao1 liebiao2">
                            <li class="xiugai1"><a href="#" class="xiugai2">活动消息</a></li>
                            <li class="xiugai1">   <a href="#" class="xiugai2">与我相关</a>
                            	<!--
                                <span class="my_xiaoxi"></span>
                                -->
                            </li>

                        </ul>
                    </li>
                    <li >会员俱乐部 <em class="you3"></em>
                        <ul class="liebiao1 liebiao2">
                            <li><a href="#" class="xiugai2">九河社区</a></li>
                            <li><a href="#" class="xiugai2">积分商城</a></li>
                        </ul>
                    </li>
                    <li >9he - Family <em class="you3"></em>
                        <ul class="liebiao1 liebiao2">
                            <li><a href="#" class="xiugai2">九河集团</a></li>
                            <li><a href="#" class="xiugai2">九河互联</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
	<div class="rg-white reghead" >
		<div class="container">
			<div class="row">
				<div class="col-md-9 title">
					<a href="${BasePath}"><img src="${BasePath}/images/2buser/u4.png" style="vertical-align:middle;" /></a>
	  			</div>
	  		</div>
		</div>
	</div>	     
			 <div>
				<div class="loginimage" >
					<br/><br/>
					<div class="row" id="tologin">
						<div class="col-md-offset-1 col-md-4">
						</div>
						<div class="col-md-offset-2 col-md-5">
							
							<div class="rg-white loginInfo" style="height:370px;" >
							
								 <#if state == 1>
								  <br/>
									<div class="text-center" style="margin-top: 40%">
										<span class="glyphicon glyphicon-share-alt fa-lg"></span>
										<span>当前链接已失效</span>
									</div>
								</#if>
								<#if state == 0>
								<br/>
								<div class="col-md-offset-1" role="tablist">
									<span role="presentation"></span><a href="#myFm" role="tab" data-toggle="tab" class="logintitle">密码找回</a>&nbsp;
									&nbsp;<span id="errorInfo">${error!""}</span>
								</div>
								<div class="col-md-offset-1">
								</div>
								<hr>
								<div class="tab-content">
									<form  method="post" action="#" id="myFm" class="tab-pane active" role="tabpanel">
										<input type="hidden" id="token" name="token" value="${token!""}" >
										<div class="row">
										  	<div class="col-sm-offset-1 col-sm-1">
										  		<img src="${BasePath}/images/2buser/u17.png" style="width:40px;"/>
										  	</div> 
										  	<div class="col-sm-7">
										  		<input type="text" id="username" name="username" placeholder="用户名" value="${username!""}" required/>
										  	</div>
										</div>
										<br>
										<div class="row">
											<div class="col-sm-offset-1 col-sm-1">
										  		<img src="${BasePath}/images/2buser/u20.png" style="width:40px;"/>
										  	</div> 
										  	<div class="col-sm-7">
										  		<input type="password" id="password" name="password" placeholder="密码" value="${password!""}" required/>
										  	</div>
										</div>
										<br/>
										<div class="row">
											<div class="col-sm-offset-1 col-sm-1">
										  		<img src="${BasePath}/images/2buser/u20.png" style="width:40px;"/>
										  	</div> 
										  	<div class="col-sm-7">
										  		<input type="password" id="rePassword" name="rePassword" placeholder="密码" value="${password!""}"  required/>
										  	</div>
										</div>
										<br>
							  			<div class="row">
							  				<div class="col-sm-offset-1 col-sm-8">
							  				<button type="button" id="modify" class="btn btn-success" style="background:#1b9d97;">立刻更改</button>
							  				</div> 
							  			</div>
							  			
							  			<div class="row regw">
							  				<div class="col-sm-offset-3 col-sm-8 text-center">
								  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已有有九河账号，<a href="${BasePath}/i9he/login.do">立即登录</a>
							  				</div>
					  					</div>
						  			</form>
						  		</div>
						  		</#if>
					  		</div>
		  				</div>
		   			</div>
				</div>
	      </div>
	<div id="footer" class="text-center">
			<#include "2buser/userfooter.ftl">
	</div>
	<script>requirejs(['core','login'],function(){
	
	$("#modify").click(function(){
			var username = $("#username").val();
			var password = $("#password").val();
		    var rePassword = $("#rePassword").val();
		    if(!username || username==null){
		    	$("#errorInfo").html("用户名不能为空");
		    	return;
		    }
		    if(password.length<6){
		    	$("#errorInfo").html("密码长度至少6位");
		    	return;
		    }
		    if(password!=rePassword){
		    	$("#errorInfo").html("两次密码输入必须一致");
		    	return;
		    }
		    var token = $("#token").val();
		    $.post('resetpassword.do',{token:token,password:password,username:username},function(data){
		    		if(data==2){
		    		    $("#errorInfo").html("用户名不匹配");
		    		}else if(data==1){
		    			$("#errorInfo").html("链接超时");
		    		}else if(data==0){
		    			$("#errorInfo").html("");
		    			alert("密码修改成功")
		    			window.location.href='${BasePath}/i9he/login.do';
		    		}else{
		    			$("#errorInfo").html("发生异常,请联系管理员")
		    		}
		    	
		    },'json')
		}) 
	})
		
	</script>
	</body>
</html>
