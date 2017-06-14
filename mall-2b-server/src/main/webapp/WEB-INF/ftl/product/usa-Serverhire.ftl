<!DOCTYPE html>
<html>
<head>
	<title>九河 -美国服务器租用</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF_8">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${IncPath}/css/Rent.css">
	<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="${IncPath}/js/Rent.js"></script>
	<script src="${IncPath}/js/RentControlAmerica.js"></script>


<style>
	ul,li,dl,dd{ margin:0; padding:0; list-style:none;}
	*{ font-size:12px; color:#666; font-family:'微软雅黑';border:none;}
	.ul-left5 li button{width:200px}
	.ul-left1 li button{width:80px}
</style>


<!--[if lt IE 9]>
  <link rel="stylesheet" href="${BasePath}/css/bsie.css" />
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="${BasePath}/css/IE8.js"></script>
<!--[if !IE]>-->
<body>
<!--<![endif]-->
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!--[if IE 7]><body class="ie7"><![endif]-->
<!--[if IE 8]><body class="ie8"><![endif]-->
<!--[if IE 9]><body class="ie9"><![endif]-->
<!--[if !IE]>-->
<body>
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
<!-- 		<input type="hidden" name="buynum" id="buynum" value="1"> -->
		<input type="hidden" name="idlink" id="idlink">
		<input type="hidden" name="orderCycle" id="orderCycle" value="0">
		<input type="hidden" name="goodsId" id="goodsId" value="6">
		<div class="big-left">
			<ul class="ul-left">
				<li>
				<p class="left-p">选择型号：</p>
					<ul class="ul-left0">
						<li><button type="button" class="btn btn-default" value="0" id="284">特价型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="285">创业型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="286">进取型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="287">卓越型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="288">至尊型</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">cpu核数：</p>
					<ul class="ul-left1">
						<li><button type="button" class="btn btn-default" value="0" id="289">2核</button></li>
						<li><button type="button" class="btn btn-default" value="300" id="290">4核</button></li>
						<li><button type="button" class="btn btn-default" value="1600" id="291">12核</button></li>
						<li><button type="button" class="btn btn-default" value="1100" id="292">16核</button></li>
						<li><button type="button" class="btn btn-default" value="1900" id="293">28核</button></li>
						<li><button type="button" class="btn btn-default" value="5500" id="294">32核</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">内存容量：</p>
					<ul class="ul-left2">
						<li><button type="button" class="btn btn-default" value="0" id="295">8GB</button></li>
						<li><button type="button" class="btn btn-default" value="450" id="296">32GB</button></li>
						<li><button type="button" class="btn btn-default" value="1050" id="297">64GB</button></li>
						<li><button type="button" class="btn btn-default" value="2250" id="298">128GB</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">硬盘容量：</p>
					<ul class="ul-left3">
						<li><button type="button" class="btn btn-default" value="0" id="299">500GB SATA</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="300">1x240GB SSD</button></li>
						<li><button type="button" class="btn btn-default" value="150" id="301">2x240GB SSD</button></li>
						<li><button type="button" class="btn btn-default" value="750" id="302">3x2TB SAS</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">公网IP：</p>
					<ul class="ul-left4 other-btn">
						<li><button type="button" class="btn btn-default" value="0" id="303">2个</button></li>
						<li><button type="button" class="btn btn-default" value="30" id="304">3个</button></li>
						<li><button type="button" class="btn btn-default" value="60" id="305">4个</button></li>
						<li><button type="button" class="btn btn-default" value="90" id="306">5个</button></li>
						<li><button type="button" class="btn btn-default" value="120" id="307">6个</button></li>
						<li><button type="button" class="btn btn-default" value="150" id="308">7个</button></li>
						<li><button type="button" class="btn btn-default" value="180" id="309">8个</button></li>
						<li><button type="button" class="btn btn-default" value="210" id="310">9个</button></li>
						<li><button type="button" class="btn btn-default" value="240" id="311">10个</button></li>
						<li><button type="button" class="btn btn-default" value="270" id="312">11个</button></li>
						<li><button type="button" class="btn btn-default" value="300" id="313">12个</button></li>
						<li><button type="button" class="btn btn-default" value="330" id="314">13个</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">网络带宽：</p>
					<ul class="ul-left5">
						<li><button type="button" class="btn btn-default" value="0" id="315">100M独享</button></li>
						<li><button type="button" class="btn btn-default" value="1000" id="316">1G独享 100TB月限流量</button></li>
						<li><button type="button" class="btn btn-default" value="3000" id="317">1G独享 100TB月不限流量</button></li>
					</ul>
				</li>
			</ul>
			<p class="left-p">操作系统：</p>
				<ul class="ul-win">
					<li>
						<select class="form-control selectpicker">
							<option selected="selected" value="0" id="318">Win2003标准版(64位)</option>
							<option value="0" id="319">Win2008标准版(64位)</option>
							<option value="300" id="320">Win2003企业版(64位)</option>
							<option value="300" id="321">Win2008企业版(64位)</option>
							<option value="300" id="322">Win2012企业版(64位)</option>
							<option value="0" id="323">Centos5(64位)</option>
							<option value="0" id="324">Centos6(64位)</option>
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
							<input type="text" class="form-control" style="width:50px;position:relative;top:3px;text-align:center;display:inline-block" value="1"  id="number" name="number" readonly="readonly">
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
					<li class="list-group-item">公网IP：10个</li>
					<li class="list-group-item">网络带宽：100M独享</li>
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
		<li>0</li>
		<li>0</li>
	</ul>
	<ul class="P_id2" style="display:none">
		<li>0</li>
	</ul>
	<ul class="P_base" style="display:none">
		<li>599</li>
		<li>1797</li>
		<li>3594</li>
		<li>7188</li>
		<li>14376</li>
	</ul>
	
</div>
<#include "../idcfooter.ftl" >
</body>
<script src="${BasePath}/scripts/custom/ex.js"></script>
</html>