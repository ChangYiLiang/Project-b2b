<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
	<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/css/plugins1.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/plugins/font-awesome/css/font-awesome.css" />	
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/css/style.css" rel="stylesheet" type="text/css" />
<style>
.dataTables_info {position:relative;top:-32px !important}
body { 
  padding: 70px !important;
}
</style>
</#macro>

<#macro scripts>

	<script src="${IncPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
	<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
	<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
	<!-- END GENERAL PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="${IncPath}/assets/plugins/data-tables/jquery.dataTables.js"></script>
	<script src="${IncPath}/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<script src="${BasePath}/scripts/custom/mybusi.js"></script>
	<script>
	jQuery(document).ready(function() {       
		PaymentHelper.busitype = ${busitype ! '{}'}
		PaymentHelper.busistate = ${busistate ! '{}'}
		DataTableBusi2.init();
	});
</script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>企业业务</strong>
	</div>
	<div class="widget-content">
				<form class="form-inline" id="searchForm">
					<div class="form-group">
							<input type="text" class="form-control" name="mainIp" placeholder="主IP">
					</div>
					<div class="form-group">
							<input type="text" class="form-control" name="code" placeholder="服务器代码">
					</div>
					<div class="form-group">
							<input type="text" class="form-control" name="keyword" placeholder="关键字">
					</div>
					<div class="form-group">
					<select name="state" class="form-control" onchange="DataTableBusi2.searchState_change()">
					<option value="">--业务状态--</option>
						<#list stateMap?keys as key>
						<option value="${key}">${stateMap[key]}</option>
						</#list>
					</select>
					<button type="button" id="search" class="btn btn-default" onclick="DataTableBusi2.search_click()">查询</button>
					</div>
				</form>
					<a class="btn btn-primary" href="javascript:DataTableBusi2.addListCart()">批量加入购物车</a>
					<table class="table table-striped table-bordered table-hover" id="merchantbusi_form">
						<thead>
						<tr role="row" class="heading">
							
						</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
	</div> <!-- /widget-content -->
	
</@layout>