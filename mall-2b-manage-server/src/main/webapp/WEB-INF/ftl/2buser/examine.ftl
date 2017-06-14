<#include "../layout.ftl">

<#macro scripts>
</#macro>
<@layout title="企业审核">
<style>
	.opendialog{width:800px !important;}
</style>
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<select name="status" id="status" class="form-control">
					<option value="">--- 审核状态 ---</option>
					<option value="0">待审核</option>
					<option value="1">审核通过</option>
					<option value="2">审核失败</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户ID">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="examineTable" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="编号" data-prop="id" data-default="1" />
			<th data-title="用户" data-prop="userId" />
			<th data-title="企业全称" data-prop="name" />
			<th data-title="注册地址" data-prop="regAddress" />
        	<th data-title="法人姓名" data-prop="bossName" />
			<th data-title="身份证号" data-prop="idCard" />
			<th data-title="手机号码" data-prop="phone" />
			<th data-title="审核状态">
			{{ status == 0 ? "待审核" : "" }}
			{{ status == 1 ? "审核通过" : "" }}
			{{ status == 2 ? "审核失败" : "" }}
			</th>
			<th data-title="操作" data-width="100px">
				<a href="info.do?id={{id}}" data-modal="true" >查看详情</a>
			</th>
		</tr>
	</table>
</@layout>