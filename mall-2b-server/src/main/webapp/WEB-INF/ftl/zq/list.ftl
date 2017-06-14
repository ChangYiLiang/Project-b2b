<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>合同列表</title>
		<#include '../_inc_head.ftl'>
	</head>
	<body >
	<br>
	<br>
	<br>
	<br>
	<center>
		<a href="http://167t0w2528.51mypc.cn:38714/2b/zq/create.do"  class="btn blue btn-primary">签合同</a>	
		<br>
		<br>
		<table class="table table-bordered" style="width:860px;">
				        	<tr>
				        		<td>合同编号</td>
				        		<td>签署时间</td>
				        		<td>电商签了没</td>
				        		<td>合同生效</td>
				        		<td>操作</td>
				        	</tr>
				        	<#list list as contract>
					        	 <tr>
						        		<td>${contract.contractNum!""}</td>
						        		<td>${(contract.userTime?string("yyyy-MM-dd HH:mm:ss"))!''}</td>
						        		<#if contract.b2bState==0>
						        			<td>没签</td>
						        		<#else>
						        			<td>签了</td>
						        		</#if>
						        		
						        		<#if contract.contractStatus==0>
						        			<td>没生效</td>
						        		<#else>
						        			<td>已生效</td>
						        		</#if>
						        		<td>
						        			<a href="showView.do?contractNum=${contract.contractNum}" target="_blank" class="btn blue btn-primary">查看合同</a>	
						        			<a href="downContract.do?contractNum=${contract.contractNum}" target="_blank" class="btn blue btn-primary">下载合同</a>	
						        		</td>
					        	</tr>
				        	</#list>
				        </table>
		</center>
	</body>
	<script>requirejs(['contractList','core'])</script>
</html>
