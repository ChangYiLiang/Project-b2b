<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.1.1
Version: 2.0.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>九河 | 配置中心 - 商品管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<link rel="SHORTCUT ICON" href="${BasePath}/scripts/custom/favicon.ico">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN GENERAL STYLES -->
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
<!-- END GENERAL STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/data-tables/DT_bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/jquery-multi-select/css/multi-select.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">

<#include "../header.ftl" >

<div class="clearfix">
</div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
	
	<#include "../sidebar.ftl" >

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					商品管理
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="${BasePath}">
								主页
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="${BasePath}">
								商品中心
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					<!-- Begin: life time stats -->
					<div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-user"></i>商品列表
							</div>					
						</div>
						
						<div class="table-actions-wrapper">
								<form id="searchForm" action="#" class="form-inline text-right">
										<select class="form-control selectpicker" name="categoryId" id="categoryId" title="筛选分类" style="width:120px">
											<option value="">--分类筛选--</option>
								  			<#list cat as c>
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
								
										<select name="ifonly" id="ifonly" class="form-control selectpicker" title="是否单独售卖">
											<option value="">---捆绑状态---</option>
											<option value="1">--捆绑配件售卖--</option>
											<option value="2">---单独售卖---</option>
											<option value="3">---配件单独售卖---</option>
											<option value="4">---企业级硬盘类型---</option>
										</select>
										
										<select name="ifIdc" id="ifIdc" class="form-control selectpicker" title="是否IDC">
											<option value="">---是否IDC---</option>
											<option value="0">--IDC类--</option>
											<option value="1">---服务器类---</option>
										</select>
								
										<select name="iftrust" id="iftrust" class="form-control" title="筛选是否托管">
											<option value="">--托管状态--</option>
											<option value="1">--可托管--</option>
											<option value="0">--暂不托管--</option>
										</select>
										<select name="isBuy" id="isBuy" class="form-control" title="筛选商品状态">
											<option value="">--上下架状态--</option>
											<option value="0">--已下架--</option>
											<option value="1">-售卖中--</option>
										</select>
										<input class="form-control" name="keyword" id="keyword" placeholder="关键字" type="text">
										<button type="button" id="search" class="btn btn-default blue" onclick="UnpaymentDt.search_click()">查询</button>
								</form>
							</div>
						<br/>
						
						<div class="table-actions-wrapper">
							<a href="addgoodsall.do" class="btn btn-add blue table-group-action-submit pull-right">新增商品</a>		
						</div>
						<!--
						<div class="table-actions-wrapper" style="position:relative;left:-40px">
								<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal22">添加价格</button>
						</div>
						-->
						<div class="table-actions-wrapper" style="position:relative;left:-80px">
							<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal33">绑定配置参数</button>		
						</div>
						
						<div class="table-actions-wrapper" style="position:relative;left:-160px">
							<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal44">+添加/修改托管联动控制器</button>
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
					</div>
					<!-- End: life time stats -->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>

<!--
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">添加商品</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	  <form action="#" id="form_cl">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>商品名称：</span>
					<input type="text" class="form-control" name="goodsName" id="goodsName" required>
			</li>
			<li class="list-group-item">
					<span>商品副标：</span>
					<input type="text" class="form-control" name="secondTitle" id="secondTitle" required>
			</li>
			<li class="list-group-item">
					<span>商品价格：</span>
					<input type="text" class="form-control" name="goodsPrice" id="goodsPrice" value="0" required >
			</li>
			<li class="list-group-item">
					<span>商品分类：</span>
					<select class="form-control selectpicker" name="categoryId" id="categoryId">
						<option value="0">顶级分类</option>
						<#list cat as c>
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
			<li class="list-group-item" style="display:none">
					<span>添加日期：</span>
					<input type="text" class="form-control" name="addDate" id="addDate" value="1" required >
			</li>
			<li class="list-group-item">
					<span>是否上架：</span>
					<select name="isBuy99" id="isBuy99" class="form-control selectpicker" style="width:135px">
						<option value="1">---售卖---</option>
						<option value="0">---下架---</option>
					</select>
					
			</li>
			<li class="list-group-item" style="display:none">
					<span>是否IDC：</span>
					
					<select name="ifIdc99" id="ifIdc99" class="form-control selectpicker" style="width:140px">
						<option value="1">-服务器硬件-</option>
					</select>
			</li>
			<li class="list-group-item">
					<span style="position:relative;top:-38px">商品描述：</span>
					<textarea name="goodsDesc" id="goodsDesc" class="form-control" rows="3"></textarea>
			</li>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" id="additem" onclick="javascript:$('#form_cl').submit();">添加</button>
	  	</div>
</div>
-->

