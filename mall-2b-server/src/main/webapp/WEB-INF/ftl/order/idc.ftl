<link rel="stylesheet" href="${BasePath}/css/agenttrust.css">

		<ul style="display:none">
			<#list mapp?keys as val>
				<#if val_index = len-1>
					<li>
						<ul class="Pikachu">
							<#list mapp[val] as v>
								<li data="${v.id}">${v.price}</li>
							</#list>
						</ul>
					</li>
				</#if>
			</#list>
		</ul>
		<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script>
		
			$(function(){
				$(".P_price").ready(function(){
		
					var ipData = $(".Pikachu").children("li:eq(0)").attr("data");
					var ipVal = $(".Pikachu").children("li:eq(0)").text();
		
					var l = ${len}-1;
					var p = "";
					var d = "";
					var k = "";
					for(var i=0;i<l;i++){			
						p +="<li>0</li>";
						d +="<li>0</li>";
						k +="<li></li>";
					}			
					$(".P_price").append(p);
					$(".P_id").append(d);
					$(".right-ul").append(k);
					$(".P_id2").children("li:eq(0)").text(ipData);
					$(".P_id2").children("li:eq(0)").attr("data",ipVal);
					$("#ipprice").text(ipVal);
					$("#ipflag").val(ipData);
				});
			});
		</script>
		<style>
			.left-p{font-size:14px}
			.HHH li{margin-top:0px}
			.sty-ip img{margin-top:-6px !important}
			.sty-input{top:2px !important}
			.ul-time li{margin-top:-10px}
			.big-body{width:1200px;height:600px;border:1px solid #ccc;margin-top:40px}
			.big-bodyone,.big-bodytwo{width:1200px;height:42px;background-color:#F8E5DA}
			.big-bodyone > p{margin-left:35px;font-size:14px;line-height:42px;margin-bottom:40px}
			.big-left{margin-left:38px}
			.gg{font-size:14px;line-height:42px;margin-right:100px}
		</style>
		<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/trust.js"></script>
		<script type="text/javascript" src="${goodsIdc.jsfile!""}"></script>
		<div class="big-body">
		<div class="big-bodyone">
			<p>数据中心托管服务<span>【选购托管时长为1年或2年时，将获得1个月的试用权限，1个月内若出现故障，可随时申请全额退款！】</span></p>
		</div>
		<br/>
		<br/>
		<div class="big-left">
			<ul class="ul-left">
				<#list mapp?keys as val>
					<#if val_index lt len-1>
						<li>
						<p class="left-p">${val}：</p>
							<ul class="ul-left${val_index} HHH">
								<#list mapp[val] as v>
									<li><button type="button" class="btn btn-default" value="${v.price}" id="${v.id}">${v.title!""}</button></li>
								</#list>
							</ul>
						</li>
					</#if>
				</#list>
			</ul>
			
			<div class="buy-num" style="margin-top:10px">
			<p class="left-p">公网IP：</p>
					<ul class="ul-ip" style="position:relative;left:0px;top:0px">
						<li>
							<button type="button" class="btn btn-success22" style="width:40px" onclick="ip_cut(min)" id="ip-leftcut">
								<span class="sty-ip"><img src="${BasePath}/images/2bmain/bottom.png"></span>
							</button>
							<input type="text" class="form-control ip sty-input" value="1" disabled>
							<button type="button" class="btn btn-success22" style="width:40px" onclick="ip_add(max)" id="ip-rightadd">
								<span class="sty-ip"><img src="${BasePath}/images/2bmain/top.png"></span>
							</button>
						</li>
					</ul>
			</div>	
			<div class="buy-num" style="margin-top:0px">
			<p class="left-p" style="position:relative;top:-13px">购买时长：</p>
				<ul class="ul-time">
					<li><button type="button" class="btn btn-default" value="1">一年付</button></li>
					<li><button type="button" class="btn btn-default" value="2">两年付</button></li>
				</ul>
			</div>
		</div>
		
		<ul class="P_price" style="display:none">
		</ul>
		<ul class="P_price2" style="display:none">
			<li>1</li>
			<li>0</li>
			<li>1</li>
		</ul>
		<ul class="P_id" style="display:none">
		</ul>
		<ul class="P_id2" style="display:none">
			<li></li>
		</ul>
		
        <div class="r230_cr clearfix" style="width:450px;float:left;display:none">
            <div class="dangqianpz" style="margin-left:20px">当前所选配置</div>
            	<br/>
				<ul class="list-group right-ul" style="margin-bottom:-2px">
				</ul>
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
		<div class="big-bodytwo" style="float:left">
			<p class="pull-right gg">合计（含运费）：<span class="all-price" style="color:#1B9D97;font-weight:bold;font-size:14px">999</span></p>
		</div>
		
	</div>
		