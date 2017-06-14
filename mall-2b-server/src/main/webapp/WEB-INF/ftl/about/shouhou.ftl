<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<#include "../keyword.ftl" >
<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/about.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/caigou.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
<link rel="shortcut icon" href="favicon.ico"/>
<link rel="stylesheet" href="${BasePath}/css/animate.min.css">
<script type="text/javascript" src="${BasePath}/scripts/custom/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jqslide.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoopALL.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/wow.min.js"></script>
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
    new WOW().init();
};
$(function(){
	$("#weixin").mousemove(function(){
		$("#wechat").show();
	});
	$("#weixin").mouseleave(function(){
		$("#wechat").hide();
	})
})
</script>

</head>
<!--[if IE 7]><body class="ie7 page-header-fixed"><![endif]-->
<!--[if IE 8]><body class="ie8 page-header-fixed"><![endif]-->
<!--[if IE 9]><body class="ie9 page-header-fixed"><![endif]-->
<!--[if !IE]>-->
<body class="page-header-fixed">
<!--<![endif]-->
<#include "../2bmain/header2b.ftl" >
<div class="service_banner">
	  <div class="banner_cen_1">
		  <div class="zhuanjia">专家顾问团队，给您贴心服务</div>
		  <div class="zhuanjia2">Stay hungry, Stay foolish</div>
	  </div>
  </div>
  <div class="service_center clearfix">
	<div class="ser_tese">
		<div class="ser_tit">
			特色服务
		</div>
		<div class="ser_con clearfix">
			<ul class="clearfix">
				<li class="clearfix wow fadeInUp">
					<div class="ser_l"></div>
					<div class="ser_r">
						<div class="ser_r1">生态采购</div>
						<div class="ser_r2">颠覆传统采购模式</div>
					</div>
				</li>
				<li class="clearfix ser_li2 wow fadeInUp" data-wow-delay="0.3s">
					<div class="ser_l ser_l2"></div>
					<div class="ser_r">
						<div class="ser_r1">金融分期</div>
						<div class="ser_r2">低首付，免息，降低资金压力</div>
					</div>
				</li>
				<li class="clearfix  wow fadeInUp" data-wow-delay="0.6s">
					<div class="ser_l ser_l3"></div>
					<div class="ser_r">
						<div class="ser_r1">融资租赁</div>
						<div class="ser_r2">首家按季、年租用服务器服务</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- 2 -->
	<div class="ser_tese">
		<div class="ser_tit">
			自助服务
		</div>
		<div class="ser_con clearfix ser_con2">
			<dl class="ser_dl1 wow fadeInUp">
				<dt class="ser_dt0"></dt>
				<dd onclick="window.open('1.shtml');">预约上门</dd>
			</dl>
			<dl class="ser_dl1 wow fadeInUp" data-wow-delay="0.1s">
				<dt class="ser_dt2"></dt>
				<dd>物流查询</dd>
			</dl>
			<dl class="ser_dl1 wow fadeInUp" data-wow-delay="0.2s">
				<dt class="ser_dt3 ser_dlt1"></dt>
				<dd>退换货保障</dd>
			</dl>
			<dl class="ser_dl1 wow fadeInUp" data-wow-delay="0.3s">
				<dt class="ser_dt4 ser_dlt2"></dt>
				<dd onclick="window.open('2.shtml');">故障维修</dd>
			</dl>
			<dl class="ser_dl1 ser_dl1t wow fadeInUp" data-wow-delay="0.4s">
				<dt class="ser_dt5"></dt>
				<dd onclick="window.open('../caigou/index.shtml');">需求发布</dd>
			</dl>
			<dl class="ser_dl1 ser_dl1t wow fadeInUp" data-wow-delay="0.5s">
				<dt class="ser_dt6"></dt>
				<dd>7天价保</dd>
			</dl>
			<dl class="ser_dl1 ser_dl1t wow fadeInUp" data-wow-delay="0.6s">
				<dt class="ser_dt7"></dt>
				<dd>技术售后</dd>
			</dl>
			<dl class="ser_dl1 ser_dl1t wow fadeInUp" data-wow-delay="0.7s">
				<dt class="ser_dt8"></dt>
				<dd>投诉建议</dd>
			</dl>
		</div>
	</div>
	<!-- 3 -->
	<div class="ser_tese">
		<div class="ser_tit">
			产品售后服务
		</div>
		<div class="ser_con clearfix">
			<div class="xiaotu_1 wow fadeInLeft" data-wow-delay="0.2s" onclick="window.open('${BasePath}/about/jinrong.do');">服务器采购售后服务方案</div>
		</div>
	</div>
	<!-- 4 -->
	<div class="ser_tese" style="margin-bottom:50px;">
		<div class="ser_tit">
			联系我们
		</div>
		<div class="ser_con clearfix">
		<a href="javascript:void(0);" id="globalService">
			<dl class="ser_dl2 wow fadeInUp" >
				<dt class="dt_1_ser"></dt>
				<dd class="dd_1_ser u-buy1">在线咨询</dd>
				<dd class="dd_2_ser">快速响应，即时沟通</dd>
			</dl>
		</a>
		<a href="tel:4000043389">
			<dl class="ser_dl2 wow fadeInUp" data-wow-delay="0.2s">
				<dt class="dt_2_ser"></dt>
				<dd class="dd_1_ser">400-004-3389</dd>
				<dd class="dd_2_ser">全国服务热线</dd>
			</dl>
		</a>
		<a href="javascript:void(0);">
			<dl id="weixin" class="ser_dl2 wow fadeInUp" data-wow-delay="0.4s" style="position:relative">
				<dt class="dt_3_ser"></dt>
				<dd class="dd_1_ser">官方微信</dd>
				<dd class="dd_2_ser">关注微信，直接对话</dd>
				<div id="wechat" style="position:absolute;top:-170px;display:none;"><img src="${BasePath}/images/2babout/wechat.png"</div>
			</dl>
		</a>
		<a href="javascript:void(0);">
			<dl class="ser_dl2 wow fadeInUp" data-wow-delay="0.6s">
				<dt class="dt_4_ser"></dt>
				<dd class="dd_1_ser">面对面洽谈</dd>
				<dd class="dd_2_ser">致电预约，顾问式服务</dd>
			</dl>
		</a>
		<a href="javascript:void(0);">	
			<dl class="ser_dl2 ser_last wow fadeInUp" data-wow-delay="0.8s">
				<dt class="dt_5_ser"></dt>
				<dd class="dd_1_ser">更多</dd>	
			</dl>
		</a>
		</div>
	</div>
  </div>

<#include "../2bmain/footer2b.ftl" >

</body>
</html>