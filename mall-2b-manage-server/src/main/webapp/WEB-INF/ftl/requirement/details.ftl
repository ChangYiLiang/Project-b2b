<#include "../layout.ftl">

<#macro scripts>
	<script>
		$("#offerForm").i9heValidate();
	</script>
	<#if message??>
	<script>alert('${message}')</script>
</#if>
</#macro>

<@layout title="客户采购需求详情">
<div class="form-horizontal">
	<div class="form-group">
    	<label class="col-sm-2 control-label">采购需求单号</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">${requirement.id}</div>
    	</div>
  	</div>
  	<!--
	<div class="form-group">
    	<label class="col-sm-2 control-label">标题</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">${requirement.title!''}</div>
    	</div>
  	</div>
  	-->
	<div class="form-group">
    	<label class="col-sm-2 control-label">补充说明</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">${requirement.title!'无'}</div>
    	</div>
  	</div>
  	
  	<div class="form-group">
    	<label class="col-sm-2 control-label">需求附件</label>
    	<div class="col-sm-10">
      		<#list additions as file>
      			<p><a href="${file.filename}" target="_blank">附件${file_index+1}</a></p>
      		</#list>
    	</div>
  	</div>
  	<!--
	<div class="form-group">
    	<label class="col-sm-2 control-label">采购商品</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">
      			<table class="table">
      				<tr>
      					<th>商品名称</th>
      					<th>采购数量</th>
      					<th>预算价格</th>
      				</tr>
      				<#list goods as g>
      				<tr>
      					<td>${g.goodsName!''}</td>
      					<td>${g.qty!0}</td>
      					<td>${g.budget!0}</td>
      				</tr>
      				</#list>
      			</table>
      		</div>
    	</div>
  	</div>
  	-->
  	
  	<div class="form-group">
    	<label class="col-sm-2 control-label">联系人</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">${requirement.contact!''}</div>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-2 control-label">企业</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">${requirement.company!''}</div>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-2 control-label">联系方式</label>
    	<div class="col-sm-10">
      		<div class="form-control-static">
      			<#if requirement.phone??>
      			<p>电话: ${requirement.phone}</p>
      			</#if>
      			<#if requirement.qq??>
      			<p>QQ: ${requirement.qq}</p>
      			</#if>
      			<#if requirement.email??>
      			<p>Email: ${requirement.email}</p>
      			</#if>
      			<#if requirement.weixin??>
      			<p>微信: ${requirement.weixin}</p>
      			</#if>
      		</div>
    	</div>
  	</div>
</div>

<h3>报价信息</h3>
<hr />

<form action="offer.do" method="post" class="form-horizontal col-md-6" id="offerForm">
	<#if offer??>
	<input type="hidden" name="id" value="${offer.id}" />
	</#if>
	<input type="hidden" name="requirementId" value="${requirement.id}" />
	<div class="form-group">
    	<label for="goodsName" class="col-sm-2 control-label">推荐商品</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="goodsName" name="goodsName" value="${(offer.goodsName)!''}" required />
    	</div>
  	</div>
  	<div class="form-group">
    	<label for="goodsUrl" class="col-sm-2 control-label">推荐链接</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="goodsUrl" name="goodsUrl" value="${(offer.goodsUrl)!''}" data-url="true" />
    	</div>
  	</div>
  	<div class="form-group">
    	<label for="reason" class="col-sm-2 control-label">推荐原因</label>
    	<div class="col-sm-10">
    		<textarea class="form-control" name="reason" id="reason" rows="5">${(offer.reason)!''}</textarea>
    	</div>
  	</div>
  	<div class="form-group">
    	<label for="goodsValue" class="col-sm-2 control-label">推荐产品价值</label>
    	<div class="col-sm-10">
    		<textarea class="form-control" name="goodsValue" id="goodsValue" rows="5">${(offer.goodsValue)!''}</textarea>
    	</div>
  	</div>
  	<div class="form-group">
    	<label for="price" class="col-sm-2 control-label">报价</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="price" name="price" value="${(offer.price)!''}" data-number="true" required />
    	</div>
  	</div>
  	<div class="form-group">
    	<label for="service" class="col-sm-2 control-label">联系客服名</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="service" name="service" value="${(offer.service)!(user.fullname!'')}" required />
    	</div>
  	</div>
  	<div class="form-group">
    	<label for="phone" class="col-sm-2 control-label">客服电话</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" id="phone" name="phone" value="${(offer.phone)!''}" required />
    	</div>
  	</div>
  	<div class="form-group">
    	
    	<div class="col-md-offset-2 col-md-6">
    		<#if offer??>
      		<input onclick="return confirm('已经报价了, 是否更新报价信息?')" type="submit" value="更新报价" class="btn btn-primary" />
    		<#else>
      		<input type="submit" value="提交报价" class="btn btn-primary" />
    		</#if>
    		<a href="list.do" class="btn btn-default">返回</a>
    	</div>
  	</div>
</form>

</@layout>			
