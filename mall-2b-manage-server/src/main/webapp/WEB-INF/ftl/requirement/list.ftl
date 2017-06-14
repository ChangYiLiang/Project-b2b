<#include "../layout.ftl">

<#macro scripts>

</#macro>

<@layout title="客户采购需求">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<select name="type" id="type" class="form-control">
					<option value="">--- 需求类型 ---</option>
					<option value="0">产品类</option>
					<option value="1">方案类</option>
					<option value="2">其他</option>
				</select>
			</div>
			<div class="form-group">
				<select name="state" id="state" class="form-control">
					<option value="">--- 状态 ---</option>
					<option value="0">未处理</option>
					<!-- 
					<option value="1">处理中</option>
					-->
					<option value="2">已报价</option>
					<option value="3">已采纳</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="需求单号" data-prop="id" data-default="1" />
			<th data-title="公司" data-prop="company" />
			<!--
			<th data-title="类型">
			{{ type == 0 ? "产品类" : "" }}
			{{ type == 1 ? "方案类" : "" }}
			{{ type == 2 ? "其他" : "" }}
			</th>
			-->
			<th data-title="联系人" data-prop="contact" />
			<th data-title="联系电话" data-prop="phone" />
			<!--
			<th data-title="QQ" data-prop="qq" />
			-->
			<th data-title="状态">
			{{ state == 0 ? "未处理" : "" }}
			{{ state == 1 ? "处理中" : "" }}
			{{ state == 2 ? "已报价" : "" }}
			{{ state == 3 ? "已采纳" : "" }}
			</th>
			<th data-title="提交时间" data-prop="createTime" />
			<th data-title="操作" data-width="200px">
				<a href="details.do?id={{id}}">查看</a>
			</th>
		</tr>
	</table>
</@layout>