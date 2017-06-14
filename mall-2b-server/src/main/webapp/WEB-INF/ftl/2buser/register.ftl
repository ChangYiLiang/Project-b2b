<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>${SeoInfo.title}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
		<meta content="${SeoInfo.description}" name="description"/>
		<meta content="${SeoInfo.keyword}" name="keyword"/>
		<#include '../_inc_head.ftl'>
		<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
   		<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
    	<link rel="stylesheet" type="text/css" href="${BasePath}/css/reg.css"/>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
		<script type="text/javascript" src="${BasePath}/scripts/custom/reg.js"></script>
	</head>
<body>

	  <div class="rg-white reghead" >
		  <div class="container">
			  <div class="row">
				  <div class="col-md-9 title">
				  		<a href="${BasePath}"><img src="${BasePath}/images/2buser/u4.png" style="vertical-align:middle;"></a>&nbsp;&nbsp;&nbsp;欢迎注册九河网
				  </div>
			  </div>
		  </div>
	  </div>
	  
	  <div class="rg-white content" style="margin:auto" >
	  <div class="rg-content">
		  <div class="row" style="margin-top:20px;">
			  <div class="col-md-6" style="margin-top:40px;margin-left:283px;">
					  <ul class="nav nav-tabs">
				   		<li  id="company"  class="active"><a href="#identifier" onclick="companyRg()"   data-toggle="tab" style="margin-left:188px;">企业注册</a></li>
				   		<li  id="user" ><a href="#identifier"  onclick="userRg()" data-toggle="tab">用户注册</a></li>
				      </ul>
			  </div>
		  </div>
	  <div class="row" style="margin-left:80px;">
	  
	  <form id="addForm" class="form-horizontal" method="post"  role="form" style="margin-top:30px;">
		  <div class="form-group" id="qiye">
		    <label for="mailName" class="col-sm-2 col-md-offset-2 control-label">企业名</label>
		    <div class="col-sm-3">
		      <input type="text" data-minlength="2" data-minlength-message="请确认企业名称是否正确"  class="form-control" name="mailName" id="mailName" placeholder="输入企业名" data-error-container="#errUname">
		    </div>
		    <div class="col-sm-4" id="errUname"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="username" class="col-sm-2 col-md-offset-2 control-label">用户名</label>
		    <div class="col-sm-3">
		      <input type="text" name="username" class="form-control" id="username" placeholder="输入用户名"  data-minlength="6" data-maxlength="15" data-error-container="#nameError"/>
		    </div>
		     <div class="col-sm-4" id="nameError">
		     	<div class="error" style="margin-top:5px;" id="usernameError"></div>
		     </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-2 col-md-offset-2 control-label">密码</label>
		    <div class="col-sm-3">
		      <input type="password" name="password" class="form-control" id="password" placeholder="设置登录密码" data-minlength="6" data-maxlength="15" data-error-container="#errpw">
		    </div>
		    <div class="col-sm-4" id="errpw"></div>
		  </div>
		  <div class="form-group">
		    <label for="password1" class="col-sm-2 col-md-offset-2 control-label">确认密码</label>
		    <div class="col-sm-3">
		      <input type="password" name="password1" class="form-control" id="password1" placeholder="重新输入登录密码" data-equal-to="#password" data-error-container="#errTo">
		    </div>
		    <div class="col-sm-4" id="errTo"></div>
		  </div>
		  <div class="form-group">
		    <label for="email" class="col-sm-2 col-md-offset-2 control-label">邮箱</label>
		    <div class="col-sm-3">
		      <input type="text" name="email" class="form-control" id="email" placeholder="输入邮箱" data-email="true" data-error-container="#errE">
		    </div>
		    <div class="col-sm-4" id="errE">
		    <div class="error" style="margin-top:5px;" id="emailError"></div>
		    </div>
		    </div>
		  
		  <div class="form-group">
		    <label for="idCode" class="col-sm-2 col-md-offset-2 control-label"></label>
		    <div class="col-sm-2">
				<i class="fa fa-life-saver fa-lg"></i>
				<input class="form-control" type="text" placeholder="输入验证码" name="validcode" id="validcode" />
				<span class="error" id="errorCode"></span>
				</div>
				<div class="col-sm-1">
					<img src="validcode.do" alt="" id="mCode"  onclick="this.src='validcode.do?_t=' + Math.random()" style="width:80px;height:33px;margin-left:-15px;"/>
				</div>
		  </div>
		  
		  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-8">
				           <div class="checkbox">
							    <label>
							      <input  id="mcheck" type="checkbox"> 我同意注册协议
							    </label>
							    <span id="zcxy"></span>
							  </div>
							   
					      </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-8">
		      <button type="submit" class="btn btn-primary" style="width:261.25px;">注册</button>
		    </div>
		  </div>
		</form>
			<div class="row">
					
					<div class="col-md-6 col-sm-offset-5">
					已有九河账号，<a href="${BasePath}/login.html">立刻登录</a>
					</div>
			</div>
	<#-- <div class="col-md-6">
	  </div>-->
	  </div>
	  </div>	  	  
	  </div>	
		<div id="footer" class="text-center">
			<#include "userfooter.ftl">
		</div>
		<script>requirejs(['reg','core'], function(){ MyApp.Register.init(); })</script>
	</body>
</html>
