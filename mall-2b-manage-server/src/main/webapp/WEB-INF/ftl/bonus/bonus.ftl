<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/laydate.js"></script>
	<script src="${BasePath}/scripts/custom/cl.js"></script>
	<script src="${BasePath}/scripts/custom/bonus.js"></script>
	<script src="${BasePath}/scripts/custom/2bjs/jquery-1.9.1.min.js"></script>
	<script>
		jQuery(document).ready(function() {       
		   BonusAction.init();
		});
	</script>
	<script>
		$(function(){
			$(".Pikachu").click(function(){
				$(this).attr({"disabled":true});
				$(this).text("发送中...");
				var url="sendbonus.do";
				var data={
						"id":$(this).attr("data")
					};
				$.ajax({url:url,data,success:function(data){
							if(data=="true"){
								alert("发送成功！！！");
								window.location.href="bonus.do";
							} else {
								alert("发送失败，请规范操作！！！");
								window.location.href="bonus.do";		
							}
				        }
					});
			});
		});
	</script>
</#macro>

<@layout title="节操券管理列表">
	<div class="table-actions-wrapper">
		<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal">添加节操券+</button>
	</div>
	<br/>
	<br/>
	<br/>
	<table class="table table-bordered">
		  <thead>
		    <tr class="flag-tr">
		      <th>编号</th>
		      <th>节操券名字</th>
		      <th>金额</th>
		      <th>消费额度</th>
		      <th>开始时间</th>
		      <th>结束时间</th>
		      <!--
		      <th>发送数量</th>
		      <th>已领取数量</th>
		      -->
		      <th>已使用数量</th>
		      <th>操作</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<#list bonus as bo>
			    <tr class="flag2-tr">
			      <td>${bo.typeId}</td>
			      <td>${bo.typeName}</td>
			      <td>${bo.typeMoney}</td>
			      <td>${bo.minAmount}</td>
			      <td>${bo.startDate}</td>
			      <td>${bo.endDate}</td>
			      <!--
			      <td>${bo.sendNum}</td>
			      <td>${bo.getNum}</td>
			      -->
			      <td>${bo.useNum}</td>
			      <td>
			      	<a href="updatebonus.do?id=${bo.typeId}" class="btn btn-primary">修改/查看</a>
			      	<#if bo.cangetNum=1>
			      		<button data="${bo.typeId}" class="btn btn-primary Pikachu">发送节操券</button>
			      	<#else>
			      		<button style="background-color:#ccc" data="${bo.typeId}" class="btn btn-primary">已发送</button>
			      	</#if>
			      </td>
			    </tr>
		    </#list>
		  </tbody>
	</table>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">添加节操券+</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	  <form action="#" id="form_cl">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>节券名称：</span>
					<input type="text" class="form-control" name="typeName" id="typeName" required>
			</li>
			<li class="list-group-item">
					<span>节券金额：</span>
					<input type="text" class="form-control" name="typeMoney" id="typeMoney" required>
			</li>
			<li class="list-group-item">
					<span>消费额度：</span>
					<input type="text" style="width:100px" class="form-control" name="minAmount" id="minAmount" value="0" required >
					<span style="color:green">tip:最低消费多少才可以使用节操券</span>
			</li>
			<li class="list-group-item">
					<span>开始日期：</span>
					<input type="text" style="width:200px" class="form-control" name="startDate" id="startDate" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required >
					<span style="color:green">tip:开始时间必须小于结束时间</span>
			</li>
			<li class="list-group-item">
					<span>结束日期：</span>
					<input type="text" style="width:200px" class="form-control" name="endDate" id="endDate" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required >
					<span style="color:green">tip:结束时间必须大于开始时间</span>
			</li>
			<!--
			<li class="list-group-item">
					<span>发送数量：</span>
					<input type="text" style="width:100px" class="form-control" name="sendNum" id="sendNum" required >
					<span style="color:green">tip:每次发送节操券数量，送完即止</span>
			</li>
			<li class="list-group-item">
					<span>领取数量：</span>
					<input type="num" style="width:100px" class="form-control" name="cangetNum" id="cangetNum" value="1" required >
					<span style="color:green">tip:每个会员能领取的张数</span>
			</li>
			-->
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" id="addbouns" onclick="javascript:$('#form_cl').submit();">添加</button>
	  	</div>
	</div>
</@layout>