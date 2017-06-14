<#include "../layout.ftl">

<#macro scripts>

</#macro>

<@layout title="售后服务">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<select name="type" id="type" class="form-control">
					<option value="">--- 售后类型 ---</option>
					<#list types?keys as k>
					<option value="${k}">${types[k]}</option>
					</#list>
				</select>
			</div>
			<div class="form-group">
				<select name="state" id="state" class="form-control" title="默认xxx状态">
					<option value="">--- 状态 ---</option>
					<#list states?keys as k>
					<option value="${k}">${states[k]}</option>
					</#list>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字" title="支持用户/订单编号/申请原因备注">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="申请单号" data-prop="afsNo" data-default="1" data-width="150" />
			<th data-title="申请用户" data-prop="username" />
			<th data-title="订单编号" data-prop="orderId" />
			<th data-title="商品" data-prop="goodsName" />
			<th data-title="原因" data-prop="reason" />
			<th data-title="类型">
			<#list types?keys as k>
			{{ type == ${k} ? "${types[k]}" : "" }}
			</#list>
			</th>
			<th data-title="状态">
			<#list states?keys as k>
			{{ state == ${k} ? "${states[k]}" : "" }}
			</#list>
			<th data-title="申请时间" data-prop="createTime" />
			<th data-title="最后处理时间" data-prop="lastProcessTime"/>
			<th data-title="操作" data-width="100px">
				<a href="details.do?id={{id}}">查看</a>
			</th>
		</tr>
	</table>
</@layout>