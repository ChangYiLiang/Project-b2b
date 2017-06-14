<#include "layout.common.ftl">
<#macro script>
</#macro>
<@layout>
	<ul class="search-ul">
		<div class="sea-top"><img src="${BasePath}/images/2bsearch/40-40.png"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;抱歉，没有与"<span style="color:black">${keyword?default("")}</span>"相关的商品！！！</span></div>
		<br/>
		<br/>
		<ul class="sea-hot">
			<div class="sea-title"><p>热销产品</p></div>
			<br/>
			<li>
				<div class="flag">
					<img src="${BasePath}/images/2bsearch/R730.png" alt="" style="width:190px;height:260px"/>
				</div>
				<span>￥9500.00</span>
				<p><a href="${BasePath}/i9he/fuwuqi.do?goodsId=16">戴尔DELL R730双路服务器 2U机架服务器 全新正品三年质保</a></p>
			</li>
			<li>
				<div class="flag">
					<img src="${BasePath}/images/2bsearch/R230.png" alt="" style="width:190px;height:260px"/>
				</div>
				<span>￥4300.00</span>
				<p><a href="${BasePath}/i9he/fuwuqi.do?goodsId=81">戴尔DELL R230服务器 1U入门级机架服务器 全新正品三年质保</a></p>
			</li>
			<li>
				<div class="flag">
					<img src="${BasePath}/images/2bsearch/R530.png" alt="" style="width:190px;height:260px"/>
				</div>
				<span>￥8500.00</span>
				<p><a href="${BasePath}/i9he/fuwuqi.do?goodsId=14">戴尔DELL R530服务器E5 2U 机架服务器 全新正品三年质保</a></p>
			</li>
			<li>
				<div class="flag">
					<img src="${BasePath}/images/2bsearch/mcw.png" alt="" style="width:190px;height:260px"/>
				</div>
				<span>￥4100.00</span>
				<p><a href="${BasePath}/i9he/fuwuqi.do?goodsId=109">美超微 5018D-MF 1U机架服务器 4GB 500GB 全新正品 品牌保证</a></p>
			</li>
			<li>
				<div class="flag">
					<img src="${BasePath}/images/2bsearch/RH1288-v3.png" alt="" style="width:190px;height:260px"/>
				</div>
				<span>￥9058.00</span>
				<p><a href="${BasePath}/i9he/fuwuqi.do?goodsId=100">华为 RH2288 V3机架式服务器 灵活配置 双路性能 2U 300GB</a></p>
			</li>
		</ul>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<ul class="sea-act">
			<p class="sea-acttitle"><span>热销活动</span></p>
			<br/>
	
			<img src="${BasePath}/images/2bsearch/act1.png">
			<img src="${BasePath}/images/2bsearch/act2.png">
			<img src="${BasePath}/images/2bsearch/act3.png">
			<br/>
			<br/>
			<br/>
		</ul>
	</ul>
</@layout>
<style>
    .sea-top{height:40px}
    .sea-top span{color:#1b9d97;font-size:13px;line-height:45px}
    .sea-title,.sea-acttitle{width:1200px;height:48px;background-color:#1b9d97}
    .sea-title p{color:white;font-size:18px;line-height:44px;padding-left:20px}
    .sea-acttitle span{color:white;font-size:18px;line-height:44px;padding-left:20px}
	.search-ul{width:1200px}
	.sea-hot{height:350px}
	.sea-hot li{width:214px;height:320px;margin-right:20px;
				  float:left;margin-bottom:35px}
	.sea-hot li div img{margin-left:10px;margin-top:8px}
	.sea-hot li span{font-size:16px;font-weight:bold;color:#1b9d97}			  
	.sea-hot li div{border:1px solid #ccc;width:214px;height:280px;
					  background-color:white;margin-bottom:2px}
	.sea-act img{margin-right:15px}
</style>
<script>
requirejs(['jquery'], function(){
	$(document).ready(function(){
		$(".flag").hover(function(){
			$(this).css("border","1px solid #1b9d97");
		},function(){
			$(this).css("border","1px solid #ccc");
		})
	})
});
</script>