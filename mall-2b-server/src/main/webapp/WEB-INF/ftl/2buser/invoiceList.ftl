<#include "../layout.b2b.ftl">
<#assign active='b4'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/user/invoicelist.do">发票记录</a></li>
</#macro>
<#macro script>
requirejs(['jquery'],function(){
	$(function(){
		 $(".invoice-body-content").each(function(){
			var height =$(this).height();
			var newHeight = height+"px";
			$(this).children().next().css({"line-height":newHeight});
			$(this).children().next().next().css({"line-height":newHeight});
		});
	});
	$(".service").each(function(){
		$(this).click(function(){
			$("#globalService").click();
		});
	});
});
</#macro>

<@layout>
<link rel="stylesheet" href="${BasePath}/css/invoice.css"/>

<h2 class="bg-white">我的发票</h2>

<div class="bg-white other-body">
	<div class="from-control tips">
		<p>温馨提示： </p>
		<p>补开发票需下单在180天内，普票订单完成，增票订单完成10天以上。</p>
	</div>
</div>

<div class="bg-white other-body invoice-body">
<#if invoiceList ?? && (invoiceList?size>0)>
	<#list invoiceList as invoice>
	<div class="row from-controlle">
	<div class="col-md-12 invoice-body-header">
		<div class="col-md-8">
			<span>${invoice.order.createdDate?datetime} &nbsp&nbsp|&nbsp&nbsp ${invoice.order.userName!''}  &nbsp&nbsp|&nbsp&nbsp 订单号：${invoice.order.id!''}</span>
		</div>
		<div class="col-md-3 col-md-offset-1">
			<span>订单金额：<span style="color: #1B9D97;font-size: 20px">${invoice.order.amount!''}</span>元</span>
		</div>
	</div>
	<div class="col-md-12 invoice-body-content">
		<div class="col-md-6 text-center order">
			<#if invoice.order.orderType == 1>
				<#list invoice.order.orderList as ord>
				<div class="row order-box" <#if !ord_has_next>style="border-bottom:0px;"</#if>>
					<div class="col-md-6 order-img">
						<img src="${ord.goodsImg!''}" style="width:120px ;height:80px">
					</div>
					<div class="col-md-6">
						<p>${ord.goodsName!''}</p>
						<p style="color: #999">${((ord.amount-(ord.expressfee!'0')?number)/ord.count?number)!''}<span>元&nbspx</span>${ord.count!''}</p>
					</div>
				</div>
				</#list>
			<#elseif invoice.order.orderType == 0>
				<div class="row order-box2">
					<div class="col-md-6 order-img">
						<img src="${invoice.order.goodsImg!''}" style="width:110px ;height:80px">
					</div>
					<div class="col-md-6">
						<p>${invoice.order.goodsName!''}</p>
						<p style="color: #999">${((invoice.order.amount-(invoice.order.expressfee!'0')?number)/invoice.order.count?number)!''}<span>元&nbspx</span>${invoice.order.count!''}</p>
					</div>
				</div>
			</#if>
		</div>
		<div class="col-md-2 text-center invoice-type">
			<span><#if invoice.type == 0>纸质发票<#else>增值税发票</#if></span>
		</div>
		<div class="col-md-2 text-center invoice-state">
			<#if invoice.state == 0><span style="color:#1B9D97">未开</span><#else><span style="color:red">已开</span></#if>
		</div>
		<div class="col-md-2 text-center invoice-operat">
			<a href="javascript:;" class="service">&nbsp&nbsp<span>联系客服</span>&nbsp&nbsp</a>
		</div>
	</div>
	</div>
	</#list>
	<#--分页-->
		<nav>
	 	  <ul class="pagination order-page">
	 	  	<li><a href="${BasePath}/controller/user/invoicelist.do?pageNo=1">首页</a></li>
		  	<#if page.pageNo != 1>
		  		<li><a href="${BasePath}/controller/user/invoicelist.do?pageNo=${page.pageNo -1}">&laquo;</a></li>
		  	<#else>
		  		<li class="disabled"><a>&laquo;</a></li>
		  	</#if>	
		    <#list 1..page.pageCount as i>
		   	 <#if page.pageNo == i>
		   	 	<li class="active"><a >${i}</a></li>
		   	 <#else>
		   	 	<#if ((i>page.pageNo-3) || (i<3)) && ((i<page.pageNo+3) || (i>page.pageCount-2))>
		   	 	<li><a href="${BasePath}/controller/user/invoicelist.do?pageNo=${i}">${i}</a></li>
		   	 	</#if>
		   	 </#if>	
		    </#list>
		    <#if page.pageNo != page.pageCount>
		    	<li><a href="${BasePath}/controller/user/invoicelist.do?pageNo=${page.pageNo +1}">&raquo;</a></li>
		    <#else>
		    	<li class="disabled"><a>&raquo;</a></li>
		    </#if>
		    <li><a href="${BasePath}/controller/user/invoicelist.do?pageNo=${page.pageCount}">尾页</a></li>
		    <li><span>共${page.pageCount!''}页</span></li>
		  </ul>
		</nav>
<#else>
	<br/><br/>
	<p class="text-center" style="font-size:18px;color:#999999">当前没有发票记录！</p>
</#if>

</div>

</@layout>
