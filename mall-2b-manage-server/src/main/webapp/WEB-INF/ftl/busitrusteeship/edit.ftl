<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/2bjs/jquery-1.9.1.min.js"></script>
	<script>
		$(function(){
			$(".bibobi").click(function(){
				var url="up.do";
				var data={
						"id":$("#id").val(),
						"state":$("#state").val()
					};
				$.ajax({url:url,data:data,success:function(data){
							if(data==true){
								alert("修改成功！！！");
								window.location.href="list.do";
							} else {
								alert("修改失败，请规范操作！！！");
								window.location.href="list.do";		
							}
				        }
					});
			})
		})
	</script>
</#macro>

<@layout title="代理托管业务修改/查看">
	<style>
	.form-control{display:inline-block;width:300px}
	</style>
	<form action="#" id="form_cl">
  	<ul class="list-group">
		<li class="list-group-item">
			<span>业务详情：</span><br/>
			<span>商品名称：${Bs.goodsName}</span><br/>
			<span>订单ID：${Bs.orderId}</span><br/>
			<span>托管时间：${Bs.cycle}年</span><br/>
			<soan>价格：${Bs.orderAmount!"0.00"}</span><br/>
			<span>托管规格：${Bt.trustSize}</span><br/>
			<span>托管功率：${Bt.power}</span><br/>
			<span>托管线路：${Bt.line}</span><br/>
			<span>托管带宽：${Bt.bandwidth}</span><br/>
			<span>托管IP个数：${Bt.ipCount}个</span><br/>
		</li>
		<li class="list-group-item">
				<input type="hidden" id="id" name="id" value="${Bs.id}">
				<span>业务状态：</span>
				<select name="state" id="state" class="form-control selectpicker" style="width:140px">
					<#if Bs.state=0>
						<option value="0" selected>等待安装</option>
						<option value="1">正常</option>
					<#else>
						<option value="0">等待安装</option>
						<option value="1" selected>正常</option>
					</#if>
				</select>
		</li>
		<li class="list-group-item">
				<button type="button" class="btn btn-primary bibobi">修改/确认</button>
		</li>
	</ul>
 </form>
 
</@layout>