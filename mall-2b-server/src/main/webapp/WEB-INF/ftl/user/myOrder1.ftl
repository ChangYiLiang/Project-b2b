<#include '../layout.ftl'>
<#macro myheader>
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/css/plugins1.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/plugins/font-awesome/css/font-awesome.css" />	
<link rel="stylesheet" type="text/css"
	href="${IncPath}/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
<style>
.dataTables_info {position:relative;top:-32px !important}
body { 
  padding: 70px !important;
}
</style>

</#macro>

<#macro scripts>
<!-- END CORE PLUGINS -->
<!-- BEGIN GENERAL PLUGINS -->
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<!-- END GENERAL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/plugins/data-tables/jquery.dataTables.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${BasePath}/scripts/custom/order.js"></script>
<script>
	jQuery(document).ready(function() {       
		  App.init();
		   Cl.initModal();
		   OrderHelper.type2 = ${type2map ! '{}'}
		   OrderHelper.state = ${statemap ! '{}'}
		   OrderDt.init();
	});
</script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>我的订单</strong>
	</div>
	<table class="table table-striped table-bordered table-hover" id="datatable_cl">
							<thead>
								<tr role="row" class="heading">
									
								</tr>
							</thead>
							<tbody>
							</tbody>
					</table>
</@layout>