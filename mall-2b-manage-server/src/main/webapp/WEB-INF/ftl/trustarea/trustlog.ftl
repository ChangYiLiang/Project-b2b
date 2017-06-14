<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/trustlogtables.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   //App.init();
		   //Cl.initModal();
		   UnpaymentDt.init();
		});
	</script>
</#macro>

<@layout title="托管记录列表">
	<div class="portlet-body">
		<div class="table-container">
			<table class="table table-striped table-bordered table-hover" id="datatable_cl">
				<thead>
				<tr role="row" class="heading">
					
				</tr>
				</thead>
			</table>
		</div>
	</div>
</@layout>