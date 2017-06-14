<#include "../layout.ftl">

<#macro scripts>

</#macro>

<@layout title="SEO优化">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<select name="orderby" id="orderby" class="form-control">
					<option value="">--- 排序 ---</option>
					<option value="0">URL</option>
					<option value="1">标题</option>
				</select>
			</div>
			<!--
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
			</div>
			-->
		  	<button type="submit" class="btn btn-primary">刷新</button>
		  	<a href="create.do" class="btn btn-primary blue" data-modal="true">添加</a>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="list.do" data-table-search-form="#searchForm" data-table-pagination="false">
		<thead>
		<tr>
			<th colspan="4">基础信息</th>
			<th colspan="4">SEO</th>
		</tr>
		<tr class="columns">
			<th data-title="URL" data-prop="url" />
			<th data-title="名称">
				<a href="edit.do?id={{id}}" data-modal="true"><i class="fa fa-edit"></i>{{name}}</a>
			</th>
			<th data-title="分类">
				{{ category == "route" ? "路由规则" : "" }}
				{{ category == "url" ? "URL" : "" }}
				{{ category == "page" ? "URL" : "" }}
			</th>
			<th data-title="更新时间" data-prop="modifyTime" />
			<th data-title="标题" data-prop="title" />
			<th data-title="关键字" data-prop="keyword" />
			<th data-title="描述" data-prop="description" />
			<th data-title="操作" data-width="60px">
				
			</th>
		</tr>
		</thead>
	</table>
</@layout>