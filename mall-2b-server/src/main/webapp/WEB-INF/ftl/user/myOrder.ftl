<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
  <head>
    <meta charset="utf-8" />
    <title>九河互联-会员中心首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<!--bootstrap Css核心文件-->
    <link href="${IncPath}/css/bootstrap.min.css" rel="stylesheet" />
	<!--响应式布局css文件-->
    <link href="${IncPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<!--左边选项卡布局css文件-->
    <link href="${IncPath}/css/adminia.css" rel="stylesheet" />
	<!--右边下面的头部css文件-->
    <link href="${IncPath}/css/pages/dashboard.css" rel="stylesheet" />
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/data-tables/DT_bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/font-awesome/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style.css" rel="stylesheet" type="text/css"/>
	
	<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
	<script>
		$(function(){
			$(".nav-stacked > li").children("a").hover(function(){
				if(!$(this).parent("li").hasClass("active"))
				{
					$(this).css({"background":"#0088cc","border":"1px solid #0088cc"});
				}
			},function(){
				if(!$(this).parent("li").hasClass("active"))
				{
					$(this).css({"background":"-webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%)","border":"1px solid #ccc"});
				}
			})
		})
	</script>
  </head>
<body class="page-header-fixed">

<#include "../usertop.ftl" >

<!--头部END-->

<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<#include "../userleft.ftl" >
			
			
			<div class="span9">
				
				<h1 class="page-title" style="background:#0088cc;color:white;font-size:15px;font-weight:bold">
					<i class="icon-home"></i>
					会员中心					
				</h1>
				
				<#include "../usermid.ftl" >
				
				<div class="widget widget-table">
										
					<div class="widget-header" style="background:#0088cc;border:1px solid #0088cc">
						<i class="icon-th-list"></i>
						<h3 style="color:#FFF;">订单信息</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<table class="table table-striped table-bordered table-hover" id="datatable_cl">
							<thead>
								<tr role="row" class="heading">
									<th width="1%">
										<input type="checkbox" class="group-checkable">
									</th>
									<th width="5%">
										订单ID
									</th>
									<th width="10%">
										订单类型
									</th>
									<th width="10%">
										订单状态
									</th>
									<th width="10%">
										订单价格
									</th>
									<th width="15%">
										下单时间
									</th>
									<th width="15%">
										支付时间
									</th>
									<th width="15%">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
				
				<div class="widget widget-table">
										
					<!-- /widget-content -->
				</div> <!-- /widget -->
			</div> <!-- /span9 -->
		</div> <!-- /row -->
	</div> <!-- /container -->
</div> <!-- /content -->

<style>
	.pagination{margin-left:210px;margin-top:23px}
	.dataTables_length label{position:relative;top:-31px !important}
	.fuck{display:inline-block;position:relative;top:-31px}
</style>

<#include "../userfoot.ftl" >

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
<script src="${BasePath}/scripts/custom/datatable1.js"></script>
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/order.js"></script>
<script>
	jQuery(document).ready(function() {       
	   // initiate layout and plugins
	   App.init();
	   Cl.initModal();
	   DataTableCl.init();
	});
</script>

<script>
	$(function(){
		$(".dataTables_info").wrapAll("<p class='fuck'></p>");
	})
</script>

</body>

</html>