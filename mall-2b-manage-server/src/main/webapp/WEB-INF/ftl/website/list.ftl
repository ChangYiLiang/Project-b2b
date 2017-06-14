<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/tags.js"></script>
</#macro>

<@layout title="页面设置">
	<!--
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<select name="type" id="type" class="form-control">
					<option value="1">关键字</option>
					<option value="0">Tag</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		  	
		  	<a href="create_tag.do" data-modal="true" class="btn blue">新增</a>
		</form>
	</div>
	-->
	<div class="text-right">
		<a href="create.do" class="btn blue">新增</a>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="list.do" data-table-pagination="false">
		<tr class="columns" style="display: none">
			<th data-title="区域代号" data-prop="areaCode" />
			<th data-title="区域名称" data-prop="areaName"/>
			<th data-title="说明"  data-prop="remark"/>
			<th data-title="更新人" data-prop="updateUsername" />
			<th data-title="更新时间" data-prop="updateTime" />
			<th data-title="操作" data-width="200px">
				<a href="edit.do?id={{id}}">修改</a>
			</th>
		</tr>
	</table>
</@layout>