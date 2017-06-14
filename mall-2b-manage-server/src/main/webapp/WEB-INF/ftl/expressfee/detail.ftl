<#include "../layout.ftl">

<#macro scripts>
<script>
	var removeBind = function(){
		if(confirm("确定解除该绑定？")){
			var goodsId = $("#goodsId").val();
			var data = {goodsId:goodsId};
			$.ajax({data:data,url:"removebind.do",type:"post",dataType:"json",success:function(result){
				if(result){
					alert("解绑成功!");
					window.location.href="goods.do";
				}else{
					alert("解绑失败!");
					window.location.href="goods.do";
				}
			}});
		}
	}
</script>
</#macro>

<@layout title="修改运费模板">
<style>
.expressfeeType th{text-align: center}
</style>
<div class="from-group">
	<input type="hidden" id="goodsId" value="${goodsId!''}">
	<div class="form-group col-md-12">
		<label class="control-label col-md-2">模板名称：</label>
		<div class="col-md-8">
			<div class="form-control-static">${template.name!''}</div>
		</div>
	</div>
	<div class="form-group col-md-12">
		<label class="control-label col-md-2">快递名称：</label>
		<div class="col-md-8">
			<div class="form-control-static">${template.expressName!''}</div>
		</div>
	</div>
	<div class="form-group col-md-12">
		<label class="control-label col-md-2">发货地：</label>
		<div class="col-md-8">
			<div class="form-control-static">${template.senderProvince!''}&nbsp${template.senderCity!''}</div>
		</div>
	</div>
	<div class="form-group col-md-12">
		<label class="control-label col-md-2">是否包邮：</label>
		<div class="col-md-8">
			<div class="form-control-static">
				<#if template.expressType == 0><span>不包邮</span></#if>
				<#if template.expressType == 1><span>部分地区包邮</span></#if>
				<#if template.expressType == 2><span>全国包邮</span></#if>
			</div>
		</div>
	</div>
	<div class="form-group col-md-12">
		<label class="control-label col-md-2">备注：</label>
		<div class="col-md-8">
			<div class="form-control-static">${template.remark!''}</div>
		</div>
	</div>
	<div class="form-group col-md-12">
		<label class="control-label col-md-2">运费计算：</label>
	</div>
		<div class="row expressfeeType">
			<div class="col-sm-12">
				<table class="table table-bordered table-hover text-center">
					  <thead>
					    <tr>
					      <th width="50%">目的地</th>
					      <th width="10%">首件（件）</th>
					      <th width="10%">首费（元）</th>
					      <th width="10%">每增加件数</th>
					      <th width="15%">增加费用（元）</th>
					    </tr>
					  </thead>
					  <tbody>
					  <#list template.expressfeeTypes as expressfeeType>
					  	<tr>
					  	  <td>
					  	  	<div class="col-sm-8 col-sm-offset-2">
					  	  		<span>${expressfeeType.expressAddress.provinceName!''}</span>
					  	  	</div>
					  	  </td>
					  	  <td><span class="firstCount">${expressfeeType.firstCount!'1'}</span></td>
					  	  <td><span class="firstFee">${expressfeeType.firstFee!'0'}</span></td>
					  	  <td><span class="addCount">${expressfeeType.addCount!'1'}</span></td>
					  	  <td><span class="addFee">${expressfeeType.addFee!'0'}</span></td>
					  	</tr>
					  	</#list>
					  	
					  </tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<button class="btn btn-primary" type="button" onclick="removeBind()">解除绑定</button>
				<button class="btn btn-primary" type="button" onclick="window.location.href='${BasePath}/controller/goods/bindexpressfee.do?id=${goodsId}'">修改绑定</button>
				<button class="btn btn-primary" type="button" onclick="window.location.href='${BasePath}/controller/goods/goods.do'">返回</button>
			</div>
		</div>
</div>
</@layout>			
