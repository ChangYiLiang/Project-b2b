<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
</#macro>

<#macro scripts>
	<script src="${BasePath}/scripts/custom/mybusi.js"></script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>我的业务</strong>
	</div>
	<div class="widget-content">
		<#include "serverrenewform.ftl" >				
	</div> <!-- /widget-content -->
	
</@layout>