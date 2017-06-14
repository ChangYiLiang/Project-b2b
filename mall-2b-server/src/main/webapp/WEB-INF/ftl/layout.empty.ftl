
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
		<#nested>
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