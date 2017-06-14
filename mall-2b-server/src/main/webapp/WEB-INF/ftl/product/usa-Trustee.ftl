<!DOCTYPE html>
<html>
<head>
	<title>九河 -美国服务器托管</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF_8">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${IncPath}/css/Trustee.css">
	<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="${IncPath}/js/Trustee.js"></script>
	<script src="${IncPath}/js/TrusteeControlAmerica.js"></script>


<style>
	ul,li,dl,dd{ margin:0; padding:0; list-style:none;}
	*{ font-size:12px; color:#666; font-family:'微软雅黑';border:none;}
	.ul-left2 li button{width:150px}
</style>


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
	<#include "../idcheader.ftl" >
	<br/>
	<br/> 
	<div class="big">
	<#if user ??>
		<form action="${BasePath}/controller/product/addHardware.do"  method="post"  autocomplete="off">
	<#else>
		<form action="${url}"method="post"  autocomplete="off" onsubmit="location='${CasPath}/login?service=${url}';return false;">
	</#if>
		<input type="hidden" name="pay" id="pay">
		<input type="hidden" name="config" id="config">
		<input type="hidden" name="ipnum" id="ipnum" value="1">
<!-- 		<input type="hidden" name="buynum" id="buynum" value="1"> -->
		<input type="hidden" name="orderCycle" id="orderCycle" value="0">
		<input type="hidden" name="idlink" id="idlink">
		<input type="hidden" name="goodsId" id="goodsId" value="9">
		<div class="big-left">
			<ul class="ul-left">
				<li>
				<p class="left-p">托管规格：</p>
					<ul class="ul-left0">
						<li><button type="button" class="btn btn-default" value="0" id="349">1U</button></li>
						<li><button type="button" class="btn btn-default" value="2000" id="350">2U</button></li>
						<li><button type="button" class="btn btn-default" value="4000" id="351">4U</button></li>
						<li><button type="button" class="btn btn-default" value="27680" id="352">半机柜</button></li>
						<li><button type="button" class="btn btn-default" value="45920" id="353">整机柜</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">机柜功率：</p>
					<ul class="ul-left1">
						<li><button type="button" class="btn btn-default" value="0" id="354">300W</button></li>
						<li><button type="button" class="btn btn-default" value="12000" id="355">8A/120V</button></li>
						<li><button type="button" class="btn btn-default" value="24000" id="356">15A/120V</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">国际带宽：</p>
					<ul class="ul-left2">
						<li><button type="button" class="btn btn-default" value="0" id="357">10M独享国际带宽</button></li>
					</ul>
				</li>
			</ul>
			
			<p class="left-p">公网IP：</p>
					<ul class="ul-ip"> 
						<li style="height:35px">
							<button type="button" class="btn btn-success22" onclick="ip_cut(min)" id="ip-leftcut">
								<span class="glyphicon glyphicon-arrow-down other-span"></span>
							</button>
							
							<input type="text" class="form-control ip" style="width:50px;position:relative;top:3px;text-align:center;display:inline-block" value="1" disabled id="358">
							
							<button type="button" class="btn btn-success22" style="width:40px" onclick="ip_add(max)" id="ip-rightadd">
								<span class="glyphicon glyphicon-arrow-up other-span"></span>
							</button>
						</li>
					</ul>
					
			<div class="buy-num">
			<p class="left-p">购买时长：</p>
				<ul class="ul-time">
					<li><button type="button" class="btn btn-default" value="1">一年付</button></li>
					<li><button type="button" class="btn btn-default" value="2">两年付</button></li>
				</ul>
			</div>
			<div class="buy-num">
				<p class="left-p">购买数量：</p>
					<ul class="ul-num"> 
						<li>
							<button type="button" class="btn btn-success22" style="width:40px" onclick="goods_cut()" id="left-cut">
								<span class="glyphicon glyphicon-arrow-down other-span"></span>
							</button>
							
								<input type="text" class="form-control" style="width:50px;position:relative;top:3px;text-align:center;display:inline-block" value="1"  id="number" name="number" readonly="readonly">
								
							<button type="button" class="btn btn-success22" style="width:40px" onclick="goods_add()" id="right-add">
								<span class="glyphicon glyphicon-arrow-up other-span"></span>
							</button>
						</li>
					</ul>
					<span id="ip-tip" style="position:relative;left:150px;top:-168px">增加360元/个/年  最多增加13个</span>
			</div>
		</div>
		<div class="big-right">
			<div class="progress" style="height:8px">
				<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
				</div>
			</div>
			<div class="right-top">
				<span class="glyphicon glyphicon-fire fa-lg" style="color:black;font-size:18px"></span>
				<span style="position:relative;top:6px">当前配置</span>
			</div>
			<div class="right-body">
				<ul class="list-group right-ul" style="margin-bottom:-2px">
					<li class="list-group-item">选择型号：创业型</li>
					<li class="list-group-item">cpu核数：12核</li>
					<li class="list-group-item">内存容量：128G</li>
				<ul>
				<ul class="list-group right-ul2" style="margin-bottom:-2px">
					<li class="list-group-item">公网IP：1</li>
					<li class="list-group-item">购买时长：一年付</li>
					<li class="list-group-item" style="border-bottom:0px">购买数量：1</li>
				</ul>
				<ul class="list-group right-ul3" style="margin-bottom:-2px">
					<li class="list-group-item other-li">配置价格：<span class="price-sty"></span></li>
				</ul>
				<ul class="list-group right-ul4" style="margin-bottom:-2px">
					<li class="list-group-item other-li">基本价格：<span class="base-price"></span></li>
				</ul>
				<ul class="list-group right-ul5">
					<li class="list-group-item other-li">商品总价：<span class="all-price"></span></li>
				</ul>
			</div>
			<div class="right-foot">
				<input type="submit" name="submit" value="立即订购" class="btn other-submit">
			</div>
		</div>
		</form>
	</div>
	<ul class="P_price" style="display:none">
		<li>0</li>
		<li>0</li>
		<li>0</li>
	</ul>
	<ul class="P_price2" style="display:none">
		<li>1</li>
		<li>0</li>
		<li>1</li>
	</ul>
	<ul class="P_id" style="display:none">
		<li>0</li>
		<li>0</li>
		<li>0</li>
	</ul>
	<ul class="P_id2" style="display:none">
		<li>0</li>
	</ul>
	
	<ul class="P_base" style="display:none">
		<li>8000</li>
		<li>16000</li>
	</ul>
	
</div>
<#include "../idcfooter.ftl" >
</body>
<script src="${BasePath}/scripts/custom/ex.js"></script>
</html>