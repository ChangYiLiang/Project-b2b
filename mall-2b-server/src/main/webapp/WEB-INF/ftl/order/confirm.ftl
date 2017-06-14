
<!DOCTYPE html>
<html lang="zh-CN">
<head>
		<#include "../keyword.ftl">
		<#include '../_inc_head.ftl'>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
		<#include "../2buser/userheader.ftl">
		<link rel="stylesheet" href="${BasePath}/css/confirm.css" />
</head>
<br/>
<body class="bg-white">
	<div class="big-confirm">
		<input id="order" type="hidden" value=""/>
		<input id="flag-addr" type="hidden" value="${flag!0}"/>
		<h3>填写并核对订单信息</h3>
		<hr/>
		<#if flag gt 0>
			<p class="man">收货人信息</p>
			<ul class="addr-list">
				<#list list as ls>
					<#if ls.isMain = true>
						<li>
							<input onclick="MyApp.address.setMainAddress({id:${ls.id}})" class="checkBox" name="checkBox" type="checkbox" checked value="${ls.id!''}"/>
							<span id="baba" class="man-info">${ls.consigneeName!""}   ${(ls.regionStructure)!""} ${ls.streetAddress!""}  ${ls.mobile!""}</span>
							<a class="del-a pull-right" href="javascript:void(0);" onclick="MyApp.address.deleteAddress({id:${ls.id}})">删除</a>
						</li>
					<#else>
						<li class="Cha">
							<input onclick="MyApp.address.setMainAddress({id:${ls.id}})" class="checkBox" name="checkBox" type="checkbox" value="${ls.id!''}"/>
							<span class="man-info">${ls.consigneeName!""}   ${(ls.regionStructure)!""} ${ls.streetAddress!""}  ${ls.mobile!""}</span>
							<a class="del-a pull-right" href="javascript:void(0);" onclick="MyApp.address.deleteAddress({id:${ls.id}})">删除</a>
							<a class="del-a pull-right" href="javascript:;" onclick="MyApp.address.setMainAddress({id:${ls.id}})">设为默认地址</a>
						</li>
					</#if>
				</#list>
			</ul>
			<a class="add-addr" data-toggle="modal" data-target="#myModal">+添加收货人信息</a>
		</#if>
		<br/>
		<br/>
		<hr/>
		<p class="man">确认订单信息</p>
		<table class="table table-bordered">
			<thead>
				<tr role="row" class="heading">			
					<th width="50%" style="text-align:left;padding-left:35px">
						商品
					</th>
					<th width="10%">
						 单价
					</th>
					<th width="12%">
						数量
					</th>
					<th width="10%">
						 小计
					</th>
				</tr>
			</thead>
			<tbody>
				<#list cartList as cart>
					<tr class="bodying">
						<td>
							<img class="img" src="${cart.img!''}">
							<span>${cart.goodsName!""}</span>
						</td>
						<td>${cart.price}</td>
						<td>${cart.goodnum}</td>
						<td>${cart.allprice}</td>
					</tr>
					<tr class="bodying2">
						<td>
							<!--
							<span>发票信息：</span>
							<br/>
							<span id="fpty">普通发票(电子)</span>
		  					<span id="who">个人</span>
		  					<span id="mx1">明细</span>
		  					<a href="javascript:;" onclick="opendialog()">修改</a>
		  					<br/>
		  					<span>备注：</span>
		  				  	<input id="remark" name="remark"/>
		  				  	-->
						</td>
						<td colspan="2">
							运送方式：普通配送快递 
						</td>
						<td>${cart.expressfee!'0'}</td>
					</tr>
					<tr class="bodying3">
						<td colspan="4">
							<span class="pull-right">合计（含运费）：<span style="color:#1B9D97;font-weight:bold">${(cart.allprice?number)+(cart.expressfee?number)}</span></span>
						</td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
				</#list>
			</tbody>
		</table>
		<div class="foot-confirm" style="height:100px">
			<div class="pull-left GG">
				<span>发票信息：</span>
				<br/>
				<span id="fpty">普通发票(电子)</span>
				<span id="who">个人</span>
				<span id="mx1">明细</span>
				<a href="javascript:;" onclick="opendialog()">修改</a>
				<br/>
				<span>备注：</span>
			  	<input id="remark" name="remark"/>
		  	</div>
		  	<#if flag gt 0>
				<span class="pull-right">寄送至：<span id="kof"></span></span>
				<br/>
				<br/>
				<span style="margin-left:300px" class="pull-right">应付总额：<span id="willpay">${Allprice}</span></span>
			<#else>
				<br/>
				<br/>
				<span style="left:-23px" class="pull-right">应付总额：<span id="willpay">${Allprice}</span></span>
			</#if>
		<div>
		<div class="btn-sub">
			<button  type="button" onclick="paysubmit()" class="btn btn-primary btn22 pull-right">提交订单</button>
		</div>
	</div>
	
	<script>
		requirejs(["jquery"],function(){
			$("#kof").ready(function(){
				var cha = $("#baba").text();
				$("#kof").text(cha);
			})
		});
		requirejs(['cartaddress']);
	</script>

	<#include "../fapiao.ftl">
	
	<#include "../address.ftl">
	
</body>
</html>