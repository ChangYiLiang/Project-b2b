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
					分类管理
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
								分类中心
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
								<i class="fa fa-user"></i>分类列表
							</div>						
						</div>
						<style>
							.hihi li{height:50px}
						</style>
						<div class="table-actions-wrapper">
							<button class="btn btn-add blue pull-left bibi">【收起/展开】</button>
						</div>
						<div class="table-actions-wrapper">
							<button class="btn btn-add blue table-group-action-submit pull-right" data-toggle="modal" data-target="#myModal">新增商品分类</button>
						</div>
						<div class="table-actions-wrapper">
							<a class="btn btn-add blue table-group-action-submit pull-right" style="position:relative;left:-30px" href="itemcategory.do">查看配件分类</a>
						</div>
						<div class="portlet-body">
							<div class="table-container">
								<ul class="list-group hihi">
								  <#list cat as c>
								  	<#if c.catLV=1>
								  		<li class="list-group-item lv1" style="color:red">${c.name}【${c.catLV}级】<a class="btn blue pull-right" href="updatecategory.do?id=${c.id}">查看/修改</a></li>
								  	<#elseif c.catLV=2>
								  		<li class="list-group-item lv2" style="padding-left:30px">${c.name}【${c.catLV}级】<a class="btn blue pull-right" href="updatecategory.do?id=${c.id}">查看/修改</a></li>
								  	<#elseif c.catLV=3>
								  		<li class="list-group-item lv3" style="padding-left:60px">${c.name}【${c.catLV}级】<a class="btn blue pull-right" href="updatecategory.do?id=${c.id}">查看/修改</a></li>
								  	<#elseif c.catLV=4>
								  		<li class="list-group-item lv4" style="padding-left:90px">${c.name}【${c.catLV}级】<a class="btn blue pull-right" href="updatecategory.do?id=${c.id}">查看/修改</a></li>
								  	<#else>
								  		<li class="list-group-item lv5" style="padding-left:120px">${c.name}【${c.catLV}级】<a class="btn blue pull-right" href="updatecategory.do?id=${c.id}">查看/修改</a></li>
								  	</#if>
								  </#list>
								</ul>
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
		<h4 class="modal-title" id="myModalLabel">添加分类<span style="color:green;font-size:12px">【tip:理论可支持无限级分类,建议3级分类足矣】</span></h4>
	  </div>
	  <style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	  </style>
	  <form action="#" id="form_cl">
	  	<ul class="list-group">
	  		<li class="list-group-item">
					<span>所属分类：</span>
					<select class="form-control selectpicker" name="parentId" id="parentId">
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
	  	
			<li class="list-group-item">
					<span>分类名称：</span>
					<input type="text" class="form-control" name="name" id="name" required>
			</li>
			
			<li class="list-group-item">
					<span>分类排序：</span>
					<input style="width:70px" type="num" class="form-control" name="sort" id="sort" value="1">
			</li>
			
			<li class="list-group-item">
					<span>是否显示：</span>
					<select style="width:100px" class="form-control selectpicker" name="isShow" id="isShow">
						<option value="1">--显示--</option>
						<option value="2">--不显示--</option>
					</select>
					<span style="color:green;font-size:12px">【tip】:如果设置了不显示，该分类下的商品也会不显示</span>
			</li>
			
			<li class="list-group-item">
					<span style="position:relative;top:-37px">分类描述：</span>
					<textarea name="catDesc" id="catDesc" class="form-control" rows="3"></textarea>
			</li>
			<input type="hidden" class="form-control" name="structure" id="structure" required>
			<input type="hidden" class="form-control" name="catLV" id="catLV" required>
		</ul>
		</form>
	 	 <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
			<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cl').submit();">添加</button>
	  	</div>
</div>

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
<script src="${BasePath}/scripts/custom/category.js"></script>
<script>
	jQuery(document).ready(function() {       
	   // initiate layout and plugins
	   App.init();
	   Cl.initModal();
	   Category.init();
	});
</script>

<script>
	$(function(){
		$(".bibi").click(function(){
			$(".lv2,.lv3,.lv4,.lv5").slideToggle(500);
		});
	})
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>