<div class="modal fade" id="myModal22" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">添加价格【只针对IDC】</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl22 ul li span{font-size:14px}
		#form_cl22 ul li input{width:150px}
	  </style>
	  <form action="#" id="form_cl22">
	  	<ul class="list-group">
	  	
	  		<li class="list-group-item">
				<span>绑定商品：</span>
				<select name="goodsId" id="goodsId" class="form-control selectpicker">
					<#list goods as good>
						<#if good.ifIdc?string ('硬件','IDC') = 'IDC'>
							<option value="${good.id}">${good.goodsName}</option>
						</#if>
					</#list>
				</select>
				<span id="tip"></span>
			</li>
			  	
			<li class="list-group-item">
					<span>月付价格：</span>
					<input type="text" class="form-control" name="monthPay" id="monthPay" value="0" required>
					
					<span>续月价格：</span>
					<input type="text" class="form-control" name="mrenewPay" id="mrenewPay" value="0" required>
					
			</li>
			<li class="list-group-item">
					<span>季付价格：</span>
					<input type="text" class="form-control" name="quartPay" id="quartPay" value="0" required >
					
					<span>续季价格：</span>
					<input type="text" class="form-control" name="qrenewPay" id="qrenewPay" value="0" required >
					
			</li>
			<li class="list-group-item">
					<span>半年付费：</span>
					<input type="text" class="form-control" name="hyPay" id="hyPay" value="0" required>
					
					<span>续半年付：</span>
					<input type="text" class="form-control" name="hrenewPay" id="hrenewPay" value="0" required>
					
			</li>
			<li class="list-group-item">
					<span>年付价格：</span>
					<input type="text" class="form-control" name="yearPay" id="yearPay" value="0" required >
					
					<span>续年付价：</span>
					<input type="text" class="form-control" name="yrenewPay" id="yrenewPay" value="0" required >
			</li>
			<li class="list-group-item">
					<span>二年付费：</span>
					<input type="text" class="form-control" name="tyPay" id="tyPay" value="0" required>
					
					<span>续二年付：</span>
					<input type="text" class="form-control" name="trenewPay" id="trenewPay" value="0" required>
			</li>
			
			<input type="hidden" class="form-control" name="itemId" id="itemId" value="0" required>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" id="additem22" disabled onclick="javascript:$('#form_cl22').submit();">添加</button>
	  	</div>
</div>


<div class="modal fade" id="myModal33" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">绑定配置参数</h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
	  </style>
	  <form action="#" id="form_cl33">
	  	<ul class="list-group">
	  		<li class="list-group-item">
				<span>绑定商品：</span>
				<select name="goodsId2" id="goodsId2" class="form-control selectpicker">
					<#list goods as good>
						<option value="${good.id}">${good.goodsName}</option>
					</#list>
				</select>
			</li>  	
			<li class="list-group-item">
				<span>参数名称：</span>
				<input type="text" class="form-control" name="goodsTag" id="goodsTag" required>	
			</li>
			<li class="list-group-item">
				<span>是否显示：</span>
				<select name="isShow" id="isShow" class="form-control selectpicker" style="width:100px">
					<option value="1">-显示-</option>
					<option value="2">-不显示-</option>
				</select>	
			</li>
			<li class="list-group-item">
				<span>排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序：</span>
				<input type="number" class="form-control" name="sort" id="sort" value="1" required>	
			</li>
			<li class="list-group-item">
				<span style="position:relative;top:-35px">参数描述：</span>
				<textarea name="goodsAttr" id="goodsAttr" class="form-control" rows="3"></textarea>
			</li>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cl33').submit();">添加</button>
	  	</div>
</div>


<div class="modal fade" id="myModal44" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel">JS联动控制器+</h4>
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
						<span>JS控制器：</span>
						<input style="width:200px;display:inline-block" type="file" class="form-control" name="file">
			</li>
			<li class="list-group-item">
		    		<input id="queryBtn" type="Submit" class="btn btn-primary" value="提交" />
		    		<span>&nbsp;&nbsp;tip:先提交，再点击【添加】按钮</span>
			</li>
		</div>
    </form>
	<input id="test" type="hidden" style="width: 500px;" value=""/>	
	<form action="#" id="form_cl" method="post" enctype="multipart/form-data">
  		<ul class="list-group">
			<li class="list-group-item">
				<span>商品名称：</span>
				<select name="goodsIdgg" id="goodsIdgg" class="form-control">
					<#list goods as gd>
						<#if gd.ifIdc == false && gd.isBuy == 1>
							<option value="${gd.id}">${gd.goodsName!""}</option>
						</#if>
					</#list>
				</select>
			</li>
		</ul>
	</from>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
		<button type="button" class="btn btn-primary" id="addbouns">添加</button>
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


<!-- END CONTAINER -->

<#include "../footer.ftl" >

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${IncPath}/assets/plugins/respond.min.js"></script>
<script src="${IncPath}/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN GENERAL PLUGINS -->
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<!-- END GENERAL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/plugins/select2/select2.min.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/jquery.dataTables.js"></script>
<script src="${IncPath}/assets/plugins/data-tables/DT_bootstrap.js"></script>
<script src="${IncPath}/assets/plugins/jstree/dist/jstree.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/scripts/core/app.js"></script>
<script src="${IncPath}/assets/scripts/core/datatable.js"></script>
<script src="${BasePath}/scripts/custom/laydate.js"></script>
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/common.js"></script>
<script src="${BasePath}/scripts/custom/goodstables.js"></script>
<script src="${BasePath}/scripts/custom/mallgoods.js"></script>
<script>
	jQuery(document).ready(function() {       
	   // initiate layout and plugins
	   App.init();
	   Cl.initModal();
	   UnpaymentDt.init();
	   Goods.init();
	   Goods2.init();
	   Goods3.init();
	});
</script>

<script>
	$(function(){
		$(document).on("click", ".copy", function(){
			$(this).attr({"disabled":true});
			$(this).text("复制中..");  
			var url="copygoods.do";
			var data={
					"id":$(this).attr("data")
				};
			$.ajax({url:url,data:data,success:function(data){
						if(data=="success"){
							alert("复制成功！！！");
							window.location.href="goods.do";
						} else {
							alert("复制失败！！！");
							window.location.href="goods.do";		
						}
			        }
				});
		})
	});
	$(function(){
		$("#addbouns").click(function(){
			var url="addjsfile.do";
			var data={
					"id":$("#goodsIdgg").val(),
					"jsfile":$("#test").val()
				};
			$.ajax({url:url,data:data,success:function(data){
						if(data=="success"){
							alert("添加成功,Amaing！！！");
							window.location.href="goods.do";
						} else {
							alert("添加失败！！！Execting");
							window.location.href="goods.do";		
						}
			        }
				});
		})
	})
</script>




<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>