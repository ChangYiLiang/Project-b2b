<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/promotiontable.js"></script>
	<script>
		jQuery(document).ready(function() {
		   //App.init();
		   //Cl.initModal(); 
		   UnpaymentDt.init();      
		});
	</script>
	<script>
		$(function(){
			$(".submit").click(function(){
				var url="insertpromotion.do";
				var data={
						"categoryId":$("#categoryId").val(),
						"promotionUrl":$("#promotionUrl").val(),
						"title":$("#title").val()
					};
				$.ajax({url:url,type:"post",data,success:function(data){
							if(data=="success"){
								alert("提交成功");
								window.location.href="list.do";
							} else {
								alert("提交失败！请联系技术");
								window.location.href="list.do";		
							}
				        }
					});
			});
		});
	</script>
	<script>
		$(function(){
			$(document).on('click', '.bibobi', function() {
					var url="deletepromotion.do";
					var data={
							"id":$(this).attr("data")
						};
						
					if(confirm("确定要删除吗？"))
 					{
						$.ajax({url:url,data,success:function(data){
							if(data == "success"){
								alert("删除成功！！");
								window.location.href="list.do";
							} else {
								alert("删除失败！！");
								window.location.href="list.do";	
							}
						}
					});
					}
				});
		})
	</script>
</#macro>

<@layout title="促销管理">
	<div class="table-actions-wrapper">
		<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal">添加活动促销+</button>
	</div>
	<br/>
	<br/>
	<div class="portlet-body">
		<div class="table-container">
			<table class="table table-striped table-bordered table-hover" id="datatable_cl">
				<thead>
				<tr role="row" class="heading">
					
				</tr>
				</thead>
			</table>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">添加促销url+</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	  <form action="#" id="form_cl">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>所属版块：</span>
					<select class="form-control selectpicker" name="categoryId" id="categoryId">
						<#list list as c>
						  	<#if c.catLV=1>
						  		<option value="${c.id}" style="padding-left:15px;">${c.name}【${c.catLV}级】</option>
						  	<#elseif c.catLV=2>
						  		<option value="${c.id}" style="padding-left:30px;">${c.name}【${c.catLV}级】</option>
						  	<#elseif c.catLV=3>
						  		<option value="${c.id}" style="padding-left:45px;">${c.name}【${c.catLV}级】</option>
						  	<#elseif c.catLV=4>
						  		<option value="${c.id}" style="padding-left:60px;">${c.name}【${c.catLV}级】</option>
						  	<#else>
						  		<option value="${c.id}" style="padding-left:75px;">${c.name}【${c.catLV}级】</option>
						  	</#if>
						</#list>
					</select>
			</li>
			<li class="list-group-item">
					<span>促销入口URL：</span>
					<input type="text" class="form-control" name="promotionUrl" id="promotionUrl" required>
					<p>tip:如http://www.9he.com</p>
			</li>
			<li class="list-group-item">
					<span>标题：</span>
					<input type="text" class="form-control" name="title" id="title" required>
			</li>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary submit">添加</button>
	  	</div>
	</div>
</@layout>