<#include "../layout.ftl">

<#macro scripts>


</#macro>

<@layout title="发票记录详情">
<div class="row">
	<div class="col-md-5">
		<label class="control-label col-md-5">订单号:</label>
		<div class="col-md-7">
			<span class="form-control-static">${invoices.orderId!''}</span>
		</div>
	</div>
	<div class="col-md-5">
		<label class="control-label col-md-5">所属用户:</label>
		<div class="col-md-7">
			<#if user ??>
			<span class="form-control-static">${user.username!''}</span>
			</#if>
		</div>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-md-5">
		<label class="control-label col-md-5">发票类型:</label>
		<div class="col-md-7">
			<span class="form-control-static">${(invoices.type == 0) ?string('普通发票','增值税发票')}</span>
		</div>
	</div>
	<div class="col-md-5">
		<label class="control-label col-md-5">发票时间:</label>
		<div class="col-md-7">
			<span class="form-control-static">${(invoices.createdTime?datetime)!''}</span>
		</div>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-md-5">
		<label class="control-label col-md-5">账单编号:</label>
		<div class="col-md-7">
			<#if invoice ??>
			<span class="form-control-static">${invoice.id!''}</span>
			</#if>
		</div>
	</div>
	<div class="col-md-5">
		<label class="control-label col-md-5">账单金额:</label>
		<div class="col-md-7">
			<#if invoice ??>
			<span class="form-control-static">${invoice.amount!''}元</span>
			</#if>
		</div>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-md-10">
		<label class="control-label col-md-2">客户备注:</label>
		<div class="col-md-6">
			<textarea class="form-control" disabled="disabled">${invoices.remark!''}</textarea>
		</div>
	</div>
</div>
<h4>发票详情</h4>
<#if invoices.type == 0>
<div class="form-group col-md-offset-2">
	<div class="form-control-static">
		<p>发票抬头: ${invoices.header!''}</p>
		<p>发票内容: ${invoices.content!''}</p>
	</div>
</div>
<#elseif invoices.type == 1>
<div class="form-group col-md-10 col-md-offset-2">
	<div class="form-control-static">
		<p>所在单位: ${invoices.organization!''}</p>
		<br/>
		<p>纳税人识别码: ${invoices.userIdcode!''}</p>
		<br/>
		<p>注册地址: ${invoices.registAddress!''}</p>
		<br/>
		<p>注册电话: ${invoices.registPhone!''}</p>
		<br/>
		<p>开户银行 : ${invoices.bank!''}</p>
		<br/>
		<p>银行账户  : ${invoices.bankAccount!''}</p>
	</div>
</div>
</#if>
</@layout>			
