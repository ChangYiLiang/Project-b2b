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
<script type="text/javascript" src="${BasePath}/scripts/custom/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jqslide.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop2.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop3.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop4.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop5.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop6.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop7.js"></script>
</head>
<!--[if IE 7]><body class="ie7 page-header-fixed"><![endif]-->
<!--[if IE 8]><body class="ie8 page-header-fixed"><![endif]-->
<!--[if IE 9]><body class="ie9 page-header-fixed"><![endif]-->
<!--[if !IE]>-->
<body class="page-header-fixed">
<!--<![endif]-->

<#include "../2bmain/header2b.ftl" >

<div class="sc_banner">
	<div class="sc_w">
		<div class="sc_js">
			<div class="banner_nr">
				<div class="sc_tit">什么是“蔬菜团”？</div>
				<div class="sc_con2">“蔬菜团”是由九河网推出的，针对数据中心行业定期打造精品团购的平台。产品主要由IDC基础服务器类和硬件类两大类组成，在确保产品原厂原件的前提下尽可能的降低客户的采购成本。我们的目标是将“蔬菜团”打造成为中国最为专业最值得信赖的数据中心团购平台。</div>
			</div>
		</div>
	</div>
</div>
<div class="sc_w">
	<div class="sc_kz">
		<div class="sc_kztit">
			本期开团：
		</div>
		<div><a class="bibobi" href="#" onclick="ysf.open();return false;"><img src="${BasePath}/images/2babout/benqi1.png" alt=""></a></div>
	</div>
	<div class="sc_kz">
		<div class="sc_kztit">
			下期开团：
		</div>
		<div><img src="${BasePath}/images/2babout/benqi2.png" alt=""></div>
	</div>

</div>
<div class="geduan"></div>

<script>
	$(function(){
		$(".bibobi").click(function(){
			$("#globalService").click();
		})
	})
</script>

<#include "../2bmain/footer2b.ftl" >

</body>
</html>