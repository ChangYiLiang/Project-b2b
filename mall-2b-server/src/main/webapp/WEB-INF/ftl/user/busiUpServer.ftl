<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
</#macro>

<#macro scripts>
<script src="${BasePath}/scripts/custom/Defense.js"></script>
<script src="${BasePath}/scripts/custom/upserver.js"></script>
</#macro>

<@layout header=myheader footer=scripts>

<form action="" id="upServer_c1" class="form-horizontal" method="post">
	<h4>订单信息</h4>
	<hr />
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订单编号 </label>
			<div class="controls">
				<p class="form-control-static">${(business.orderId)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">下单时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.stratDate?date)!'-'}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">开始时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.deliverDate?date)!}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">到期时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.endDate?date)!}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订购金额 </label>
			<div class="controls">
				<p class="form-control-static">${(business.orderAmount)!' '}</p>
			</div>
		</div>

		<div class="form-group col-md-5">
			<label class="control-label col-md-6">状态</label>
			<div class="controls">
				<p class="form-control-static"><@com.state business.state/></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">续费金额</label>
			<div class="controls">
				<p class="form-control-static">${(business.renewAmount)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订购周期</label>
			<div class="controls">
				<p class="form-control-static">${(orderCycle)!" "}</p>
				<p class="hidden">${(business.cycle)!" "}</p>
			</div>
		</div>
	</div>
	<h4>业务信息</h4>
	<hr />
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">业务编号 </label>
			<div class="controls">
				<p class="form-control-static">${business.id}</p>
				<input type="hidden" id="id" name="id" value="${business.id}" />
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">业务类型 </label>
			<div class="controls">
				<p class="form-control-static"><@com.type business.type/></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">机房名称</label>
			<div class="controls">
				<p class="form-control-static">${(server.dataCenterId)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-5">带宽 </label>
			<div class="controls">
				<p class="form-control-static">${(server.bandwidth)!" "} Mb</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-5">操作系统</label>
			<div class="controls">
				<p class="form-control-static">${(server.osId)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="span6">
			<label class="control-label col-md-2">选择带宽</label>
			<div class="col-md-6">
					<select class="form-`control" name="UpBandwidthId" id="UpBandwidthId">
						<#if itemList??>
						<#list itemList as il>
						     <option value="${il.id}">${il.title}</option>						   
						</#list>							
						</#if>
					</select>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<hr />
	<div class="row">
		<div class="span6">
			<label class="control-label col-md-2"></label>
			<div class="controls">
				
				<button type="button" id="yes" name ="yes"  class="btn btn-success">确认更改</button>
				<a href="javascript:history.go(-1)" class="btn btn-xs">返回</a>
			</div>
		</div>
	</div>
</form>
<script>
	jQuery(document).ready(function() {       
	   // initiate layout and plugins
	   //OrderHelper.state2 = ${state2map ! '{}'}
	   upServer.init();
	});
</script>
</@layout>