<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>众签注册</title>
		<#include '../_inc_head.ftl'>
		<link rel="stylesheet" type="text/css" href="${BasePath}/css/create.css"/>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
	</head>
	<body>
		<div class="create">	
			  		<div class="row">
					 		<ul id="myTab" class="nav nav-tabs ">
								<li class="active" style="margin-left:135px;">
									<a href="#qy" id="zq1" data-toggle="tab">企业合同</a>
								</li>
								<li>
									<a href="#gr" id="zq2" data-toggle="tab">个人合同</a>
								</li>
							</ul>
					 </div>
					 <div class="row">
						  <div id="myTabContent" class="tab-content">
									<div class="tab-pane fade in active" id="qy">
										 <form id="qyfm" class="form-horizontal" action="${BasePath}/zq/create.do" method="post" enctype="multipart/form-data" role="form" style="padding-top:30px;margin-left:45px;">
											  <div class="form-group">
											   <label  for="phone" class="col-sm-4 control-label">企业名称</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="userName"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">联系电话</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="telephoneNum" >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">地址</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="address" >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">企业负责人</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="principal"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">营业执照号</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="certificate"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label  for="phone" class="col-sm-4 control-label">营业执照扫描件</label>
											    <div class="col-sm-8">
											      <input style="margin-top:7px;" name="yyzz" type="file" >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">省份</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="province"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">城市</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="city"  >
											    </div>
											  </div>
											  <div class="form-group">
											   <label  for="phone" class="col-sm-4 control-label"></label>
											    <div class="col-sm-8">
											      <button type="button" onclick="submit1()" class="btn btn-primary" style="width:100px">提交资料</button>
											    </div>
											  </div>
											  
									      </form>
									</div>
									<div class="tab-pane fade" id="gr">
										 <form id="grfm" class="form-horizontal" action="${BasePath}/zq/create.do" method="post" enctype="multipart/form-data" role="form" style="padding-top:30px;margin-left:45px;">
											   <div class="form-group">
											   <label  for="phone" class="col-sm-4 control-label">姓名</label>
											    <div class="col-sm-8">
											      <input class="form-control" value="" name="userName"  >
											    </div>
											  </div>
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">联系电话</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="telephoneNum" >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">地址</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="address" >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">身份证号码</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="idCard"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">身份证正面</label>
											    <div class="col-sm-8">
											      <input style="margin-top:7px;" type="file" name="zm"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">身份证反面</label>
											    <div class="col-sm-8">
											      <input style="margin-top:7px;" type="file" name="fm" >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">省份</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="province"  >
											    </div>
											  </div>
											  
											  <div class="form-group">
											   <label   class="col-sm-4 control-label">城市</label>
											    <div class="col-sm-8">
											      <input class="form-control" name="city"  >
											    </div>
											  </div>
											  <div class="form-group">
											   <label   class="col-sm-4 control-label"></label>
											    <div class="col-sm-8">
											      <button type="button"  onclick="submit2()" class="btn btn-primary" style="width:100px">提交资料</button>
											    </div>
											  </div>
											  
									      </form>
									</div>
						  </div> 
					 </div>
		 </div>
	</body>
	<script>requirejs(['zq','core'])</script>
</html>
