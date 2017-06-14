<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/laydate.js"></script>
	<script src="${BasePath}/scripts/custom/cl.js"></script>
	<script src="${BasePath}/scripts/custom/bonus.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   BonusAction2.init();
		});
	</script>
</#macro>

<@layout title="节操券修改">
	<br/>
	<br/>
	<style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	</style>
	<form action="#" id="form_cl">
		<input type="hidden" name="typeId" id="typeId" value="${bonus.typeId}">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>节券名称：</span>
					<input type="text" class="form-control" name="typeName" id="typeName" value="${bonus.typeName?default("")}" required>
			</li>
			<li class="list-group-item">
					<span>节券金额：</span>
					<input type="text" class="form-control" name="typeMoney" id="typeMoney" value="${bonus.typeMoney?default("0")}" required>
			</li>
			<li class="list-group-item">
					<span>消费额度：</span>
					<input type="text" class="form-control" name="minAmount" id="minAmount" value="${bonus.minAmount?default("0")}" required >
					<span style="color:green">tip:最低消费多少才可以使用节操券</span>
			</li>
			<li class="list-group-item">
					<span>开始日期：</span>
					<input type="text" class="form-control" name="startDate" id="startDate" value="${bonus.startDate}" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required >
					<span style="color:green">tip:开始时间必须小于结束时间</span>
			</li>
			<li class="list-group-item">
					<span>结束日期：</span>
					<input type="text" class="form-control" name="endDate" id="endDate" value="${bonus.startDate}" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required >
					<span style="color:green">tip:结束时间必须大于开始时间</span>
			</li>
			<!--
			<li class="list-group-item">
					<span>发送数量：</span>
					<input type="text" class="form-control" name="sendNum" id="sendNum" value="${bonus.setNum?default(0)}" required >
					<span style="color:green">tip:每次发送节操券数量，送完即止</span>
			</li>
			<li class="list-group-item">
					<span>领取数量：</span>
					<input type="num" style="width:100px;" class="form-control" name="cangetNum" id="cangetNum" value="${bonus.cangetNum?default(0)}" required >
					<span style="color:green">tip:每个会员能领取的张数</span>
			</li>
			-->
			<li class="list-group-item">
					<button type="button" class="btn btn-primary" id="additem" onclick="javascript:$('#form_cl').submit();">修改节操券</button>
			</li>
		</ul>
	</form>
</@layout>