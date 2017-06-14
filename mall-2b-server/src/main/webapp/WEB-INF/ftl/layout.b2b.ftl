<#-- 头部 -->
<#macro defaultHeader>

</#macro>

<#-- 页脚 -->
<#macro defaultFooter>


</#macro>

<#-- 侧边栏 -->
<#macro defaultLeft>
	
</#macro>
<#assign active=''>
<#macro set_active name=''>${(active?string == name)?string(' class="active" ', '')}</#macro>
<#macro layout header=defaultHeader, footer=defaultFooter, left=defaultLeft>

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<#include "keyword.ftl" >
		<#include '_inc_head.ftl'>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
    	<@header />
	</head>
<body>
	<div class="container-fluid">
		<div id="header">
			<div class="container" style="width:100%">
				<#include "./2buser/userheader.ftl">
			</div>
		</div>
		<div id="body" class="container">
			<div class="row">
				<ul class="breadcrumb">
					<li><a href="${BasePath}/controller/toUserCenter.do">首页</a></li>
					<#if breadcrumb?? && breadcrumb?is_macro>
    					<@breadcrumb/>
    				<#else>
						<li>个人中心</li>
    				</#if>
				</ul>
			</div>
			<div class="jh-usercenter">
			<div class="sidebar">
				<ul class="nav nav-pills nav-stacked col-md-offset-1 nav-offset">
					<li <@set_active '' />><a href="${BasePath}/controller/toUserCenter.do">会员首页</a></li>
				</ul>
				<h4>订单中心</h4>
				<ul class="nav nav-pills nav-stacked col-md-offset-1 nav-offset-body">
					<li <@set_active 'o1' />><a href="${BasePath}/controller/order/tomyorder.do">我的订单</a></li>
					<li <@set_active 'o2' />><a href="${BasePath}/purchase/requirement.do">采购报价</a></li>
					<li <@set_active 'o3' />><a href="${BasePath}/concern/list.do">我的关注</a></li>
					<li <@set_active 'o4' />><a href="${BasePath}/controller/user/subscribe.do">我的订阅</a></li>
					<li <@set_active 'o5' />><a href="${BasePath}/controller/comment/uncommentlist.do">评价晒单 (<span class="green">${unCommentCount!0}</span>)</a></li>
					<li <@set_active 'o6' />><a href="${BasePath}/message/list.do">消息提醒 (<span class="green" id="noRead">${messageCount!0}</span>)</a></li>
					<!--
					<li <@set_active 'o7' />><a href="${BasePath}/mark/usermark.do">我的痕迹</a></li>
					-->
				</ul>
				<h4>个人资产</h4>
				<ul class="nav nav-pills nav-stacked col-md-offset-1 nav-offset-body">
					<li <@set_active 'b1' />><a href="${BasePath}/mark/usercharge.do">余额</a></li>
					<li <@set_active 'b6' />><a href="${BasePath}/gssy/list.do">河马赊账</a></li>
					<li <@set_active 'b2' />><a href="${BasePath}/mark/userfest.do">节操币</a></li>
					<li <@set_active 'b3' />><a href="${BasePath}/mark/userbonus.do">节操券</a></li>
					<li <@set_active 'b4' />><a href="${BasePath}/controller/user/invoicelist.do">发票记录</a></li>
					<li <@set_active 'b5' />><a href="${BasePath}/mark/usergroom.do">推荐返利</a></li>
				</ul>
				<h4>售后服务</h4>
				<ul class="nav nav-pills nav-stacked col-md-offset-1 nav-offset-body">
					<li <@set_active 's1' />><a href="${BasePath}/afs/repair.do">返修/换货</a></li>
					<li <@set_active 's2' />><a href="${BasePath}/mark/bespoke.do">预约上门</a></li>
					<li <@set_active 's3' />><a href="${BasePath}/mark/suggest.do">投诉建议</a></li>
				</ul>
				<h4>账户设置</h4>
				<ul class="nav nav-pills nav-stacked col-md-offset-1 nav-offset-body">
					<li <@set_active 'u1' />><a href="${BasePath}/controller/user/tomydata.do">个人信息</a></li>
					<li <@set_active 'u2' />><a href="${BasePath}/controller/user/oauth.do">帐号绑定</a></li>
					<li <@set_active 'u3' />><a href="${BasePath}/controller/user/security.do">安全设置</a></li>
					<li <@set_active 'u4' />><a href="${BasePath}/authentication/show.do">企业认证</a></li>
					<li <@set_active 'u5' />><a href="${BasePath}/controller/user/invoicequalified.do">增票资质</a></li>
					<li style="margin-bottom:50px" <@set_active 'u6' />><a href="${BasePath}/address/myaddress.do">收货地址</a></li>
				</ul>
			</div>
			
			<div class="content jh-content">
				<#nested>
			</div>
			<div class="clearfix"></div>
			</div>
		</div>
		<br/>
		<br/>
		<div id="footer" class="text-center">
			<#include "./2buser/userfooter.ftl">
		</div>
	</div>
    <@footer/>
    
    <#if footer?? && footer?is_macro>
    <@footer />
    </#if>
    <#if scripts?? && scripts?is_macro>
    <@scripts/>
    </#if>
    <#if script?? && script?is_macro>
    <script><@script/></script>
    </#if>
  </body>
</html>
</#macro>