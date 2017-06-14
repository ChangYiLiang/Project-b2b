<#include "../layout.ftl">

<#macro scripts>
<script src="${BasePath}/scripts/custom/aftersale.js"></script>
<script>
	$("#selectType").val(${aftersale.type});
</script>
</#macro>

<@layout title="售后服务 - 详情">
	<form class="form-horizontal apply-form" role="form" action="apply.do" method="post">
		<h4>申请详情</h4>
		<hr />
		<div class="form-group col-sm-6">
			<label for="type" class="col-sm-4 control-label">订单号</label>
			<div class="col-sm-8">
				<div class="form-control-static">${aftersale.orderId}</div>
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="type" class="col-sm-4 control-label">商品</label>
			<div class="col-sm-8">
				<div class="form-control-static">${(aftersale.goods.goodsName)!''}</div>
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="type" class="col-sm-4 control-label">服务类型</label>
			<div class="col-sm-8">
				<select name="aftersale.type" id="selectType" class="form-control" disabled required>
					<option value="0">仅退款</option>
					<option value="1">退款退货</option>
					<option value="2">换货</option>
					<option value="3">返修</option>
				</select>
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="selectReason" class="col-sm-4 control-label">退款(换货)原因</label>
			<div class="col-md-8">
				<input type="text" name="aftersale.reason" id="inputReason" class="form-control" disabled value="${aftersale.reason!''}" />
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="" class="col-sm-4 control-label">换货数量</label>
			<div class="col-md-8">
				<input type="text" name="aftersale.goodsQty" class="form-control" data-number="true" disabled required />
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="" class="col-sm-4 control-label">申请状态</label>
			<div class="col-md-8">
				<p class="form-control-static">${states[aftersale.state?string]}</p>
			</div>
		</div>
		
		<div class="clearfix"></div>
		<#if aftersale.refund??>
		<h4>退款申请</h4>
		<hr />
		<div class="form-group">
			<label for="refundMoney" class="col-sm-2 control-label">申请退款金额</label>
			<div class="col-md-3">
				<input type="text" name="refund.refundMoney" class="form-control" data-number="true" disabled value="${aftersale.refund.refundMoney!0}" />
			</div>
		</div>
		<div class="form-group">
			<label for="refundMoney" class="col-sm-2 control-label">确认退款金额</label>
			<div class="col-md-3" id="refundInfo">
				<input type="hidden" name="refund.afterSaleId" value="${aftersale.refund.afterSaleId!0}" />
				<input type="hidden" name="refund.id" value="${aftersale.refund.id!0}" />
				<input type="text" name="refund.confirmRefundMoney" class="form-control" data-number="true"  value="${aftersale.refund.confirmRefundMoney!''}" />
			</div>
			<#if aftersale.state == 2>
			<div class="col-md-3">
				<button type="button" class="btn blue" id="btnConfirmMoney" onclick="MyApp.AfterSale.confirmMoney(this)">确认退款</button>
			</div>
			</#if>
		</div>
		</#if>
		
		<#if aftersale.shippings?size != 0>
			<h4>退/还货物流</h4>
			<hr />
			<table class="table table-hover">
				<thead>
					<tr>
						<th>联系人</th>
						<th>联系电话</th>
						<th>物流状态</th>
						<th>物流公司</th>
						<th>物流单号</th>
					</tr>
				</thead>
				<#list aftersale.shippings as shipping>
				<tr>
					<td>${shipping.contact!''}</td>
					<td>${shipping.phone!''}</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
				</tr>
				</#list>
			</table>
		</#if>
		
		<h4>备注</h4>
		<hr />
		<div class="form-group">
			<label for="" class="col-sm-2 control-label">客户补充说明</label>
			<div class="col-md-8">
				<pre class="form-control-static">${aftersale.description!'无'}&nbsp;</pre>
			</div>
		</div>
		
		<#if (aftersale.file!'')!=''>
		<div class="form-group">
			<label for="type" class="col-sm-2 control-label">凭证</label>
			<div class="col-md-9">
				<div class="form-control-static">
					<#if aftersale.file?ends_with('.png') || aftersale.file?ends_with('.jpg')>
						<img src="${aftersale.file}" alt="" class="img-responsive" />
					</#if>
					<br />
					<a target="_blank" href="${aftersale.file}">下载凭证</a>
				</div>
			</div>
		</div>
		</#if>
		
		<div class="form-group">
			<br />
			<div class="col-sm-offset-2">
				<#if aftersale.state == 0>
				<button type="button" class="btn blue" onclick="MyApp.AfterSale.process(this)">同意受理</button>
				<#else>
				<button type="button" class="btn btn-primary" disabled>同意受理</button>
				</#if>
				
				<button type="button" class="btn yellow" onclick="MyApp.AfterSale.cancel(this)">取消申请</button>
				
				<#if aftersale.state != 6>
				<button type="button" class="btn red" onclick="MyApp.AfterSale.refuse(this)">拒绝受理</button>
				<#else>
				<button type="button" class="btn btn-primary" disabled>拒绝受理</button>
				</#if>
				<a href="list.do" class="btn btn-link">返回</a>
			</div>
			
			<div class="col-sm-offset-2">
				<br />
				<button type="button" class="btn green" onclick="MyApp.AfterSale.cancel(this)">添加物流</button>
			</div>
		</div>
	</form>
	<h4>售后记录</h4>
	<hr />
	<#list records as r>
		<div class="well">
			<p>${r.createTime?string('yyyy-MM-dd HH:mm:ss')}</p>
			${r.details!''}
		</div>
	</#list>
</@layout>
