<#include "../layout.ftl">

<#macro script>
<#if message??>
alert('${message}');
</#if>
</#macro>

<@layout title="页面设置 - 修改">
<form action="edit.do" class="form-horizontal" method="POST" data-validate="true">
	<input type="hidden" name="id" value="${(website.id)!''}" />
	<div class="form-group">
		<label for="name" class="col-md-2 control-label">页面区域代号</label>
		<div class="col-md-4">
			<input type="text" class="form-control" id="areaCode" name="areaCode" value="${(website.areaCode)!''}" required />
		</div>
	</div>
	
	<div class="form-group">
		<label for="sortNo" class="col-md-2 control-label">页面区域名称</label>
		<div class="col-md-4">
			<input type="text" class="form-control" id="areaName" name="areaName" value="${(website.areaName)!''}" required />
		</div>
	</div>
	
	<div class="form-group">
		<label for="remark" class="col-md-2 control-label">备注</label>
		<div class="col-md-8">
			<textarea name="remark" id="remark" class="form-control">${(website.remark)!''}</textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label for="remark" class="col-md-2 control-label">HTML内容</label>
		<div class="col-md-8">
			<textarea name="content" id="content" class="form-control" rows="20">${(website.content?html)!''}</textarea>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-offset-2 col-md-4">
			<input type="submit" value="保存" class="btn btn-primary" />
			<a href="list.do" class="btn btn-default">返回</a>
		</div>
	</div>
</form>
</@layout>