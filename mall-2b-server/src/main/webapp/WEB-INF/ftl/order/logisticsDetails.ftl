<style>
	.modal {
		width: 700px;
		height: 800px;
	}
</style>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">物流详情</h4>
</div>
<#if result = 1>
<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-6">
				<label class="control-label col-md-5">运单编号:</label>
				<div class="col-md-7">
					<span class="form-control-static">${LogisticCode!''}</span>
				</div>
			</div>
			<div class="col-md-6">
				<label class="control-label col-md-5">快递公司:</label>
				<div class="col-md-7">
					<span class="form-control-static">${expCompany!''}</span>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<label class="control-label col-md-3">物流状态:</label>
			<div class="col-md-7">
				<span class="form-control-static" style="color:red">${logisticStatus!''}</span>
			</div>
		</div>
		<div class="col-md-12">
		<label class="control-label col-md-2">物流跟踪:</label>
		<div class="col-md-10">
			<#if Logistics??>
				<#list Logistics as logMap>
					<#list logMap?keys as itemKey>
						 
						<#if itemKey = "AcceptTime">
							<#-- <label class="control-label col-md-3">时间:</label> -->
							&nbsp<span class="form-control-static">${logMap[itemKey]}</span>
						</#if>
						<br>
						<#if itemKey = "AcceptStation">
							<#-- <label class="control-label col-md-3">描述:</label> -->
							<span class="form-control-static">${logMap[itemKey]}</span>
						</#if>
						<br>
					</#list>
				</#list>
			</#if>
		</div>
		</div>
	</div>
</div>
<#else>
	<div class="modal-body">
	<div class="row">
		<br/>
		<span class="form-control-static" style="color:red; font-size:20px">查询结果异常</span>
	</div>
	</div>
</#if>




