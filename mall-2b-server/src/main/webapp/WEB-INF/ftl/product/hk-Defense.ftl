<!DOCTYPE html>
<html>
<head>
	<title>九河 -香港服务器高防</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF_8">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${IncPath}/css/Defense.css">
	<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="${IncPath}/js/Defense.js"></script>
	<script src="${IncPath}/js/DefenseControlHongkong.js"></script>


<style>
	ul,li,dl,dd{ margin:0; padding:0; list-style:none;}
	*{ font-size:12px; color:#666; font-family:'微软雅黑';border:none;}
	.ul-left0 li button{width:100px}
	.ul-left1 li button{width:400px}
	.ul-left3 li button{width:50px}
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
		<input type="hidden" name="orderCycle" id="orderCycle" value="0">
		<input type="hidden" name="idlink" id="idlink">
		<input type="hidden" name="goodsId" id="goodsId" value="10">
		<div class="big-left">
			<ul class="ul-left">
				<li>
				<p class="left-p">防御峰值：</p>
					<ul class="ul-left0">
						<li><button type="button" class="btn btn-default" value="0" id="395">10G</button></li>
						<li><button type="button" class="btn btn-default" value="3000" id="396">30G</button></li>
						<li><button type="button" class="btn btn-default" value="8800" id="397">50G</button></li>
						<li><button type="button" class="btn btn-default" value="27000" id="398">80G</button></li>
						<li><button type="button" class="btn btn-default" value="47000" id="399">150G</button></li>
						<li><button type="button" class="btn btn-default" value="177000" id="400">无限防御</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">默认配置：</p>
					<ul class="ul-left1">
						<li><button type="button" class="btn btn-default" value="0" id="401">4核处理器.8GB DDR3内存.500GB SATA硬盘</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">网络带宽：</p>
					<ul class="ul-left2">
						<li><button type="button" class="btn btn-default" value="0" id="402">5M独享</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="403">10M独享</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">公网IP：</p>
					<ul class="ul-left3">
						<li><button type="button" class="btn btn-default" value="0" id="404">1个</button></li>
						<li><button type="button" class="btn btn-default" value="1000" id="405">2个</button></li>
						<li><button type="button" class="btn btn-default" value="2000" id="406">3个</button></li>
						<li><button type="button" class="btn btn-default" value="3000" id="407">4个</button></li>
						<li><button type="button" class="btn btn-default" value="4000" id="408">5个</button></li>
						<li><button type="button" class="btn btn-default" value="5000" id="409">6个</button></li>
						<li><button type="button" class="btn btn-default" value="6000" id="410">7个</button></li>
						<li><button type="button" class="btn btn-default" value="7000" id="411">8个</button></li>
						<li><button type="button" class="btn btn-default" value="8000" id="412">9个</button></li>
						<li><button type="button" class="btn btn-default" value="9000" id="413">10个</button></li>
						<li><button type="button" class="btn btn-default" value="10000" id="414">11个</button></li>
						<li><button type="button" class="btn btn-default" value="11000" id="415">12个</button></li>
					</ul>
				</li>
			</ul>
			
		
			<p class="left-p">操作系统：</p>
				<ul class="ul-win">
					<li>
						<select class="form-control selectpicker">
							<option selected="selected" value="0" id="416">Win2003标准版(64位)</option>
							<option value="0" id="417">Win2008标准版(64位)</option>
							<option value="300" id="418">Win2003企业版(64位)</option>
							<option value="300" id="419">Win2008企业版(64位)</option>
							<option value="300" id="420">Win2012企业版(64位)</option>
							<option value="0" id="421">Centos5(64位)</option>
							<option value="0" id="422">Centos6(64位)</option>
						</select>
					</li>
				</ul>
			<div class="buy-num">
			<p class="left-p">购买时长：</p>
				<ul class="ul-time">
					<li><button type="button" class="btn btn-default" value="1">月付</button></li>
					<li><button type="button" class="btn btn-default" value="3">季付</button></li>
					<li><button type="button" class="btn btn-default" value="6">半年付</button></li>
					<li><button type="button" class="btn btn-default" value="12">一年付</button></li>
					<li><button type="button" class="btn btn-default" value="24">两年付</button></li>
				</ul>
			</div>
			<div class="buy-num">
				<p class="left-p">购买数量：</p>
					<ul class="ul-num"> 
						<li>
							<button type="button" class="btn btn-success22" style="width:40px" onclick="goods_cut()" id="left-cut">
								<span class="glyphicon glyphicon-arrow-down other-span"></span>
							</button>
								<input type="text" class="form-control" style="width:50px;position:relative;top:4px;text-align:center;display:inline-block" value="1"  id="number" name="number" readonly="readonly">
							<button type="button" class="btn btn-success22" style="width:40px" onclick="goods_add()" id="right-add">
								<span class="glyphicon glyphicon-arrow-up other-span"></span>
							</button>
						</li>
					</ul>
				<span id="m-left" style="position:relative;top:-470px;left:500px"></span>
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
					<li class="list-group-item">硬盘容量：1x240GB SSA</li>
				<ul>
				<ul class="list-group right-ul2" style="margin-bottom:-2px">
					<li class="list-group-item">操作系统：Win2008标准版(64位)</li>
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
		<li>0</li>
		<li>0</li>
		<li>0</li>
	</ul>
	<ul class="P_price2" style="display:none">
		<li>0</li>
		<li>0</li>
		<li>1</li>
	</ul>
	<ul class="P_id" style="display:none">
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
	</ul>
	<ul class="P_id2" style="display:none">
		<li>0</li>
	</ul>
	<ul class="P_base" style="display:none">
		<li>3000</li>
		<li>9000</li>
		<li>18000</li>
		<li>36000</li>
		<li>72000</li>
	</ul>
	
</div>
<#include "../idcfooter.ftl" >
</body>
<script src="${BasePath}/scripts/custom/ex.js"></script>
</html>