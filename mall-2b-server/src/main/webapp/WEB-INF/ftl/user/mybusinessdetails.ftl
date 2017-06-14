<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
</#macro>

<#macro scripts>
	<script src="${BasePath}/scripts/custom/ex.js"></script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>我的业务</strong>
	</div>
	<div class="widget-content">
		<#if business.type = 0>
			<#include "mybusiserver.ftl" >				
		<#elseif business.type = 1>
		  	<#include "mybusidefense.ftl" >
		<#elseif business.type = 2>
		  	<#include "distributedform.ftl" >
		<#elseif business.type = 3>
		  	<#include "mybusitrusteeship.ftl" >
		<#else>
		  	<#include "mybusitrusteeship.ftl" >
		</#if>
	</div> <!-- /widget-content -->
	
</@layout>