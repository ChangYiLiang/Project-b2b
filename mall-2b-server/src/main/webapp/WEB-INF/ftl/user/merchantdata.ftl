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
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<script>
	$(function() {
		$(".nav-stacked > li")
				.children("a")
				.hover(
						function() {
							if (!$(this).parent("li").hasClass("active")) {
								$(this).css({
									"background" : "#0088cc",
									"border" : "1px solid #0088cc"
								});
							}
						},
						function() {
							if (!$(this).parent("li").hasClass("active")) {
								$(this)
										.css(
												{
													"background" : "-webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%)",
													"border" : "1px solid #ccc"
												});
							}
						})
	})
</script>
</head>
<body class="page-header-fixed">
<#import '../component.ftl' as com>

	<#include "../usertop.ftl" >

	<div id="content">

		<div class="container">

			<div class="row">

				<!--左边选项卡-->
				<#include "../userleft.ftl" >

				<!--左边选项卡END-->

				<div class="span9">

					<h1 class="page-title"
						style="background:#0088cc;color:white;font-size:15px;font-weight:bold">
						<i class="icon-home"></i> 会员中心
					</h1>

					<#include "../usermid.ftl" >

					<div class="widget widget-table">

						<div class="widget-header"
							style="background:#0088cc;border:1px solid #0088cc">
							<i class="icon-th-list"></i>
							<h3 style="color:#FFF;">我的资料</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">


							<!-- 我的资料  -->
							

							<form action="editUser.do" id="userdata" class="form-horizontal"
								method="post">
								<input type="hidden" name="id" value=${user.id}>
								<h4>我的资料</h4>
								<hr />
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label">企业用户名</label>
										<div class="controls">
											<p class="form-control-static" name="username">${(user.username)!""}</p>
										</div>
									</div>
									<div class="span6">
										<label class="control-label">联系人</label>
										<div class="controls">
											<p class="form-control-static" name="gender"><@com.gender
												user.gender/></p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">联系电话</label>
										<div class="controls">
											<p class="form-control-static" name="firstName">${(user.nickName)!""}</p>
										</div>
									</div>
									<div class="span6">
										<label class="control-label col-md-4">邮箱</label>
										<div class="controls">
											<p class="form-control-static" name="email">${(user.email)!" "}</p>
										</div>
									</div>
								</div>
						
						
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">手机号码 </label>
										<div class="controls">
											<p class="form-control-static" name="mobile">${(user.mobile)!""}</p>
										</div>
									</div>
									<div class="span6">
										<label class="control-label col-md-4">证件号码</label>
										<div class="controls">
											<p class="form-control-static" name="certificateNo">${(user.certificateNo)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">QQ号码</label>
										<div class="controls">
											<p class="form-control-static" name="qq">${(user.qq)!""}</p>
										</div>
									</div>
									<div class="span6">
										<label class="control-label col-md-4">微信号码</label>
										<div class="controls">
											<p class="form-control-static" name="wechat">${(user.wechat)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									
									<div class="span6">
										<label class="control-label col-md-4">Facebook</label>
										<div class="controls">
											<p class="form-control-static" name="facebook">${(user.facebook)!""}</p>
										</div>
									</div>
									<div class="span6">
										<label class="control-label col-md-4">Google</label>
										<div class="controls">
											<p class="form-control-static" name="google">${(user.google)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">语言</label>
										<div class="controls">
											<p class="form-control-static" name="locale">${(user.locale)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">安全问题1</label>
										<div class="controls">
											<p class="form-control-static" name="scurityQusetion1">${(user.scurityQusetion1)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">安全问题1答案</label>
										<div class="controls">
											<p class="form-control-static" name="scurityAnswer1">${(user.scurityAnswer1)!""}</p>
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">安全问题2</label>
										<div class="controls">
											<p class="form-control-static" name="scurityQusetion2">${(user.scurityQusetion2)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">安全问题2答案</label>
										<div class="controls">
											<p class="form-control-static" name="scurityAnswer2">${(user.scurityAnswer2)!""}</p>
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">安全问题3</label>
										<div class="controls">
											<p class="form-control-static" name="scurityQusetion3">${(user.scurityQusetion3)!""}</p>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<label class="control-label col-md-4">安全问题3答案</label>
										<div class="controls">
											<p class="form-control-static" name="scurityAnswer3">${(user.scurityAnswer3)!""}</p>
										</div>
									</div>
								</div>


								<div class="row-fluid">
									<div class="form-group">
										<label class="control-label col-md-2"></label>
										<div class="col-md-4">
											<#--<input type="submit" value="保存" class="btn btn-primary btn-lg" />--> 
											<input type="submit" id="useredit" class="btn btn-primary" value="编辑" />
										</div>
									</div>
								</div>
							</form>

							<!-- 我的资料END  -->


						</div>
						<!-- /widget-content -->
					</div>
					<!-- /widget -->

				</div>
				<!-- /span9 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /content -->
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
	<script src="${IncPath}/assets/scripts/core/datatable.js"></script>
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
</body>

</html>