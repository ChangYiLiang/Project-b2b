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
<title>九河 | 配件中心 - 配件修改</title>
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
<link rel="stylesheet" type="text/css" href="${BasePath}/css/img.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/css/zoomify.min.css" rel="stylesheet" type="text/css"/>
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
					商品修改
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
								商品修改
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
			<style>
			 .form-control{display:inline-block;width:400px}
			 #form_cll ul li input{width:163px}
			</style>
			<li class="list-group-item">
		   		<span style="position:relative;top:-20px">上传回馈:&nbsp;&nbsp;</span><iframe name="up" height="50" width="400"></iframe>
		   </li>
		   <form name="form1" action="${FileStoreService}" target="up" method="post" ENCTYPE="multipart/form-data">
		   		<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
				<div class="form" >
				    <li class="list-group-item">
							<span>商品图片：</span>
							<input style="width:400px;display:inline-block" type="file" class="form-control" name="file" id="goodsImg">
					</li>
					<li class="list-group-item">
							<span>原商品图片预览：</span>
							<img class="example" style="width:150px;height:150px;border:1px solid #ccc" src="${info.goodsImg?default("")}">
							<span>【点击图片看原图】</span>
					</li>
					<li class="list-group-item">
				    		<input id="queryBtn" type="Submit" class="btn btn-primary" value="更新商品图片" />
					</li>
			</form>
			<input id="test" type="hidden" style="width: 500px;" value=""/>
			<form name="form2" action="${FileStoreService}" target="up" method="post" ENCTYPE="multipart/form-data">
		   		<input name="cburl" type="hidden" value="${BasePath}/uploadcallback2.jsp"/>	
					<li class="list-group-item">
							<span>评测图片：</span>
							<input style="width:400px;display:inline-block" type="file" class="form-control" name="file" id="goodsTest">
					</li>
					<li class="list-group-item">
							<span>原评测图片预览：</span>
							<img class="example" style="width:150px;height:150px;border:1px solid #ccc" src="${info.goodsTest?default("")}">
							<span>【点击图片看原图】</span>
					</li>
					<li class="list-group-item">
				    		<input id="queryBtn" type="Submit" class="btn btn-primary" value="更新测试图片" />
					</li>
				</div>
		    </form>
		    <input id="test2" type="hidden" style="width: 500px;" value=""/>	
			<form action="upgoods.do" id="form_cll" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" id="id" value="${info.id}">
		  	<ul class="list-group">
				<li class="list-group-item">
						<span>商品名称：</span>
						<input style="width:400px" type="text" class="form-control" name="goodsName" id="goodsName" value="${info.goodsName}" required>
				</li>
				<li class="list-group-item">
						<span>商品副标：</span>
						<input style="width:400px" type="text" class="form-control" name="secondTitle" id="secondTitle" value="${info.secondTitle?default("")}" required>
				</li>
				<li class="list-group-item">
						<span>商品价格：</span>
						<input style="width:400px" type="text" class="form-control" name="goodsPrice" id="goodsPrice" value="${info.goodsPrice?default("")}" required >
				</li>
				<li class="list-group-item">
						<span>售卖类型：</span>
						<select name="goodsType" id="goodsType" class="form-control selectpicker" style="width:140px">
							<option value="1">--普通--</option>
							<option value="2">--热卖--</option>
							<option value="3">--新品--</option>
							<option value="4">--精品--</option>
						</select>	
				</li>
				
				<li class="list-group-item">
						<span>商品分类：</span>
						<select class="form-control selectpicker" name="categoryId" id="categoryId">
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
					<span>是否单独售卖：</span>
					<select name="ifonly" id="ifonly" class="form-control selectpicker" style="width:170px">
						<#if info.ifonly=1>
							<option value="1" selected>---捆绑配件售卖---</option>
							<option value="2">---单独售卖---</option>
							<option value="3">---配件单独售卖---</option>
							<option value="4">---企业级硬盘类型---</option>
						<#elseif info.ifonly=2>
							<option value="1">---捆绑配件售卖---</option>
							<option value="2" selected>---单独售卖---</option>
							<option value="3">---配件单独售卖---</option>
							<option value="4">---企业级硬盘类型---</option>
						<#elseif info.ifonly=3>
							<option value="1">---捆绑配件售卖---</option>
							<option value="2">---单独售卖---</option>
							<option value="3" selected>---配件单独售卖---</option>
							<option value="4">---企业级硬盘类型---</option>
						<#else>
							<option value="1">---捆绑配件售卖---</option>
							<option value="2">---单独售卖---</option>
							<option value="3">---配件单独售卖---</option>
							<option value="4" selected>---企业级硬盘类型---</option>
						</#if>
					</select>
				</li>
				
				
				<li class="list-group-item">
						<span>商品状态：</span>
						<#if info.isBuy?default("0") = 1>
							<select name="isBuy" id="isBuy" class="form-control selectpicker" style="width:139px">
								<option value="1" selected>---售卖中---</option>
								<option value="0">---下架中---</option>
							</select>
						<#else>
							<select name="isBuy" id="isBuy" class="form-control selectpicker" style="width:139px">
								<option value="1">---售卖中---</option>
								<option value="0" selected>---下架中---</option>
							</select>
						</#if>	
				</li>
				<li class="list-group-item">
						<span>是否IDC：</span>
						<select name="ifIdc" id="ifIdc" class="form-control selectpicker" style="width:140px">
							<#if info.ifIdc>
								<option value="1" selected>-服务器硬件-</option>
								<option value="0">-IDC服务类-</option>
							<#else>
								<option value="1">-服务器硬件-</option>
								<option value="0" selected>-IDC服务类-</option>
							</#if>
						</select>
				</li>
				
				<li class="list-group-item">
							<span>是否可以托管到数据中心：</span>
							<select name="iftrust" id="iftrust" class="form-control selectpicker" style="width:139px">
								<#if info.iftrust=1>
									<option value="1" selected>---可以托管---</option>
									<option value="0">---暂不托管---</option>
								<#else>
									<option value="1">---可以托管---</option>
									<option value="0" selected>---暂不托管---</option>
								</#if>
							</select>
				</li>	
				<li class="list-group-item">
						<span>显示排序：</span>
						<input style="width:120px" type="num" class="form-control" name="sort" id="sort" value="${info.sort?default(0)}" required>
				</li>
				
				<li class="list-group-item">
						<span style="position:relative;top:-108px">商品描述：</span>
						<textarea name="goodsDesc" id="goodsDesc" class="form-control" rows="10">${info.goodsDesc?default("")}</textarea>
				</li>
				
				<li class="list-group-item">
						<button type="button" class="btn btn-primary" id="additem" onclick="javascript:$('#form_cll').submit();">修改商品资料</button>
				</li>
			</ul>
					
		</div>				
	</div>
	<!-- END CONTENT -->
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
<script type="text/javascript" src="${IncPath}/assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${IncPath}/assets/scripts/core/app.js"></script>
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/mallgoods.js"></script>
<script>
	jQuery(document).ready(function() {       
	   // initiate layout and plugins
	   App.init();
	   Cl.initModal();
	   UpdateGoods.init();
	   //UpdateGoodsDetail.init();
	});
</script>

<script>
	$(function(){
		$(document).ready(function(){
			var val = ${info.categoryId?default("0")};
			var v   = ${info.goodsType?default("0")};
			$("#goodsType option[value="+v+"]").attr("selected", true);
			$("#categoryId option[value="+val+"]").attr("selected", true);
		})
	})
</script>
<script src="${BasePath}/scripts/custom/zoomify.min.js"></script>
<script type="text/javascript">
	$('.example').zoomify();
</script>

<script type="text/javascript">
	function fileupload_callback(jsonstr){
		if(jsonstr){
			var str = eval(jsonstr);
			document.form1.reset();
			document.getElementById("test").value=jsonstr;
		}	
	}
</script>

<script type="text/javascript">
	function fileupload_callback2(jsonstr){
		if(jsonstr){
			var str = eval(jsonstr);
			document.form2.reset();
			document.getElementById("test2").value=jsonstr;
		}	
	}
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>