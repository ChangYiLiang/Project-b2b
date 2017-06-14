<#include "../layout.b2b.ftl">
<#assign active='s1'>
<#macro breadcrumb>
<li>个人中心</li>
<li>返修/换货</li>
</#macro>
<@layout>
	<h2>返修/退换货记录</h2>
	<div id="afs-record" class="jh-body">
		<#list aftersales as afs>
		<table class="jh-table">
			<tr class="jh-table-header">
				<td colspan="4">
					<div class="pull-left">${afs.createTime?string('yyyy-MM-dd HH:mm:ss')} <span class="split">|</span> 退款编号：${afs.afsNo}</div>
					<div class="pull-right">订单金额: <span class="price">${(orders[afs.orderId?string].amount)!''}</span>元</div>
				</td>
			</tr>
			<tr class="text-center">
				<td>
					<@include path="/widget/ordergoods.do?orderId=${afs.orderId}" />
				</td>
				<td class="w-fixed">
					<span style="color: red">
						${(types[afs.type?string])!''}
					</span>
				</td>
				<td class="w-fixed">
					<span style="color:#83C44E">
						${(states[afs.state?string])!''}
					</span>
				</td>
				<td class="w-fixed">
					<a href="servicedetails.do?id=${afs.id}">服务详情</a><br />
					<a href="javascript:;" onclick="ysf.open();"><img src="${BasePath}/images/concatme.png" alt="" /></a>
				</td>
			</tr>
		</table>
		</#list>
		<div class="text-right">
		<#include '../_widget.ftl'>
		<@pagination url='${BasePath}/afs/repair.do?pageNo={pageNo}' searchModel=searchModel />
		</div>
	</div>
</@layout>