<#include "../layout.ftl">

<#macro scripts>
</#macro>

<@layout title="赊账订单">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" id="orderid" name="orderid" placeholder="订单ID">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户ID">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="examineTable" data-table-ajax-source="orderList.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="订单ID" data-prop="orderid" data-default="1" />
			<th data-title="用户ID" data-prop="userId" />
			<th data-title="订单金额" data-prop="amount" />
			<th data-title="下单时间" data-prop="orderTime" />
        	<th data-title="约定还款时间" data-prop="returnMoney" />
        	<th data-title="放款时间" data-prop="getmoneytime" />
        	<th data-title="还款时间" data-prop="tomoney" />
        	<th data-title="状态">
			{{ status == 1 ? "已下单" : "" }}
			{{ status == 2 ? "已放款" : "" }}
			{{ status == 3 ? "已还款" : "" }}
			{{ status == 4 ? "已取消" : "" }}
			{{ status == 5 ? "已退货" : "" }}
			</th>
		</tr>
	</table>
</@layout>