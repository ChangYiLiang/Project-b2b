<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/tags.js"></script>
</#macro>

<@layout title="标签分类">
	<#--
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	-->
	<div class="text-right">
		<a href="create_category.do" data-modal="true" class="btn blue">新增</a>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="category.do" data-table-pagination="false">
		<tr class="columns" style="display: none">
			<th data-title="序号" data-prop="sortNo" data-default="1" />
			<th data-title="名称" data-prop="name" />
			<th data-title="创建人" data-prop="createUserId" />
			<th data-title="创建时间" data-prop="createTime" />
			<th data-title="备注" data-prop="remark" />
			<th data-title="操作" data-template="true" data-width="200px">
				<a href="edit_category.do?id={{id}}" data-modal="true">修改</a> 
				<a href="category_tags.do?id={{id}}" data-modal="true">Tags</a>
				<a onclick="return MyApp.Tags.Category.del(this)" href="del_category.do?id={{id}}">删除</a>
			</th>
		</tr>				
	</table>
</@layout>