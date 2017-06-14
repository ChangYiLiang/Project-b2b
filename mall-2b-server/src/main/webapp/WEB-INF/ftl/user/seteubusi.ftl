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
<script src="${IncPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<!-- END GENERAL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/plugins/data-tables/jquery.dataTables.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${BasePath}/scripts/custom/enduser.js"></script>
<script>
	jQuery(document).ready(function() {       
		  	App.init();
		   Cl.initModal();
		   EndUserSetBusiDt.init();
	});
</script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>终端用户所属业务</strong>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
					<label class="control-label col-md-5">编号</label>
					<div class="controls">
						<input class="form-control-static" id="userId" value="${(user1.id)!''}" type="hidden" />
						<p class="form-control-static" style="position: relative;top: -5px;">${(user1.id)!""}</p>
					</div>
		</div>
		<div class="form-group col-md-5">
					<label class="control-label col-md-5">名称</label>
					<div class="controls">
						<p class="form-control-static" style="position: relative;top: -5px;">${(user1.username)!""}</p>
					</div>
		</div>
		<a class="btn btn-primary" href="javascript:EndUserSetBusiDt.setListBusi()">分配用户业务</a>
	</div>
	<div class="alert alert-info">
		<strong>未分配业务</strong>
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