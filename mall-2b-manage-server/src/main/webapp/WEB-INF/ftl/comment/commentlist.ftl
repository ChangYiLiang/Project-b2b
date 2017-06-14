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
<title>九河互联 - 订单管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
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
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/jstree/dist/themes/default/style.min.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/scripts/custom/zoomify.css" rel="stylesheet" type="text/css"/>
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
					订单管理
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
								配置中心
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a>
								评价管理
							</a>
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
								<i class="fa fa-user"></i>评价管理
							</div>						
						</div>
						<div class="row">
							<div class="from-group col-md-12">
								<div class="from-group col-md-4">
								<span style="color:#DD143C; font-size: 40px;font-weight: bold;">${counts.commentDegree!''}%</span> <br/>
                        		<span>&nbsp;&nbsp;&nbsp;&nbsp;好评度</span>
								</div>
								<div class="from-group col-md-4">
								</div>
							</div>
						</div>
						
						<ul class="list-inline" style="background: #EDF2F2 none repeat scroll 0% 0%;padding: 10px 30px;margin-top: 30px">
		                    <li><a href="${BasePath}/controller/comment/list.do?pageNo=1" style="color: #1B9D97">全部评价（${counts.allCount!''}）</a></li>
		                    <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&overallComment=2" style="color: #1B9D97">好评（${counts.positiveCount!''}）</a></li>
		                    <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&overallComment=1" style="color: #1B9D97">中评（${counts.mediumCount!''}）</a></li>
		                    <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&overallComment=0" style="color: #1B9D97">差评（${counts.badCount!''}）</a></li>
		                    <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&photo=true" style="color: #1B9D97">有图（${counts.photoCount!''}）</a></li>
		                </ul>
						<div class="portlet-body">
							<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover" id="datatable_cl">
							<thead>
							<tr role="row" class="heading">
								<th width="8%">
									 综合评价
								</th>
								<th width="65%">
									 评价详情
								</th>
								<th width="10%">
									 所属用户
								</th>
								<th width="12%">
									 商品名称
								</th>
								<th width="5%">
									 操作
								</th>
							</tr>
							</thead>
							<tbody >
								<#list comments as comment>
								<tr>
									<td style="text-align:center;vertical-align:middle">
										<#list overallComment?keys as key>
										<#if key?eval == comment.overallComment>
											${overallComment[key]! ""} 
										</#if>	
										</#list> 
									</td>
									<td>
										<span class="com_connect">${comment.content! ""}</span><br>
										<span id="commentDate" style="color:#999">[${comment.commentDate?datetime }]</span><br>
										<#if comment.photos ??><br>
										<#list comment.photos as photo>
											<img class="example" style="width:100px ;height:100px" src="${IncPath}/commentImg/${photo}"></img>
										</#list><br>
										</#if>
										<#-- <#if comment.addContent ??>
											<br><span><span style="color:#999">[追加评论]:</span>&nbsp&nbsp${comment.addContent! ""}</span><br>
											<span id="commentDate" style="color:#999">[${comment.addCommentDate?datetime }]</span>
										</#if> -->
										<#if comment.replyContent ??>
											<br><span><span style="color:#999">[卖家回复]:</span>&nbsp&nbsp${comment.replyContent}</span><br>
											<span id="commentDate" style="color:#999">[${comment.replyDate?datetime }]</span>
										</#if>
									</td>
									<td style="text-align:center;vertical-align:middle">
										<span>V&nbsp${comment.userName! ""}</span>
									</td>
									<td style="text-align:center;vertical-align:middle">
										<#list goodsMap?keys as key>
											<#if key?eval == comment.goodsId>
												${goodsMap[key]! ""}
											</#if>
										</#list>
									</td>
									<td style="text-align:center;vertical-align:middle">
									<#if !comment.replyContent ??>
										<a href="${BasePath}/controller/comment/replyComment.do?id=${comment.id}&&page=${page.pageNo}" class="btn btn-primary" data-modal="true">回复</a></br></br>
									</#if>	
									<a href="${BasePath}/controller/comment/deleteComment.do?id=${comment.id}&&page=${page.pageNo}" class="btn btn-primary" data-modal="true">删除</a>
									</td>
								</tr>
								</#list>
							</tbody>
							</table>
							<nav>
							  <ul class="pagination">
							  	<#if page.pageNo != 1>
							  		<#if photo ??>
							  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&photo=${photo!''}">&laquo;</a></li>
							  		<#else>
							  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&overallComment=${overComment!''}">&laquo;</a></li>
							  		</#if>
							  	<#else>
							  		<li class="disabled"><a>&laquo;</a></li>
							  	</#if>	
							    <#list 1..page.pageCount as i>
							   	 <#if page.pageNo == i>
							   	 	<li class="active"><a >${i}</a></li>
							   	 <#else>
							   	 	<#if photo ??>
							  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&photo=${photo!''}">&laquo;</a></li>
							  		<#else>
							   	 	<li><a href="${BasePath}/controller/comment/list.do?pageNo=${i}&overallComment=${overComment!''}">${i}</a></li>
							  		</#if>
							   	 </#if>	
							    </#list>
							    <#if page.pageNo != page.pageCount>
							    	<#if photo ??>
							  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&photo=${photo!''}">&laquo;</a></li>
							  		<#else>
							    	<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo +1}&overallComment=${overComment!''}">&raquo;</a></li>
							    	</#if>
							    <#else>
							    	<li class="disabled"><a>&raquo;</a></li>
							    </#if>
							  </ul>
						</nav>							
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
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/common.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/jquery.qqFace.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/comment.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/zoomify.js"></script>
<script>
	jQuery(document).ready(function() {       
	   App.init();
	   Cl.initModal();
	   $(".example").zoomify();
	});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>