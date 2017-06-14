
<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
		<title>九河互联电商</title>
		<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome 核心我CSS 文件-->
		<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- 在bootstrap.min.js 之前引入 -->
		<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
		<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<style>
		body{background:#2679b9}
		.div-login{width:350px;height:500px;border:1px solid #2679b9;margin:0px auto;margin-top:80px;background-color:white}
		.login-top{width:348px;float:left;background:linear-gradient(45deg, #10559e 5%, #1e88e5 65%, #40BAF5 98%);height:40px;}
		.login-top span{color:white;font-size:14px;position:relative;top:10px;left:20px}
		.login-foot{width:300px;height:30px;float:left;}
		.login-foot input{margin-left:25px}
		
		.login-foot span{font-size:13px;font-weight:bold;margin-left:-3px;}
		
		.login-foot2 span{position:relative;top:10px;left:25px}
		.foot2-span{position:relative;top:10px}
		.fa{display: inline-block;top: 27px;left: 25px;position: relative;}
		.form-group input{padding-left:24px;width:300px;margin-left:20px}
		.other-group{height:90px}
		.rme-btn{position:relative;left:-140px;border:1px solid red;width:30px;display:inline-block}
		.mabi{position:relative;left:40px}
		.sub-btn{color:white;font-weight:bold;background-color:#2679b9}
		.help-block{padding-left:19px}
		.toMerchantRegist{padding-left:60px}
		</style>
</head>
<body>
	<div class="div-login">
			<div class="login-top">
				<span class="glyphicon glyphicon-fire fa-lg" style="color:black;font-size:18px"></span>
				<span>欢迎注册九河互联商城！</span>	
			</div>
			<form action="#" id="form_cl" name="form_cl">
				<#if (recommanderId??)>
				<div class="form-group other-group" style="height:50px">
					推荐人：
					<input class="form-control" type="text" placeholder="推荐人id" value="${recommanderId}" name="recommender" id="recommender"  readonly />
				</div>
				</#if>
				
				<div class="form-group other-group" style="height:100px">
					<i class="fa fa-user fa-lg"></i>
					<input class="form-control required" type="text" placeholder="输入用户名" name="username" id="username"  />
				</div>
				<div class="form-group other-group" style="height:50px">
					<i class="fa fa-lock fa-lg"></i>
					<input class="form-control required" type="password" placeholder="输入密码" id="password" name="password" />	
				</div>
				<div class="form-group other-group" style="height:50px">
						<i class="fa fa-check fa-lg"></i>
						<input class="form-control required" type="password" placeholder="确认密码" name="rpassword" id="rpassword"  />	
				</div>
				<div class="form-group other-group" style="height:50px">
						<i class="fa fa-envelope fa-lg"></i>
						<input class="form-control eamil" type="text" placeholder="输入邮箱" name="email" id="email" />
				</div>
				<div class="form-group other-group" style="height:50px">
						<i class="fa fa-life-saver fa-lg"></i>
						<input style="width: 150px;" class="form-control" type="text" placeholder="输入验证码" name="validcode" id="validcode" />
				</div>
				<div style="position: relative;top:1px;">
						<img src="validcode.do" alt="" onclick="this.src='validcode.do?_t=' + Math.random()" style="height:34px;position:relative; left: 200px;top:-32px;" />
				</div>
				<div class="login-foot">
					<input type="checkbox" name="accepttos" id="accepttos"></input>
					<span>&nbsp;我同意注册条款</span>	
				</div>
				
				<div class="form-group other-group" style="height:65px">
					<input type="submit" class="btn sub-btn" value="注 册" name="Submit" />
					<input id="reset" type="reset" value="重 置" style="display:none"/> 
				</div>
				<div class="login-foot login-foot2">
					<span class="glyphicon glyphicon-share-alt fa-lg"></span>
					<span class="foot2-span">已有九河账号?</span>
					<span><a id="toLogin" href="${BasePath}/controller/main.do">点击登录</a></span>
					<span class="toMerchantRegist"><a href="${BasePath}/i9he/toMerchantRegist.do">企业用户注册</a></span>
					
				</div>
			</form>
	</div>
</body>
<script src="${IncPath}/assets/plugins/respond.min.js"></script>
<script src="${IncPath}/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${IncPath}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN GENERAL PLUGINS -->
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<!-- END GENERAL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/plugins/select2/select2.min.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/jquery.dataTables.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${IncPath}/assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${IncPath}/assets/scripts/core/app.js"></script>
<script src="${IncPath}/assets/scripts/core/datatable.js"></script>
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/common.js"></script>
<script src="${BasePath}/scripts/custom/user.js"></script>
<script>
    jQuery(document).ready(function() {       
       FormCl.init();
    });
</script>
</html>
