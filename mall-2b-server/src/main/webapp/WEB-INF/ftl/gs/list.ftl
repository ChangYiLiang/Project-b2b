<#include "../layout.b2b.ftl">
<#assign active='b6'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/gssy/list.do">河马赊账</a></li>
</#macro>
<@layout header=head>
<style>
	.sq{position: relative;left:-88px;top:2px;color:White}
	.gs{margin-left:30px;}
	.money{color:#1B9D97}
</style>
	<h2 class="bg-white">河马赊账</h2>
	<div class="bg-white other-body" style="height:865px">
		<br/>
		<br/>
	<#if registerUrl??>
		<img " style="width:855px;height:710px;margin-left:50px;" src="${BasePath}/images/jr/u147.png"/>
		<p class="text-center"><a href="${BasePath}/about/jinrong.do" target="_blank">了解河马赊账>><a></p>
		<div class="text-center" style="margin-left:35px;" class="gs"><a href='${registerUrl!""}' target="_blank"><img src="${BasePath}/images/jr/u150.png"/><lable class="sq">立即申请</lable></a></div>
	<#else>
			<#if (list?size>0) >
				<div class="text-right" style="margin-right:45px;font-size:14px;">剩余额度:&nbsp;<span class="money" style="font-size:14px;">${balance!""}</span><a href="${loginUrl}" target="_blank" class="btn blue btn-primary" style="color:	White;margin-left:10px;">进入国商</a></div>
				<br/>
				        <table class="table table-bordered" class="text-center" style="width:860px;margin-left:45px;">
				        	<tr>
				        		<td>订单编号</td>
				        		<td>订单金额</td>
				        		<td>下单时间</td>
				        		<td>约定还款时间</td>
				        		<td>放款时间</td>
				        		<td>还款时间</td>
				        		<td>状态</td>
				        		<td>操作</td>
				        		
				        	</tr>
				        	<#list list as order>
					        	<tr>
					        		<td>${order.orderid!""}</td>
					        		<td>${order.amount!""}</td>
					        		<td>${(order.orderTime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
					        		<td>${order.returnMoney!''}</td>
					        		<td>${(order.getmoneytime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
					        		<td>${(order.tomoney?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
					        		<#if order.status==1><td>已下单</td></#if>
					        		<#if order.status==2><td>放款中</td></#if>
					        		<#if order.status==3><td>已放款</td></#if>
					        		<#if order.status==4><td>已还款</td></#if>
					        		<#if order.status==5><td>已取消</td></#if>
					        		<#if order.status==6><td>已退货</td></#if>
					        		<#if order.status==7><td>退货中</td></#if>
					        		<#if order.status==8><td>已拒绝</td></#if>
					        		<#if order.status==1>
					        			<td><a href="javascript:;" onclick="cancelOrder(${order.orderid})">取消订单</a></td>
					        		<#elseif order.status==2>
					        			<td><a href="javascript:;" onclick="cancelOrder(${order.orderid})">取消订单</a></td>
					        		<#elseif order.status==3>
					        			<td><a target="_blank" href="${BasePath}/afs/apply.do?orderId=${order.orderid!""}&goodsId=${order.goodsId!""}">申请退货</a></td>
					        		<#else>
					        			   <td></td>
					        		</#if>
					        	</tr>
				        	</#list>
				        </table>
					<#else>
						<div class="text-right" style="margin-right:45px;font-size:14px;">剩余额度:&nbsp;<span class="money" style="font-size:14px;">${balance!""}</span><a href="${loginUrl}" target="_blank" class="btn blue btn-primary" style="color:	White;margin-left:10px;">进入国商</a></div>
						<br/>
						<h4 class="text-center">暂无记录</h4>
					</#if>
	</#if>
</div>
</@layout>
<#macro script>
	requirejs(['gs'])
</#macro>

