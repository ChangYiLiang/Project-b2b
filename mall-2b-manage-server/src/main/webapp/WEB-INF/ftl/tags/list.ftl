<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/tags.js"></script>
</#macro>

<@layout title="标签/关键字列表">
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
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="序号" data-prop="sortNo" data-default="1" />
			<th data-title="名称" data-prop="name"/>
			<th data-title="类型" data-template="true">
			{{ type == 0 ? "Tag" : "关键字" }}
			</th>
			<th data-title="创建人" data-prop="createUserId" />
			<th data-title="创建时间" data-prop="createTime" />
			<th data-title="备注" data-prop="remark" />
			<th data-title="操作" data-width="200px"> <#--默认:  data-template="true"-->
				<a href="edit_tag.do?id={{id}}" data-modal="true">修改</a>
				<a href="mappings.do?id={{id}}">商品映射</a>
				<a onclick="return MyApp.Tags.Tag.del(this)" href="del_tag.do?id={{id}}">删除</a>
			</th>
		</tr>
	</table>
</@layout>