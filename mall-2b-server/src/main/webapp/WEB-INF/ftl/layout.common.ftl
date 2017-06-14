
<#macro layout>
<!DOCTYPE html>

<html>
	<head>
		<title>九河网_数据中心全产业链电商平台</title>
		<#include '_inc_head.ftl'>
	    
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
    	<#if header?? && header?is_macro>
	    <@header />
	    </#if>
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
					<!--
					<li><a href="${BasePath}">首页</a></li>
					-->
				</ul>
			</div>
			<#nested>
		</div>
		<div class="clearfix"></div>
		<br />
		<div id="footer" class="text-center">
			<#include "./2buser/userfooter.ftl">
		</div>
	</div>
	
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