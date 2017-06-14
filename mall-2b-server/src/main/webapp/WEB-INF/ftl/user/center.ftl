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
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/data-tables/jquery.dataTables.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/DT_bootstrap.js"></script>
<script src="${BasePath}/scripts/custom/laydate.js"></script>
<script src="${BasePath}/scripts/custom/order.js"></script>
<script src="${BasePath}/scripts/custom/mybusi1.js"></script>
<script>
	jQuery(document).ready(function() {       
	   // initiate layout and plugins
	   App.init();
	   Cl.initModal();
	   PaymentHelper.busitype = ${busitype ! '{}'}
	   PaymentHelper.busistate = ${busistate ! '{}'}
	   DataTableBusi.init();
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
	<div class="alert alert-info">
		<strong>我的业务</strong>
	</div>
					<table class="table table-striped table-bordered table-hover" id="mybusi_form">
						<thead>
						<tr role="row" class="heading">
							
						</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
	
		
</@layout>