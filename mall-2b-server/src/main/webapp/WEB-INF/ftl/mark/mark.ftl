<#include "../layout.b2b.ftl">
<#assign active='o7'>
<@layout>
<div class="bg-white">
	<div class="big-right">
		<ul class="right-top">
			<li>
				我的痕迹
			</li>
		</ul>
		<ul class="right-top2">
			<#list mapgoods?keys as val>
					<li>
						<img src="${mapgoods[val]['goodsImg']?default("")}">
						<br/>
						<br/>
						<p>${mapgoods[val]['goodsName']?default("")}</p>
						<p>价格：${mapgoods[val]['goodsPrice']?default("0")}￥</p>
						<a href="${BasePath}/i9he/fuwuqi.do?goodsId=${mapgoods[val]['id']}" style="color:white;width:170px;margin-left:24px" class="btn btn-primary btn-block">购买</a>	
					</li>
			</#list>
		</ul>
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
</div>
<style>
	.big-right{width:780px;background-color:white;height:auto;
	           display:inline-block;margin-left:40px;}
	.right-top{border-bottom:1px solid #eee;height:58px}
	.right-top li{font-size:18px;color:#999;line-height:58px}
	.right-top2 li{height:325px;width:220px;
					border:1px solid #1b9d97;float:left;margin-right:40px;margin-top:40px}
	.right-top2 li img{width:170px;height:170px;margin-left:24px;
					   margin-top:20px}
	.right-top2 li p{margin-left:24px;font-size:14px}
</style>
</@layout>