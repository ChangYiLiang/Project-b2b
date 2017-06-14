<#include "../layout.b2b.ftl">
<#assign active='o2'>

<#macro scripts>
<#if message??>
<script type="text/html" id="alertMessage">
<div>${message}</div>
</script>
<script>
	requirejs(['layerEx'], function() { $("#alertMessage").alert(); });
</script>
</#if>
</#macro>
<#macro breadcrumb>
<li>个人中心</li>
<li>采购报价</li>
</#macro>

<@layout>
<link rel="stylesheet" href="${BasePath}/css/file-icon.css" />
<h2 class="bg-white">采购报价</h2>
<div class="bg-white other-body" style="min-height: 400px">
	<div style="margin:10px 20px">
		<ul class="nav nav-pills nav-other" role="tablist">
			<li role="presentation" class="active"><a href="#requirement" role="tab" data-toggle="tab">提交采购需求</a></li>
			<li role="presentation"><a href="#record" role="tab" data-toggle="tab">采购报价记录</a></li>
		</ul>
		<hr />
		<div class="tab-content">
		  	<div role="tabpanel" class="tab-pane active" id="requirement">
		  		<#include 'requirement_panel.ftl'>
		  	</div>
		  	<div role="tabpanel" class="tab-pane" id="record">
		  		<table class="table table-bordered text-center">
		  			<tr>
		  				<td>采购需求编号</td>
		  				<td>提交时间</td>
		  				<td>联系人</td>
		  				<td>状态</td>
		  				<td>操作</td>
		  			</tr>
		  			<#if records??>
		  			<#list records as requirement>
		  			<tr>
		  				<td>${requirement.id}</td>
		  				<td>${requirement.createTime?datetime}</td>
		  				<td>${requirement.contact!''}</td>
		  				<td>${states[requirement.state?string]!''}</td>
		  				<td><a href="details.do?id=${requirement.id}">查看详情</a></td>
		  			</tr>
		  			</#list>
		  			</#if>
		  		</table>
		  		<p class="green">注: 仅支持查看最近30条报价咨询记录</p>
		  	</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
</@layout>
