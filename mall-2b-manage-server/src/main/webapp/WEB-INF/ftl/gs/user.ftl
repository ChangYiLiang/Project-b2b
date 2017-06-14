<#include "../layout.ftl">

<#macro scripts>
</#macro>

<@layout title="国商用户">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户ID">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="examineTable" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="电商ID" data-prop="buserid" data-default="1" />
			<th data-title="国商ID" data-prop="userId" />
			<th data-title="剩余额度" data-prop="balance" />
			<th data-title="联系电话" data-prop="phone" />
        	<th data-title="注册时间" data-prop="createTime" />
		</tr>
	</table>
</@layout>