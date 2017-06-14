<#include "../layout.ftl">

<#macro scripts>
</#macro>

<@layout title="页面设置 - 新增">
<form action="create.do" class="form-horizontal" method="POST" data-validate="true">
	<div class="form-group">
		<label for="name" class="col-md-2 control-label">页面区域代号</label>
		<div class="col-md-4">
			<input type="text" class="form-control" id="areaCode" name="areaCode" value="" required />
		</div>
	</div>
	
	<div class="form-group">
		<label for="sortNo" class="col-md-2 control-label">页面区域名称</label>
		<div class="col-md-4">
			<input type="text" class="form-control" id="areaName" name="areaName" required />
		</div>
	</div>
	
	<div class="form-group">
		<label for="remark" class="col-md-2 control-label">备注</label>
		<div class="col-md-8">
			<textarea name="remark" id="remark" class="form-control"></textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label for="remark" class="col-md-2 control-label">HTML内容</label>
		<div class="col-md-8">
			<textarea name="content" id="content" class="form-control" rows="20"></textarea>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-offset-2 col-md-4">
			<input type="submit" value="保存" class="btn btn-primary" />
		</div>
	</div>
</form>

</@layout>