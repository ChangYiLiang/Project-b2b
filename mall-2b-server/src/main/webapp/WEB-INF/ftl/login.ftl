<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>${SeoInfo.title}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
		<meta content="${SeoInfo.description}" name="description"/>
		<meta content="${SeoInfo.keyword}" name="keyword"/>
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
	  				<span class="current_r">欢迎访问九河网！请&nbsp;<a style="text-decoration:none" href="${BasePath}/login.html" target="_self" id="toLogin">登录</a></span>
                	<span><a style="text-decoration:none" href="${BasePath}/register.html" target="_self">注册</a></span>
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
					<a href="${BasePath}"><img src="${BasePath}/images/2buser/u4.png" style="vertical-align:middle;" /></a>&nbsp;&nbsp;&nbsp;欢迎登陆
	  			</div>
	  		</div>
		</div>
	</div>
	<div>
		<div class="loginimage" >
			<br/><br/>
			<div id="tologin">
				<div class="col-md-offset-7 col-md-5">
					<div class="rg-white loginInfo" >
						<br/>
						<div class="col-md-offset-1" role="tablist">
							<span role="presentation"></span><a href="#myFm" role="tab" data-toggle="tab" class="logintitle">用户名登陆</a>&nbsp;
							<span role="presentation"><a href="#mobileLogin" role="tab" data-toggle="tab" class="logintitle">手机登录</a></span>
							&nbsp;<span id="errorInfo">${error!""}</span>
						</div>
						<div class="col-md-offset-1">
						</div>
						<hr>
						<div class="tab-content">
							<form  method="post" action="login.do" id="myFm" class="tab-pane active" role="tabpanel">
								<input type="hidden" name="service" value="${service!""}">
								<div class="row">
								  	<div class="col-sm-offset-1 col-sm-1">
								  		<img src="${BasePath}/images/2buser/u17.png" style="width:40px;"/>
								  	</div> 
								  	<div class="col-sm-7">
								  		<input type="text" id="username" name="username" placeholder="用户名" value="${username!""}"/>
								  	</div>
								</div>
								<br>
								<div class="row">
									<div class="col-sm-offset-1 col-sm-1">
								  		<img src="${BasePath}/images/2buser/u20.png" style="width:40px;"/>
								  	</div> 
								  	<div class="col-sm-7">
								  		<input type="password" id="password" name="password" placeholder="密码" value="${password!""}"/>
								  	</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-sm-offset-1 col-sm-5">
								  		<input type="text" id="code" onkeydown="if(event.keyCode==13) doLogin()" name="code" placeholder="验证码"/>
								  	</div> 
								  	<div class="col-sm-5 text-right">
								  		<img src="validcodeLogin.do" alt="" id="mCode"  onclick="this.src='validcodeLogin.do?_t=' + Math.random()" />
								  	</div>
								</div>
								<div class="row" style="margin-top:8px;">
									<div class="col-sm-offset-1 col-sm-7">
										<div class="checkbox">
										    <label>
										      <input  type="checkbox" id="rememberMe"> 记住密码
										      <input type="hidden" name="rememberpw" id="rememberpw" value=""/>
										    </label>
										  </div>
								  	</div> 
					  			</div>
					  			<div class="row">
					  				<div class="col-sm-offset-1 col-sm-8">
					  				<button type="button" onClick="doLogin()" class="btn btn-success" style="background:#1b9d97;">登录</button>
					  				</div> 
					  			</div>
				  			</form>
				  			
				  			<form  method="post" action="mobilelogin.do" id="mobileLogin" class="tab-pane" role="tabpanel">
				  				<input type="hidden" name="service" value="${service!""}">
								<div class="row">
								  	<div class="col-sm-offset-1 col-sm-1">
								  		<img src="${BasePath}/images/2buser/u17.png" style="width:40px;"/>
								  	</div> 
								  	<div class="col-sm-7">
								  		<input type="text" id="mobile" name="mobile" placeholder="手机号码" />
								  	</div>
								</div>
								<br>
								<div class="row">
									<div class="col-sm-offset-1 col-sm-4">
								  		<input type="text" class="form-control" id="mobileCode" name="code" placeholder="短信验证码" />
								  	</div> 
								  	<div class="col-sm-5 text-right">
								  		<input class="btn btn-primary" id="btnSendMobileCode" onclick="MyApp.Login.sendMobileCode()" type="button" value="发送验证码" style="width: 150px"/>
								  	</div>
								</div>
								<br/>
					  			<div class="row">
					  				<div class="col-sm-offset-1 col-sm-8">
					  				<button type="button" onClick="MyApp.Login.mobileLogin()"  id="btnMobileLogin" class="btn btn-success" style="background:#1b9d97;">登录</button>
					  				</div>
					  			</div>
				  			</form>
				  		</div>
			  			<div class="row regw">
			  				<div class="col-sm-offset-2 col-sm-8 text-center">
				  				还没有九河账号，<a href="${BasePath}/register.html">立即注册</a>&nbsp;&nbsp;&nbsp;
				  				<a href="javascript:;" id="forgetpw" >忘记密码</a>
			  				</div>
			  			</div>
			  			<hr>
			  			
			  			<div class="text-center">
			  				<ul class="list-inline jh-oauth-logos">
			  					<li>
			  						<a href="${casUrl}/login?service=${BasePath}/index.do&type=qqauth20"><img src="${BasePath}/images/2buser/u148.png" class="qqlogin"/><br />QQ登录</a>
			  					</li>
			  					<li>
			  						<a href="${casUrl}/login?service=${BasePath}/index.do&type=weiboauth20"><img src="${BasePath}/images/user/oauth_weibo.png" class="qqlogin"/><br />新浪微博登录</a>
			  					</li>
			  					<li>
			  						<a href="${casUrl}/login?service=${BasePath}/index.do&type=weixinauth20"><img src="${BasePath}/images/user/oauth_weixin.png" class="qqlogin"/><br />微信扫码登录</a>
			  					</li>
			  				</ul>
			  				<br />
			  			</div>
			  		</div>
  				</div>
   			</div>
			<br/><br/><br/>
	
			<div class="row" id="getPwd" style="display:none">
				<div class="col-md-offset-7 col-md-5"  >
					<div class="rg-white getPwd">
						<br/>
						<div class="col-md-offset-1" role="tablist">
							<span role="presentation"></span><a href="#myFm" role="tab" data-toggle="tab" class="logintitle">找回密码</a>&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;<span id="errorInfo1">${error!""}</span>
						</div>
						<div class="col-md-offset-1">
							
						</div>
						<hr>
						<div class="tab-content">
						<#--
						</form>
							<form  method="post" action="getPwd.do" id="myFm" class="tab-pane active" role="tabpanel">
							-->
								<div class="row">
								  	<div class="col-sm-offset-1 col-sm-1">
								  		<img src="${BasePath}/images/2buser/u17.png" style="width:40px;"/>
								  	</div> 
								  	<div class="col-sm-7">
								  		<input type="text" id="username1" name="username1" placeholder="输入用户名" value="${username1!""}"/>
								  	</div>
								</div>
								<br>
								<div class="row">
									<div class="col-sm-offset-1 col-sm-1">
								  		<img src="${BasePath}/images/2bmain/u20.png" style="width:40px;"/>
								  	</div> 
								  	<div class="col-sm-7">
								  		<input type="email" id="email" name="email" placeholder="输入注册邮箱" value="${email!""}"/>
								  	</div>
								</div>
								<br/>
								<div class="row">
					  				<div class="col-sm-offset-1 col-sm-8">
					  				<button type="button" onClick="getPwd()"  id="toGetPwd" class="btn btn-success" style="background:#1b9d97;">立即找回</button>
					  				</div>
					  			</div>
				  			
				  		</div>
			  			<div class="row regw">
			  				<div class="col-sm-offset-3 col-sm-8 text-center">
				  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已有有九河账号，<a href="${BasePath}/login.html">立即登录</a>
			  				</div>
			  			</div>
			  		</div>
  				</div>
   			</div>
		</div>
	</div>
	<div id="footer" class="text-center">
			<#include "2buser/userfooter.ftl">
	</div>
	<script>requirejs(['core','login'],function(){
		$("input").focus(function () {  
                $(this).addClass("focus");  
            }).blur(function () {  
                $(this).removeClass("focus");  
            });
        $("#forgetpw").click(function(){
        	$("#tologin").hide();
        	$("#getPwd").show();
        })
        
        try {
		  	var arrays = JSON.parse(localStorage.getItem("cas.auto.login") || "[]");
			for(var i=0;i<arrays.length;i++) {
			  	$("#"+arrays[i].name).val(arrays[i].value)
			}
			if ($("#username").val()) {
				$("#rememberMe").click();
			}
		  } catch (e) {
		  	console.info(e);
		  	localStorage.removeItem("cas.auto.login")
		  }
	})
	
	$("#myFm").submit(function(){
			if($("#rememberMe").prop("checked")){
				var arrays = $("#username, #password").serializeArray();
				var data = JSON.stringify(arrays);
				localStorage.setItem("cas.auto.login", data);
			} else {
				localStorage.removeItem("cas.auto.login");
			}
		})
	</script>
	</body>
</html>
