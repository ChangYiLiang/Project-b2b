<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/laydate.js"></script>
	<script src="${BasePath}/scripts/custom/cl.js"></script>
	<script src="${BasePath}/scripts/custom/trust.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   UpTrustAction.init();
		});
	</script>
	<script>
	$(function(){
			$(document).ready(function(){
				var val = ${Tru.city?default(1)};
				$("#city option[value="+val+"]").attr("selected", true);
				var val = ${Tru.goodsId?default(1)};
				$("#goodsId option[value="+val+"]").attr("selected", true);
			})
		})
	</script>
</#macro>

<@layout title="托管与区域管理修改">
<style>
	.form-control{display:inline-block;width:300px}
	#form_cl ul li span{font-size:14px}
</style>
  <form action="#" id="form_cl">
  	<ul class="list-group">
  		<input type="hidden" class="form-control" name="id" id="id" value="${Tru.id}">
		<li class="list-group-item">
				<span>机房名称：</span>
				<input type="text" class="form-control" name="truname" id="truname" value="${Tru.truname?default("")}" required>
		</li>
		<li class="list-group-item">
				<span>机房编号：</span>
				<input type="text" class="form-control" name="no" id="no" value="${Tru.no?default("")}" required>
		</li>
		<li class="list-group-item">
				<span>绑定区域：</span>
				<select name="city" id="city" class="form-control selectpicker" style="width:140px">
					<#list area as ar>
						<option value="${ar.id}">--${ar.name}--</option>
	  				</#list>
				</select>
		</li>
		<li class="list-group-item">
				<span>绑定商品：</span>
				<select name="goodsId" id="goodsId" class="form-control selectpicker" style="width:140px">
					<#list goods as gs>
						<option value="${gs.id}">${gs.goodsName}</option>
	  				</#list>
				</select>
		</li>
		<li class="list-group-item">
				<span style="position:relative;top:-40px">机房备注：</span>
				<textarea name="comment" id="comment" class="form-control" rows="3">${Tru.comment?default("")}</textarea>
		</li>
		<li class="list-group-item">
				<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cl').submit();">修改</button>
		</li>
	</ul>
 </form>
</@layout>