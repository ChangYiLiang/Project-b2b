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

<#include "../mall-header.ftl" >

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
							
							<div class="table-actions-wrapper">
								<form id="searchForm" action="#" class="form-inline text-right">
										<select name="isBuy" id="isBuy" class="form-control">
											<option value="">--全部状态--</option>
											<option value="0">--已下架--</option>
											<option value="1">-售卖中--</option>
										</select>
										<select name="ifIdc" id="ifIdc" class="form-control">
											<option value="">--全部商品--</option>
											<option value="0">--IDC服务类--</option>
											<option value="1">--硬件服务器--</option>
										</select>
										<input class="form-control" name="keyword" id="keyword" placeholder="关键字" type="text">
										<button type="button" id="search" class="btn btn-default blue" onclick="UnpaymentDt.search_click()">查询</button>
								</form>
							</div>
													
						</div>
						
						<div class="table-actions-wrapper">
							<a href="addgoodsall.do" class="btn btn-add blue table-group-action-submit pull-right">新增商品</a>		
						</div>
						<div class="table-actions-wrapper" style="position:relative;left:-40px">
								<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal22">添加价格</button>
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
					<!--
					<input type="text" class="form-control" name="isBuy" id="isBuy" required>
					-->
			</li>
			<li class="list-group-item">
					<span>是否IDC：</span>
					<!--
					<input type="text" class="form-control" name="ifIdc" id="ifIdc" required >
					-->
					<select name="ifIdc99" id="ifIdc99" class="form-control selectpicker" style="width:140px">
						<option value="0">--IDC服务--</option>
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

<!-- END CONTAINER -->

<#include "../mall-footer.ftl" >

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
	});
</script>


<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>