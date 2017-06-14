<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/laydate.js"></script>
	<script src="${BasePath}/scripts/custom/cl.js"></script>
	<script src="${BasePath}/scripts/custom/trust.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   TrustlogAction.init();
		});
	</script>
	<script>
		$(function(){
				$(document).ready(function(){
					var val = ${trulog.trustId?default(0)};
					if(val!=0){
						$("#trustName option[value="+val+"]").attr("selected", true);
					}
				})
			})
	</script>
</#macro>

<@layout title="托管与区域记录详情">
<style>
	.form-control{display:inline-block;width:300px}
	#form_cl ul li span{font-size:14px}
</style>
  <form action="#" id="form_cl">
  	<ul class="list-group">
  		<input type="hidden" class="form-control" name="id" id="id" value="${trulog.id}">
		<li class="list-group-item">
				<span>所属订单：</span>
				<input type="text" class="form-control" name="" id="" value="${trulog.orderId}" disabled>
		</li>
		<li class="list-group-item">
				<span>托管机器：</span>
				<input type="text" class="form-control" name="" id="" value="${trulog.goodsName}" disabled>
		</li>
		<li class="list-group-item">
				<span>托管区域：</span>
				<input type="text" class="form-control" name="" id="" value="${trulog.name}" disabled>
		</li>
		<li class="list-group-item">
				<span>托管机房：</span>
				<select name="trustName" id="trustName" class="form-control selectpicker" style="width:140px">
					<#list trucity as tc>
						<option value="${tc.id}">${tc.truname}</option>
					</#list>
				</select>
		</li>
		<li class="list-group-item">
				<span style="position:relative;top:-40px">记录备注：</span>
				<textarea name="comment" id="comment" class="form-control" rows="3">${trulog.comment?default("")}</textarea>
		</li>
		<li class="list-group-item">
				<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cl').submit();">修改</button>
		</li>
	</ul>
 </form>
</@layout>