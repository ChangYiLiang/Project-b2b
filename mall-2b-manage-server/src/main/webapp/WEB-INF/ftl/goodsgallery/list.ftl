<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/goodsgallerytable.js"></script>
	<script src="${BasePath}/scripts/custom/mallgoods.js"></script>
	<script>
		jQuery(document).ready(function() {
		   //App.init();
		   //Cl.initModal(); 
		   UnpaymentDt.init();      
		   Goods4.init();
		});
	</script>
	
	<script>
		$(function(){
			$(document).on('click', '.bibobi', function() {
					var url="delgallery.do";
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

<@layout title="商品广告图管理列表【只针对单独售卖的商品】">
	
	<div class="table-actions-wrapper">
		<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal">添加商品广告图+</button>
	</div>
	
	
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
		<h4 class="modal-title" id="myModalLabel">商品广告图+</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	<li class="list-group-item" style="display:none">
   		<span style="position:relative;top:-20px">上传回馈:&nbsp;&nbsp;</span><iframe name="up" height="50" width="400"></iframe>
    </li>
   <form name="form1" action="${FileStoreService}" target="up" method="post" ENCTYPE="multipart/form-data">
   		<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
		<div class="form" >
		    <li class="list-group-item">
						<span>图片1：</span>
						<input style="width:200px;display:inline-block" type="file" class="form-control" name="file">
			</li>
			<li class="list-group-item">
					<span>图片2：</span>
					<input style="width:200px;display:inline-block" type="file" class="form-control" name="file">
			</li>
			<li class="list-group-item">
						<span>图片3：</span>
						<input style="width:200px;display:inline-block" type="file" class="form-control" name="file">
			</li>
			<li class="list-group-item">
		    		<input id="queryBtn" type="Submit" class="btn btn-primary" value="提交图片" />
		    		<span>&nbsp;&nbsp;tip:先提交图片，再点击【添加】按钮</span>
			</li>
		</div>
    </form>
	<input id="test" type="hidden" style="width: 500px;" value=""/>	
	<form action="#" id="form_cl" method="post" enctype="multipart/form-data">
  		<ul class="list-group">
			<li class="list-group-item">
				<span>商品名称：</span>
				<select name="goodsId" id="goodsId" class="form-control">
					<#list list as li>
						<option value="${li.id}">--${li.goodsName!""}--</option>
					</#list>
				</select>
			</li>
			<li style="display:none" class="list-group-item">
					<span>图片排序：</span>
					<input style="width:40px" type="text" class="form-control" name="sort" id="sort" value="1" required>
			</li>
		</ul>
	</from>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
		<button type="button" class="btn btn-primary" id="addbouns" onclick="javascript:$('#form_cl').submit();">添加</button>
	</div>
	  
	</div>
	
	
<script type="text/javascript">
	function fileupload_callback(jsonstr){
		if(jsonstr){
			var str = eval(jsonstr);
			document.form1.reset();
			document.getElementById("test").value=jsonstr;
		}	
	}
</script>
</@layout>