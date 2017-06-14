<#include "../layout.ftl">

<#macro scripts>
</#macro>

<@layout title="众签用户">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户ID">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="examineTable" data-table-ajax-source="userList.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="用户编号" data-prop="userCode" data-default="1" />
			<th data-title="用户名称" data-prop="userName" />
			<th data-title="联系电话" data-prop="telephoneNum" />
			<th data-title="地址" data-prop="address" />
        	<th data-title="创建时间" data-prop="createTime" />
		</tr>
	</table>
</@layout>