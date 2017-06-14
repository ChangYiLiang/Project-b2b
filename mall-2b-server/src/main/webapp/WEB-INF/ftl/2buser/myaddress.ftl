<#include "../layout.b2b.ftl">
<#assign active='u6'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/address/myaddress.do">收货地址</a></li>
</#macro>
<#macro script>
requirejs(['myaddress']);
</#macro>

<@layout>
<style>
.tips{
	font-size: 16px;
	color: #FF9351;
	margin-right:50px;
}
.myAddress{
	width:400px;
	height:200px;
	margin:0px 0px 50px 50px;
	float: left;
}
</style>
<h2 class="bg-white">收货地址</h2>
<div class="bg-white other-body" style="min-height: 865px">
	</br></br>
	<div class="text-right">
		<span class="tips">您最多能添加${addressMAX!''}个收货地址~</span>
	</div>
	<br/><br/>
		<#list myaddress as address>
			<div class="myAddress">
				<div style="border: 1px solid #1B9D97; height:200px; padding: 10px;">
					<div class="from-control">
						<div class="col-md-4 text-left">
							<span>${(address.consigneeName)!""}</span>
						</div>
						<div class="col-md-8 text-right">
							<span>${(address.mobile)!""}</span>
						</div> 
					</div>
					<hr/>
					<div class="from-control text-center">
						<br/>
						<br/>
						<span>${(address.regionStructure)!""}</span>
						<br/>
						<br/>
						<span>${(address.streetAddress)!""}</span>
						<br/>
					</div>
					<#if address.isMain>
					<div id="mainAddressselected" class="col-md-offset-11" style="width:43px;height:35px; margin-top: 29px; background: url('${BasePath}/images/2buser/select_u154.png') no-repeat right center;">
					</div>
					</#if>
				</div>
				<div class="from-group addressOperate">
					<#if !address.isMain>
					<div class="col-md-5 text-left">
						<a href="javascript:;" onclick="MyApp.address.setMainAddress({id:${address.id}})">设为默认地址</a>
					</div>
					<div class="col-md-7 text-right" style="display: none">
						<a href="${BasePath}/address/editaddress.do?id=${address.id}">修改</a>&nbsp&nbsp&nbsp
						<a href="javascript:void(0);" onclick="MyApp.address.deleteAddress({id:${address.id}})">删除</a>
					</div>
					<#else>
					<div class="col-md-5 text-left">
						<strong><span style="font-size:14px ;color: #1B9D97">默认地址</span></strong>
					</div>
					<div class="col-md-7 text-right" style="display: none">
						<a href="${BasePath}/address/editaddress.do?id=${address.id}">修改</a>&nbsp&nbsp&nbsp
						<a href="javascript:void(0);" onclick="MyApp.address.deleteAddress({id:${address.id}})">删除</a>
					</div>
					</#if>
				</div>
				<br/><br/>
			</div>
		</#list>
		<#if addressCounts < 5>
			<a href="${BasePath}/address/addaddress.do">
				<div class="myAddress">
					<div style="border: 1px solid #1B9D97; height:200px;">
						<div class="text-center" style="margin-top:60px">
							<p><img src="${BasePath}/images/2buser/u142add.png"></p>
							<p style="font-size: 16px;color: #1B9D97">添加收货地址</p>
						</div>
					</div>
				</div>
			</a>
		</#if>
</div> 	
	
</div>
	<div class="clearfix"></div>
</div>

<#-- <div class="modal fade" id="confirm">  
    <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>  
        <h3 class="modal-title">提示信息</h3>  
      </div>  
      <div class="modal-body">  
      	<input id="tempData" type="hidden" value="">
        <h3 id="confirmContent"></h3>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="url"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <button id="onclickButton" onclick="" class="btn btn-primary" data-dismiss="modal">确定</button>  
      </div>  
    </div>
  </div>
</div> 	  -->

</@layout>
