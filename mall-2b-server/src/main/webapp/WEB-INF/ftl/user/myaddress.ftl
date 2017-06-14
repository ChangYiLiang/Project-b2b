<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
<style>
	.addr-list{margin-left:40px}
	.addr-list > li{float:left;width:350px;height:215px;margin-bottom:50px;border-radius:5px;border:1px solid #ccc;margin-right:50px}
	.addr-list > li > div{width:350px;height:215px;}
	.bg-addr{background:url(${IncPath}/images/address.gif) no-repeat;background-size:100% 100%;}
	.addr-info{margin-left:15px;margin-top:15px}
	.addr-info li{margin-bottom:5px}
	.help-block{color: #ff0000;} 
</style>
</#macro>

<#macro scripts>
	<script src="${BasePath}/scripts/custom/order.js"></script>
	<script src="${BasePath}/scripts/custom/address.js"></script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>我的地址</strong>
	</div>
	<div class="widget-content" >
		<!-- 地址管理  -->
		<div class="form-horizontal" >
			<ul class="list-group pager">
				<br/>
				<button type="button" class="btn btn-primary addr-btn add-addr" data-toggle="modal" data-target="#myModal" style="margin-bottom:15px">+&nbsp;添加收货地址</button>
				<br/>
				<label class="label-default" style="background-color: #ffffff"><h3>您已创建${addressCounts}个收货地址，最多可创建${addressMAX}个<h3></label>
			</ul>
		</div>
		
		<ul class="addr-list">
		<#list myaddress as address>
			<#if address.isMain>
				<li class="bg-addr">
			<#else>
				<li>
			</#if>
				<ul class="addr-info">
					<li>收货人：${(address.consigneeName)!""}</li>
					<li>所在地区：${(address.regionStructure)!""}</li>
					<li>地址：${(address.streetAddress)!""}</li>
					<li>手机号码：${(address.mobile)!""}</li>
					<li>邮编：${(address.postcode)!""}</li>
					<li>
					<#if !address.isMain>
						<label class="btn btn-primary" name="setmain" data="${address.id}">设为默认</label>
					</#if>	
						<label class="btn btn-primary" name="editAddress" data="${address.id}">编辑地址</label>
						<label class="btn btn-primary" name="delete" data="${address.id}">删除地址</label>
					</li>
				</ul>
			</li>
			
		</#list>
		</ul>
		
		<!-- 添加收货人地址弹窗BEGIN -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">添加收货人</h4>
				  </div>
				  <form action="#" id="addAddressForm" method="POST" autocomplete="off" >
				  <div class="modal-body">
				  		<span>选择省份：</span>
						<select name="address1" class="form-control" id="address1" required data-required-message="请选择省份.">
							<option value="" >--加载中--</option>
						</select>
						<br/>
						<span>选择城市：</span>
						<select name="address2" class="form-control" id="address2" required data-required-message="请选择城市.">
							<option value="">--加载中--</option>
						</select>
						<br/>
						<span>选择市区：</span>
						<select name="address3" class="form-control" id="address3" required data-required-message="请选择市区." >
								<option value="">--加载中--</option>
						</select>
						<br/>
						<li class="list-group-item">
								<span>待收货人：</span>
								<input type="text" class="form-control2" name="consigneeName" id="consigneeName" required data-required-message="请输入收货人名称.">
						</li>
						<li class="list-group-item">
								<span>手机号码：</span>
								<input type="text" class="form-control2 mobile" name="mobile" id="mobile" required data-required-message="请输入手机号码.">
						</li>
						<li class="list-group-item">
								<span>联系方式：</span>
								<input type="text" class="form-control2" name="phone" id="phone" required data-required-message="请输入联系方式.">
						</li>
						<li class="list-group-item">
								<span>邮编号码：</span>
								<input type="text" class="form-control2" name="postcode" id="postcode" required data-required-message="请输入邮编号码." date-number="true" >
						</li>
						<li class="list-group-item">
								<span>详细地址：</span>
							<textarea name="streetAddress" id="streetAddress" class="form-control" rows="3" required data-required-message="请输入详细地址."></textarea>
						</li>
				  </div>
				 	 <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
						<button type="button" class="btn btn-primary" id="addaddress">添加</button>
				  	</div>
				  </form>
				</div>
			  </div>
			</div>
			<!--添加收货地址END-->
		</div>
	
</@layout>