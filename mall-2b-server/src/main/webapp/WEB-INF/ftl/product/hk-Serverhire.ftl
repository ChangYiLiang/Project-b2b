<!DOCTYPE html>
<html>
<head>
	<title>九河 -香港服务器租用</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF_8">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${IncPath}/css/Rent.css">
	<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="${IncPath}/js/Rent.js"></script>
	<script src="${IncPath}/js/RentControlAsia.js"></script>


<style>
	ul,li,dl,dd{ margin:0; padding:0; list-style:none;}
	*{ font-size:12px; color:#666; font-family:'微软雅黑';border:none;}
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
<!-- 		<input type="hidden" name="buynum" id="buynum" value="1"> -->
		<input type="hidden" name="idlink" id="idlink">
		<input type="hidden" name="orderCycle" id="orderCycle" value="0">
		<input type="hidden" name="goodsId" id="goodsId" value="2">
		<div class="big-left">
			<ul class="ul-left">
				<li>
				<p class="left-p">选择型号：</p>
					<ul class="ul-left0">
						<li><button type="button" class="btn btn-default" value="0" id="244">创业型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="245">专业型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="246">进取型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="247">卓越型</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="248">至尊型</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">cpu核数：</p>
					<ul class="ul-left1">
						<li><button type="button" class="btn btn-default" value="0" id="249">4核</button></li>
						<li><button type="button" class="btn btn-default" value="1700" id="250">12核</button></li>
						<li><button type="button" class="btn btn-default" value="800" id="251">16核</button></li>
						<li><button type="button" class="btn btn-default" value="1600" id="252">28核</button></li>
						<li><button type="button" class="btn btn-default" value="5200" id="253">32核</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">内存容量：</p>
					<ul class="ul-left2">
						<li><button type="button" class="btn btn-default" value="0" id="254">8GB</button></li>
						<li><button type="button" class="btn btn-default" value="450" id="256">32GB</button></li>
						<li><button type="button" class="btn btn-default" value="1050" id="257">64GB</button></li>
						<li><button type="button" class="btn btn-default" value="2250" id="258">128GB</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">硬盘容量：</p>
					<ul class="ul-left3">
						<li><button type="button" class="btn btn-default" value="0" id="259">1x240GB SSD</button></li>
						<li><button type="button" class="btn btn-default" value="0" id="260">500GB SATA</button></li>
						<li><button type="button" class="btn btn-default" value="150" id="261">2x240GB SSD</button></li>
						<li><button type="button" class="btn btn-default" value="750" id="262">3x2TB SAS</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">公网IP：</p>
					<ul class="ul-left4 other-btn">
						<li><button type="button" class="btn btn-default" value="0" id="263">2个</button></li>
						<li><button type="button" class="btn btn-default" value="50" id="264">3个</button></li>
						<li><button type="button" class="btn btn-default" value="100" id="265">4个</button></li>
						<li><button type="button" class="btn btn-default" value="150" id="266">5个</button></li>
						<li><button type="button" class="btn btn-default" value="200" id="267">6个</button></li>
						<li><button type="button" class="btn btn-default" value="250" id="268">7个</button></li>
						<li><button type="button" class="btn btn-default" value="300" id="269">8个</button></li>
						<li><button type="button" class="btn btn-default" value="350" id="270">9个</button></li>
						<li><button type="button" class="btn btn-default" value="400" id="271">10个</button></li>
						<li><button type="button" class="btn btn-default" value="450" id="272">11个</button></li>
						<li><button type="button" class="btn btn-default" value="500" id="273">12个</button></li>
						<li><button type="button" class="btn btn-default" value="550" id="274">13个</button></li>
					</ul>
				</li>
				<li>
				<p class="left-p">网络带宽：</p>
					<ul class="ul-left5">
						<li><button type="button" class="btn btn-default" value="0" id="275">5M独享</button></li>
						<li><button type="button" class="btn btn-default" value="400" id="276">10M独享</button></li>
					</ul>
				</li>
			</ul>
			
		
			<p class="left-p">操作系统：</p>
				<ul class="ul-win">
					<li>
						<select class="form-control selectpicker">
							<option selected="selected" value="0" id="277">Win2003标准版(64位)</option>
							<option value="0" id="278">Win2008标准版(64位)</option>
							<option value="300" id="279">Win2003企业版(64位)</option>
							<option value="300" id="280">Win2008企业版(64位)</option>
							<option value="300" id="281">Win2012企业版(64位)</option>
							<option value="0" id="282">Centos5(64位)</option>
							<option value="0" id="283">Centos6(64位)</option>
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
				<span id="m-left" style="position:relative;top:-470px;left:620px"></span>
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
			<#--<div class="table-actions-wrapper">
				<button class="btn btn-add blue table-group-action-submit"  onclick="javascript:User.addCart();"> 加入购物车</button>
			</div>-->
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
		<li>999</li>
		<li>2997</li>
		<li>5994</li>
		<li>11988</li>
		<li>23976</li>
	</ul>
	
</div>
<#include "../idcfooter.ftl" >
</body>
<script src="${IncPath}/assets/scripts/core/app.js"></script>
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/ex.js"></script>
</html>