<#include "../layout.ftl">

<#macro scripts>
<script src="${BasePath}/scripts/custom/expressfee.js"></script>
</#macro>

<@layout title="新增运费模板">
<style>
.expressfeeType a{text-decoration:none;color: #1B9D97}
.expressfeeType th{text-align: center}
.expressfeeType input{width:80px;text-align: center}
.control-label {margin-left:-80px;}
.modal-content .title{background-color: #74D2D4}
.modal{right:0px;left:0px;width:800px;margin:0px auto;}
.modal-body checkbox{margin-top:-5px}
.checkbox + .checkbox{margin-top:0px}
.checkbox {margin-top:0px}
.allRegion{margin-left:-15px}
.modal-body{overflow: auto;}
.error{color:red; line-height: 34px}
</style>
<div>
	<form  class="form-horizontal" action="addtemplate.do" method="post" id="addTemplate_from">
		<div class="form-group">
			<label class="col-sm-2 control-label">模板名称：</label>
			<div class="col-sm-3">
				<input type="text" class="form-control"  id="name" name="name">
			</div>
			<div class="col-sm-3">
				<span class="error nameError"><span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">快递名称：</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="expressName" name="expressName">
			</div>
			<div class="col-sm-3">
				<span class="error expressNameError"><span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">发货地：</label>
			<div class="col-sm-3">
					<select class="form-control" name="senderProvince" id="senderProvince">
						<option value="" >--加载中--</option>
					</select>
			</div>
			<div class="col-sm-3">
				<select class="form-control" name="senderCity"  id="senderCity" >
					<option value="">--加载中--</option>
				</select>
			</div>
			<div class="col-sm-3">
				<span class="error senderProvinceError"><span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">是否包邮：</label>
			<div class="col-sm-3">
					<select class="form-control" name="expressType" id="expressType" required>
						<option value="0" >不包邮</option>
						<option value="1" >部分地区包邮</option>
						<option value="2" >全国包邮</option>
					</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">备注：</label>
			<div class="col-sm-3">
				<textarea name="remark" rows="2" class="form-control" id="remark"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="row col-sm-2 control-label">运费计算：</label>
			<div class="col-sm-3">
				<span class="error expressfeeTypeError"><span>
			</div>
		</div>
		<div class="form-group expressfeeType">
			<div class="col-sm-12">
				<table class="table table-bordered table-hover text-center">
					  <thead>
					    <tr>
					      <th width="50%">目的地</th>
					      <th width="10%">首件（件）</th>
					      <th width="10%">首费（元）</th>
					      <th width="10%">每增加件数</th>
					      <th width="15%">增加费用（元）</th>
					      <th width="5%">操作</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<tr>
					  	  <td>
					  	  	<div class="col-sm-8 col-sm-offset-2">
					  	  		<input type="hidden" class="provinceName" name="provinceName" value="">
					  	  		<span>未添加指定地区</span>
					  	  	</div>
					  	  	<div class="col-sm-2 text-right"><a class="selectRegin" href="javascript:void(0)">编辑</a></div>
					  	  </td>
					  	  <td><input type="text" class="firstCount" name="firstCount" value="1" required/></td>
					  	  <td><input type="text" class="firstFee" name="firstFee" value="0" required/></td>
					  	  <td><input type="text" class="addCount" name="addCount" value="1" required/></td>
					  	  <td><input type="text" class="addFee" name="addFee" value="0" required/></td>
					  	  <td><a href="javascript:void(0);" class="removeType">删除</a></td>
					  	</tr>
					  	<tr>
					  		<td colspan="6" class="text-center" style="height:50px;vertical-align: middle;"><a id="addType" href="javascript:addType();">增加一个</a></td>
					  	</tr>
					  </tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2 col-sm-offset-5">
				<button class="btn btn-primary" type="button" onclick="toSubmit();" style="background-color: #1B979D; margin-left:36px">确认提交</button>
			</div>
		</div>
	</form>
</div>
<#--弹窗模板-->
<div class="modal-dialog modal fade"  id="selectRegion">  
	<div class="modal-content"> 
		<div class="modal-header title">  
		 	<h3 class="modal-title">选择地区</h3>  
		</div>
		<div class="modal-body">
			<div class="col-sm-12">
				<div class="col-sm-2 checkbox allRegion">
				    <label>
				      <input class="checkAll" type="checkbox">全国
				    </label>
				</div>
			</div>
			<#list province?keys as key>
				<div class="col-sm-3 checkbox">
				    <label>
				      <input type="checkbox" class="checkProvince" value="${province['${key}']}"/>${province["${key}"]}
				    </label>
				</div>
			</#list>
		</div>  
		<div class="modal-footer"> 
			<input id="tempValue" type="hidden"> 
			<button type="button" id="selectConfirm" class="btn btn-default" data-dismiss="modal">确定</button>   
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
		</div> 
	</div> 
</div>
</@layout>			
