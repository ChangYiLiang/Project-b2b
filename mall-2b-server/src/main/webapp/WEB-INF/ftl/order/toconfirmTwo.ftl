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
		<form action="addorderTwo.do" method="post" id="form_cl" autocomplete="off">
			<!--公共字段-->
			<input type="hidden" name="number" id="number" value="${number}">
		
			<!--硬件商品所需字段-->
			<input type="hidden" name="goodsId" id="goodsId" value="${goodsId}">
			<input type="hidden" name="config" value="${config}">
			<input type="hidden" name="idlink" id="id" value="${idlink}">
        	<input type="hidden" name="trustarea" id="trustarea" value="${trustarea}">
        	<input type="hidden" name="gssy" id="gssy" value="${gssy}">
        	<input type="hidden" name="centerid" id="centerid" value="${centerid}">
        	
        	<!--IDC商品所需字段-->
        	<input type="hidden" name="orderCycle" id="orderCycle" value="${orderCycle}">
        	<input type="hidden" name="ipnum" id="ipnum" value="${ipnum}">
			<input type="hidden" name="ipflag" id="ipflag" value="${ipflag}">
        	<input type="hidden" name="configIdc" id="config" value="">
        	<input type="hidden" name="idlinkidc" id="idlink" value="">
        	<input type="hidden" name="goodsIdIdc" id="goodsIdIdc" value="${goodsIdc.id}">
        	<input type="hidden" name="price" id="price" value="${goodsIdc.goodsPrice?default(0)}">
        	
        	<!--发票所需要字段-->
        	<input type="hidden" name="header" id="header" value="个人">
        	<input type="hidden" name="content" id="content" value="明细">
        	<input type="hidden" name="remark" id="remark" value="">
        	<input type="hidden" name="zzId" id="zzId" value="0">
        	
			<h3>填写并核对订单信息</h3>
			<hr/>
			<#if goods.ifIdc>
				<input type="hidden" name="flag-addr" id="flag-addr" value="1">
				<p class="man">收货人信息</p>
				<ul class="addr-list">
					<#list list as ls>
						<#if ls.isMain = true>
							<li>
								<input onclick="MyApp.address.setMainAddress({id:${ls.id}})" class="checkBox" name="checkBox" type="checkbox" checked value="${ls.id!''}"/>
								<span id="baba" class="man-info">${ls.consigneeName!""}   ${(ls.regionStructure)!""}${ls.streetAddress!""}  ${ls.mobile!""}</span>
								<a class="del-a pull-right" href="javascript:void(0);" onclick="MyApp.address.deleteAddress({id:${ls.id}})">删除</a>
							</li>
						<#else>
							<li class="Cha">
								<input onclick="MyApp.address.setMainAddress({id:${ls.id}})" class="checkBox" name="checkBox" type="checkbox" value="${ls.id!''}"/>
								<span class="man-info">${ls.consigneeName!""}   ${(ls.regionStructure)!""}${ls.streetAddress!""}  ${ls.mobile!""}</span>
								<a class="del-a pull-right" href="javascript:void(0);" onclick="MyApp.address.deleteAddress({id:${ls.id}})">删除</a>
								<a class="del-a pull-right" href="javascript:;" onclick="MyApp.address.setMainAddress({id:${ls.id}})">设为默认地址</a>
							</li>
						</#if>
					</#list>
				</ul>
				<a class="add-addr" data-toggle="modal" data-target="#myModal">+添加收货人信息</a>
				<hr style="margin-top:15px"/>
				<p class="man">机房收货信息</p>
				<span class="man-info">${tru.truname!""}</span>
				
			<#else>
				<input class="checkBox" name="checkBox" type="hidden" value="0"/>
				<input type="hidden" name="flag-addr" id="flag-addr" value="0">
			</#if>
		</form>
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
				<tr class="bodying">
					<td>
						<img class="img" src="${goods.goodsImg!''}">
						<span>${goods.goodsName!""}</span>
					</td>
					<td>${pay?number/number?number}</td>
					<td>${number!"1"}</td>
					<td>${pay!'0'}</td>
				</tr>
				<tr class="bodying2">
					<td>
	
					</td>
					<td colspan="2">
						运送方式：普通配送快递
					</td>
					<td>${expressfee!'0'}</td>
				</tr>
				<tr class="bodying3">
					<td colspan="4">
						<span class="pull-right">合计（含运费）：<span style="color:#1B9D97;font-weight:bold">${(pay?number)+(expressfee?number)}</span></span>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!--开始-->
		<#include "./idc.ftl">
		<!--结束-->
		
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
			  	<input id="remark2" name="remark2"/>
			</div>
			<span id="youku" style="display:none">${(pay?number)+(expressfee?number)}</span>
			<#if goods.ifIdc>
				<span class="pull-right">寄送至：<span id="kof"></span></span>
				<br/>
				<br/>
				<span style="left:452px" class="pull-right bibi2">应付总额：<span id="willpay">${(pay?number)+(expressfee?number)}</span></span>
			<#else>
				<br/>
				<br/>
				<span style="left:-23px" class="pull-right bibi2">应付总额：<span id="willpay">${(pay?number)+(expressfee?number)}</span></span>
			</#if>
		<div>
		<div class="btn-sub">
			<button  type="button" onclick="gopaysubmit()" class="btn btn-primary btn22 pull-right">提交订单</button>
		</div>
	</div>
	
	<script>
		requirejs(["jquery"],function(){
			$("#kof").ready(function(){
				var cha = $("#baba").text();
				$("#kof").text(cha);
			})
		});
		requirejs(['rightnowaddress']);
	</script>
	
	<#include "../fapiaoCha.ftl">
	<#include "../address.ftl">	
	
</body>	
</html>