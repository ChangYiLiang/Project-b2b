<#include '../layout.ftl'>
<#macro myheader>
<#import '../component.ftl' as com>
<style>
.help-block{color: #ff0000;} 
</style>
</#macro>

<#macro scripts>
<script src="${BasePath}/scripts/custom/address.js"></script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>我的业务</strong>
	</div>
	<div class="widget-content">
	 <form action="#" id="editAddressForm" method="POST" >
			</select>
			<br/>
			<span>选择省份:&nbsp;</span>
			<select required name="editaddress1" class="form-control" style="width:20%;" id="editaddress1" data-required-message="请选择省份.">
					<option value="">${(strarry[0])!""}</option>
			</select></br>
			<span>选择市区:&nbsp;</span>
			<select required name="editaddress2" class="form-control" style="width:20%;" id="editaddress2" data-required-message="请选择城市." >
					<option value="">${(strarry[1])!""}</option>
			</select></br>
			<span>选择县区:&nbsp;</span>
			<select required name="editaddress3" class="form-control" style="width:20%;" id="editaddress3" data-required-message="请选择市区.">
					<option value="">${(strarry[2])!""}</option>
			</select>
			<br/>
			<input type="hidden" id="editAddressid" value=${address.id}>
			待收货人：<input type="text" required data-required-message="请输入收货人名称." id="editconsigneeName" name="editconsigneeName" value="${(address.consigneeName)!''}"><br /><br />
			电话号码：<input type="text"  name="editmobile" id="editmobile"  required data-required-message="请输入手机号码." value="${(address.mobile)!''}"><br /><br />
			邮编号码：<input type="text"  id="editpostcode"  value="${(address.postcode)!''}"><br /><br />
			详细地址:<textarea name="editstreetAddress" id="editstreetAddress" class="form-control" rows="3" required data-required-message="请输入详细地址.">${(address.streetAddress)!""}</textarea>
			<br /><br />
			<label class="btn btn-primary" id=savebtn value=${address.id}>保存</label>
			<a href="${BasePath}/controller/address/toMyaddress.do" class="btn btn-primary">返回</a>
			</form>
		</div>
	
	
</@layout>