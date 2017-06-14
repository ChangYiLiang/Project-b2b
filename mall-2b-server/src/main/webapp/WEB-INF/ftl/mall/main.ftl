<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
		<title>九河互联电商</title>
		<!--用百度的静态资源库的cdn安装bootstrap环境-->
		<!-- Bootstrap 核心 CSS 文件 -->
		<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome 核心我CSS 文件-->
		<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- 在bootstrap.min.js 之前引入 -->
		<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
		<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<!--jquery.validate-->
		<!--<script type="text/javascript" src="js/jquery.validate.min.js" ></script>
		<script type="text/javascript" src="js/check.js" ></script>-->

<style type="text/css">
.navbar-fixed-top{height:65px}
.header-jiuhe{width:1170px;margin:0px auto;height:65px;}
.nav-pills li a{width:170px;height:65px;text-align:center;fold-weight:bold;line-height:45px}

.container{height:550px;border:0px solid red;width:1170px}
.form{background: rgba(255,255,255,0.2);width:398px;margin:100px auto;border:1px solid #ccc;border-top:0px;}
#login_form{display: block;}
#register_form{display: block;}
.fa{display: inline-block;top: 27px;left: -48px;position: relative;color: #ccc;}
.form-group{height:50px}
.other-tab{width:398px;height:400px;position:relative;top:-100px;}
.other-nav{background:rgba(255,255,255,0.2);width:400px;border-bottom:1px solid rgba(255,255,255,0.2)}
.form-group{position:relative;left:-40px;}
.other-nav li{width:200px;text-align:center;font-weight:bold;font-size:15px}
/*
.tab-pane{position:relative;top:-99px}
*/
.form-left{position:relative;top:28px;left:-50px;font-size:15px;color:#555}
.form-control{width:295px}
.pull-right,.pull-left{font-weight:bold;width:130px}
.pull-left{position:relative;top:-30px;}
.pull-right{position:relative;top:4px;left:70px;background-color:#428bca}
#user_tip,#password_tip,#confirm_tip,#email_tip,#code_tip{font-size:12px;color:#428bca;}
.getcode{background:#428bca;color:white;font-weight:bold;position:relative;left:163px;top:-34px;height:34px;width:130px}
input[type="text"],input[type="password"]{padding-left:26px;}
.checkbox{padding-left:21px;}
.other-btn{background-color:#428bca;width:300px}
.res-btn{background-color:#428bca;width:300px}


.right-div{float:left;width:650px;height:110px;margin-left:50px;border-bottom:1px solid #ccc}
.radio-inline{background-image: url('${IncPath}/images/zhifubao.jpg')}
.inline-div{width:150px;height:70px;float:left;margin-left:50px}
.radio-diy{position:relative;top:27px;left:80px}

.right-check{float:left;width:650px;height:300px;margin-top:20px;border:0px solid #ccc;margin-left:50px}
.check-btn{margin-left:500px;background-color:#428bca;width:120px;font-weight:bold;height:50px}




.footer_box{ background-color:#fff;  padding-top:30px; border-top:1px solid #ccc; }
.footer{ width:1200px; margin:auto;}
.footer_box .list_ft_1{ text-align:left;}
.footer_box .list_ft_1 a:hover{ color:#df0531;}
.footer_box .list_ft_2{ margin-top:20px; text-align:left; overflow:hidden; padding-bottom:40px; }
.list_ft_2 .ft_fir{ float:left; padding-right:30px; margin-top:6px;}
.list_ft_2 .ft_fir img{ width:84px;}
.list_ft_2 .ft_sec{ float:left; line-height:24px; }
.list_ft_2 .ft_thd{ float:right; margin-top:44px; line-height:16px; background:url(${IncPath}/images/ico_13.png) no-repeat 0 0;padding-left:50px;  }
.ft_thd .lianxi{ font-size:18px; color:#666;}
.ft_thd .ph{ font-size:36px; color:#ff456a;}
</style>
<!-- END HEAD -->
<!-- BEGIN BODY -->

<!--[if lt IE 9]>
  <link rel="stylesheet" href="${BasePath}/css/bsie.css" />
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="${BasePath}/css/IE8.js"></script>
<![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!--[if IE 7]><body class="ie7"><![endif]-->
<!--[if IE 8]><body class="ie8"><![endif]-->
<!--[if IE 9]><body class="ie9"><![endif]-->
<!--[if !IE]>-->
<body>
<!--<![endif]-->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	    <div class="header-jiuhe">
			<ul class="nav nav-pills">
				<li role="presentation"><a style="width:300px;text-align:left" href="#"><img src="${IncPath}/images/logo_11.png"></a></li>
				<li role="presentation"><a href="#">产品中心</a></li>
				<li role="presentation"><a href="#">解决方案</a></li>
				<li role="presentation"><a href="#">服务支持</a></li>
				<li role="presentation"><a href="#">合作共赢</a></li>
				<li role="presentation"><a href="#">企业文化</a></li>
			</ul>
		</div>
    </nav>
	<br/>
	<br/>
	<br/>
	<br/>
	<div class="container">
		<div style="float:left">
			<ul class='nav nav-tabs other-nav'>
			  <li class='active'><a href='#tab1' data-toggle='tab'>用户注册</a></li>
			  <li><a href='#tab2' data-toggle='tab'>用户登录</a></li>
			</ul>
		
			<div class='tab-content other-tab'>
				<div class="form row tab-pane active" id="tab1">
					<form action="#" class="form-horizontal col-sm-offset-3 col-md-offset-3" id="form_cl" name="form_cl">
						<div class="col-sm-9 col-md-9">
							<div class="form-group">
								<span class="form-left label">账号</span>
								<i class="fa fa-user fa-lg"></i>
								<input class="form-control required" type="text" placeholder="Username" name="username" id="username" autofocus="autofocus" onblur="CheckUsername()"/>
								<span id="user_tip"></span>
							</div>
							<div class="form-group">
									<span class="form-left label">密码</span>
									<i class="fa fa-lock fa-lg"></i>
									<input class="form-control required" type="password" placeholder="Password" id="password" name="password" onblur="CheckPassword()" />
									<span id="password_tip"></span>
							</div>
							<div class="form-group">
									<span class="form-left label">确认</span>
									<i class="fa fa-check fa-lg"></i>
									<input class="form-control required" type="password" placeholder="Re-type Your Password" name="rpassword" id="rpassword" onblur="CheckConfirm()" />
									<span id="confirm_tip"></span>
							</div>
							<div class="form-group">
									<span class="form-left label">邮箱</span>
									<i class="fa fa-envelope fa-lg"></i>
									<input class="form-control eamil" type="text" placeholder="Email" name="email" id="email" />
									<span id="email_tip"></span>
							</div>
							
							<!--<div class="form-group">
									<span class="form-left label">验证</span>
									<input class="form-control eamil" type="text" placeholder="Get code" name="code" id="code" style="padding-left:10px;width:130px"  onblur="Checkcode()"/>
									<button type="button" class="btn getcode" name="getcode" id="getcode" onclick="javascript:User.get_code();" >获取验证码</button>
									<span id="code_tip"></span>
							</div>-->
							
							<div class="form-group" style="position:relative;top:10px">
								<button type="button" class="btn res-btn pull-right" onclick="javascript:$('#form_cl').submit();">注册</button>
								<input id="reset" type="reset" value="重 置" style="display:none"/> 
							</div>
						</div>
					</form>
				</div>
				
				
				<div class="form row tab-pane" id="tab2">
					<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" name="register_form">
						<div class="col-sm-9 col-md-9">
							<div class="form-group">
								<span class="form-left label">账号</span>
								<i class="fa fa-user fa-lg"></i>
								<input class="form-control required" type="text" placeholder="Username" name="username" id="username" autofocus="autofocus" onblur="CheckUsername()"/>
								<span id="user_tip"></span>
							</div>
							<div class="form-group">
									<span class="form-left label">密码</span>
									<i class="fa fa-lock fa-lg"></i>
									<input class="form-control required" type="password" placeholder="Password" id="register_password" name="password" onblur="CheckPassword()"/>
									<span id="password_tip"></span>
							</div>
							
							<!--<div class="form-group">
									<span class="form-left label">验证</span>
									<input class="form-control eamil" type="text" placeholder="Get code" name="code" id="code" style="padding-left:10px;width:130px" disabled onblur="Checkcode()"/>
									<button type="button" class="btn getcode" name="getcode" id="getcode"  >这个是验证码</button>
									<span id="code_tip"></span>
							</div>-->
							
							<div class="form-group" style="position:relative;top:10px">
									<input type="submit" class="btn pull-right other-btn" value="登 录" name="Submit"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<form action="#" class="form-horizontal col-sm-offset-3 col-md-offset-3" id="form_cl1" name="form_cl1">
		<div class="right-div">
			<h4>付款方式</h4>
			<div class="form-group paynow">
				<label class="radio-inline">
				<div class="inline-div">
					<input type="radio" name="paymentmethod" value="alipay" onclick="hideCCForm()" checked="" class="radio-diy">
					<img  src="${IncPath}/images/zhifubao.jpg" style="width:150px;height:70px;">
				</div>
				</label>
			</div>
		</div>
		
		<div class="right-check">
		<ul class="list-group">
		  <li class="list-group-item" style="background-color:#428bca;border:1px solid #428bca">购物车结算</li>
		  <li class="list-group-item">
		  <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            香港服务器托管
          </a>
		  
			<div class="collapse" id="collapseExample">
			  <div class="well">
				<span>  品牌：DELL <span><br/>
				<span>	型号：PowerEdge R430 <span><br/>
				<span>	CPU：E5-2603 v3 1.6GHz*1颗 <span><br/>
				<span>	内存：8GB DDR4*1根 <span><br/>
				<span>	Raid卡：AHCI 嵌入式高级SATA <span><br/>
				<span>	电源：450W有线电源 <span><br/>
				<span>	Raid阵列：无RAID <span><br/>
				<span>	硬盘1：120GB 企业级固态硬盘 <span><br/>
				<span>	硬盘2：120GB 企业级固态硬盘 <span><br/>
				<span>	线路：电信 <span><br/>
			  </div> 
			</div>
		  </li>
		  <li class="list-group-item">购买时长:<p class="navbar-right">1年&nbsp;&nbsp;&nbsp;</p></li>
		  <li class="list-group-item">购买台数:<p class="navbar-right">7台&nbsp;&nbsp;&nbsp;</p></li>
		  <li class="list-group-item">购买总价:<p class="navbar-right">2500.00&nbsp;&nbsp;&nbsp;</p></li>
		  <li class="list-group-item">
			<div class="checkbox" style="font-size: 14px;font-weight: bold;"> 
            <label><input type="checkbox" name="accepttos" id="accepttos"> 我已经阅读并同意该服务条款 <a href="http://www.9he.com.com" target="_blank">服务条款</a></label>
            </div>
		  </li>
		  <li class="list-group-item">
			<button type="button" class="btn check-btn" onclick="javascript:$('#form_cl1').submit();">完成订购</button>
		  </li>
		</ul>
		
		</div>
	</form>
		
	</div>
	
	
	<div class="footer_box">
	  <ul class="footer">
		<li class="list_ft_1">	
			<a href="http://idc.9he.com/about/index.shtml">关于九河互联</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="http://idc.9he.com/about/contact-us.shtml">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="http://idc.9he.com/about/index.shtml">荣誉资质</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="http://idc.9he.com/about/payment.shtml">支付方式</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="">服务体系</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="http://idc.9he.com/about/partners.shtml">合作伙伴</a>
		</li>
		<li class="list_ft_2">
			<dl class="ft_fir"><img src="${IncPath}/images/logo_3.png"></dl>
			<dl  class="ft_sec">
			   公司地址：深圳市龙岗区平湖街道华南城环球物流中心9层 邮编：710075<br>
			   销售热线：400-119-3389    总机：00852-30778831 <br> 
			   ICP备案证书号:Copyright 2015 9he.com All Rights Reserved  备案：粤ICP备16022551号-1<br>
			   版权所有：深圳九河互联信息技术有限公司  百度统计 </dl>
			 <dl class="ft_thd">
			  <span class="lianxi";>联系我们</span><br>
			  24小时服务热线：<span class="ph">400-119-3389</span>
			 </dl>
		</li>
	  </ul>
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
<script src="${BasePath}/scripts/custom/user.js"></script>
<script>
    jQuery(document).ready(function() {       
       FormCl.init();
       FormCl1.init();
    });
</script>

</html>
