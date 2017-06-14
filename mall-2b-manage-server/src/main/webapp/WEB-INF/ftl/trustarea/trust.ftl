<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/laydate.js"></script>
	<script src="${BasePath}/scripts/custom/cl.js"></script>
	<script src="${BasePath}/scripts/custom/trust.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   TrustAction.init();
		   AreaAction.init();
		});
	</script>
</#macro>

<@layout title="托管与区域管理列表">

	<div class="table-actions-wrapper">
		<button class="btn btn-add blue table-group-action-submit" data-toggle="modal" data-target="#myModal22">绑定托管机房+</button>
	</div>
	<div class="table-actions-wrapper">
		<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal33">添加区域+</button>
	</div>
	<br/>
	<div class="table-actions-wrapper">
		<button class="btn btn-add blue table-group-action-submit" data-toggle="modal" data-target="#myModal">托管地区列表+</button>
	</div>
	<br/>
	<table class="table table-bordered">
		  <thead>
		    <tr class="flag-tr">
		      <th>机房编号</th>
		      <th>机房名称</th>
		      <th>机房区域</th>
		      <th>备注</th>
		      <th>操作</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<#list Trulist as tl>
		  		<tr class="flag2-tr">
		  			<td>${tl.no}</td>
		  			<td>${tl.truname}</td>
		  			<td>${tl.name}</td>
		  			<td>${tl.comment}</td>
		  			<td><a href="uptrust.do?id=${tl.id}" class="btn btn-primary">修改/查看</a></td>
		  		</tr>
		  	</#list>
		  </tbody>
	</table>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">托管地区列表+</h4>
	  </div>
	  <style>
	  	.yy input{width:170px}
	  </style>
	  <ul class="list-group">
		  <#list area as ar>
			<li class="list-group-item yy">
				<!--
				<input type="text" class="form-control" value="${ar.name}" data="${ar.id}">
				-->
				<button class="btn btn-add blue jj">${ar.name}+</button>
			</li>
		  </#list>
	  </ul>
	</div>
	
	
	<div class="modal fade" id="myModal22" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">绑定托管机房+</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	  <form action="#" id="form_cl">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>机房名称：</span>
					<input type="text" class="form-control" name="truname" id="truname" required>
			</li>
			<li class="list-group-item">
					<span>机房编号：</span>
					<input type="text" class="form-control" name="no" id="no" required>
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
					<textarea name="comment" id="comment" class="form-control" rows="3"></textarea>
			</li>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cl').submit();">添加</button>
	  	</div>
	</div>
	
	<div class="modal fade" id="myModal33" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">添加区域+</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	  <form action="#" id="form_cll">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>区域名称：</span>
					<input type="text" class="form-control" name="name" id="name" required>
			</li>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cll').submit();">添加</button>
	  	</div>
	</div>
</@layout>