<#include "../layout.ftl">

<#macro scripts>

</#macro>
<@layout title="关注列表">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户id">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="concernTable" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="编号" data-prop="id" data-default="1" />
			<th data-title="关注用户" data-prop="userId" />
			<th data-title="商品名称" data-prop="goods.goodsName" />
			<th data-title="商品价格" data-prop="price" />
			</th>
        	<th data-title="期望价格" data-prop="expectPrice" />
			<th data-title="关注时间" data-prop="createTime" />
		</tr>
	</table>
   
</@layout>