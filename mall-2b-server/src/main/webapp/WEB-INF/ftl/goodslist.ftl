<#include "layout.common.ftl">

<@layout>
	<ul class="search-ul">
		<span>全部结果></span>
		<br/>
		<br/>
		<#list goods as g>
			<li>
				<div class="flag">
					<a href="${BasePath}/mall/${g.id}.html">
					<img src="${g.goodsImg!''}" alt="" style="width:190px;height:260px"/>
					</a>
				</div>
				<span>￥${g.goodsPrice}</span>
				<#if g.ifIdc = true>
					<p><a href="${BasePath}/mall/${g.id}.html">${g.goodsName}</a></p>
				<#else>
					<p><a href="${BasePath}/trust/${g.id}.html">${g.goodsName}</a></p>
				</#if>
			</li>
		</#list>
	</ul>
</@layout>

<#macro header>
<style>
	.search-ul{width:1200px}
	.search-ul li{width:214px;height:320px;margin-right:20px;
				  float:left;margin-bottom:35px}
	.search-ul li div img{margin-left:10px;margin-top:8px}
	.search-ul li span{font-size:16px;font-weight:bold;color:#1b9d97}			  
	.search-ul li div{border:1px solid #ccc;width:214px;height:280px;
					  background-color:white;margin-bottom:2px}
</style>
</#macro>

<#macro script>
require(['jquery'], function() {
	$(".flag").hover(function(){
		$(this).css("border","1px solid #1b9d97");
	},function(){
		$(this).css("border","1px solid #ccc");
	});
});
</#macro>