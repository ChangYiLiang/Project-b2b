<#include "../layout.b2b.ftl">
<#assign active='s1'>
<#macro breadcrumb>
<li>个人中心</li>
<li>申请售后</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">申请售后</p>	
</div>
<div class="bg-white other-body">
	<div class="col-md-12 bg-white">
	<div>
		
		<h4>请选择你要申请的服务类型</h4>
		
		<div style="padding:10px 0;">
			<button href="#refund" class="btn btn-default btn-lg btn-as" role="tab" data-toggle="tab">退换货</button>&nbsp;&nbsp;&nbsp;
			<button href="#repair" class="btn btn-default btn-lg btn-as" role="tab" data-toggle="tab">返修</button>
		</div>
	</div>	
		<hr />
		<div class="tab-content"">
			<div role="tabpanel" class="tab-pane active">
				<br /><br />
				<h4 class="text-center text-success">申请退换货时, 请务必先与客服人员联系.</h4>
				<br /><br /><br />
			</div>
		
			<div role="tabpanel" class="tab-pane" id="refund">
				<form class="form-horizontal apply-form" role="form" action="apply.do" method="post">
					<input type="hidden" name="aftersale.orderId" value="${order.id}" />
					<input type="hidden" name="aftersale.goodsId" value="${(goods.id)!''}" />
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">服务类型</label>
    					<div class="col-sm-4">
      						<select name="aftersale.type" id="selectType" class="form-control" required>
      							<option value="1">退款退货</option>
      							<option value="0">仅退款</option>
      							<option value="2">换货</option>
      						</select>
    					</div>
					</div>
					
					<div class="form-group">
						<label for="selectReason" class="col-sm-2 control-label">退款原因</label>
    					<div class="col-sm-4">
    						<select name="aftersale.reason" id="selectReason" class="form-control">
      							<option>损毁严重</option>
      							<option>其他</option>
      						</select>
      						
    					</div>
    					<div class="col-md-5">
    						<input type="text" name="aftersale.reason" id="inputReason" class="form-control hidden" disabled placeholder="其他原因" />
    					</div>
					</div>
					
					<div class="form-group" id="refundMoneyPanel">
						<label for="refundMoney" class="col-sm-2 control-label">退款金额</label>
    					<div class="col-md-4">
    						<input type="text" name="refund.refundMoney" class="form-control" placeholder="请输入退款金额" data-number="true" required />
    					</div>
					</div>
					
					<div id="refundMoneyPanel2">
						<input type="hidden" name="refund.refundMoney" value="${order.amount!0}" />
					</div>
					
					<div class="form-group" id="companyAddress">
						<label for="" class="col-sm-2 control-label">邮寄地址</label>
    					<div class="col-md-10">
    					<div class="addr-box">	
							<p>收件人：XXX;</p>
							<p>联系方式：133XXXXXXXX;</p>
							<p>详细地址：深圳市龙华新区明治街道1970文化产业园A栋411</p>
							<p>寄送说明：<span style="color:#1B9D97;">快递费用由用户承担，暂不支持到付。</span></p>
						</div>	
    					</div>
					</div>
					
					<div class="form-group" id="refundDesc">
						<label for="" class="col-sm-2 control-label">说明</label>
    					<div class="col-md-10">
    						<textarea name="aftersale.description" id="" class="form-control" rows="5" placeholder="简单描述下商品故障..."></textarea>
    					</div>
					</div>
					
					<#--
					<div class="form-group" id="refundGoodsQtyPanel">
						<label for="" class="col-sm-2 control-label">退货数量</label>
    					<div class="col-md-3">
    						<input type="text" name="aftersale.goodsQty" class="form-control" placeholder="请输入退货数量" data-number="true" required />
    					</div>
					</div>
					
					<div class="form-group" id="exchangeGoodsQtyPanel">
						<label for="" class="col-sm-2 control-label">换货数量</label>
    					<div class="col-md-3">
    						<input type="text" name="aftersale.goodsQty" class="form-control" placeholder="请输入换货数量" data-number="true" required />
    					</div>
					</div>
					
				-->
					
					<div class="form-group" id="refundFiles">
						<label for="type" class="col-sm-2 control-label">上传凭证</label>
    					<div class="col-md-4">
    						<button type="button" class="btn btn-primary" onclick="document.getElementById('uploadfile').click()">选择凭证 ...</button>
    						<input type="hidden" name="aftersale.file" />
    						<span class="fileLabel">尚未选择凭证</span>
    					</div>
					</div>
					
					<div class="form-group">
						<label for="type" class="col-sm-2 control-label">&nbsp;</label>
    					<div class="col-md-4">
    						<button type="submit" class="btn btn-primary">提交申请</button>
							<button type="reset" class="btn">撤销返回</button>
    					</div>
					</div>
					
					
				</form>
			</div>
			<div role="tabpanel" class="tab-pane" id="repair">
				<form class="form-horizontal apply-form" role="form" action="apply.do" method="post">
					<input type="hidden" name="aftersale.orderId" value="${order.id}" />
					<input type="hidden" name="aftersale.goodsId" value="${(goods.id)!''}" />
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">服务类型</label>
    					<div class="col-sm-3">
							<input type="hidden" name="aftersale.type" value="3" />
      						<p class="form-control-static">返修</p>
    					</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">联系人</label>
    					<div class="col-md-6">
    						<input type="text" name="shipping.contact" class="form-control" placeholder="请输入联系人" />
    					</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">联系电话</label>
    					<div class="col-md-6">
    						<input type="text" name="shipping.phone" class="form-control" placeholder="请输入联系电话" />
    					</div>
					</div>
					
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">邮寄地址</label>
    					<div class="col-md-10">
    					<div class="addr-box">	
							<p>收件人：XXX;</p>
							<p>联系方式：133XXXXXXXX;</p>
							<p>详细地址：深圳市龙华新区明治街道1970文化产业园A栋411</p>
							<p>寄送说明：<span style="color:#1B9D97;">快递费用由用户承担，暂不支持到付。</span></p>
						</div>	
    					</div>
					</div>
					
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">说明</label>
    					<div class="col-md-10">
    						<textarea name="aftersale.description" id="" class="form-control" rows="5" placeholder="简单描述下商品故障..."></textarea>
    					</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">上传凭证</label>
    					<div class="col-md-4">
    						<button type="button" class="btn btn-primary">选择凭证 ...</button>
    						<input type="hidden" name="aftersale.file" />
    						<span class="fileLabel">尚未选择凭证</span>
    					</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">&nbsp;</label>
    					<div class="col-md-4">
    						<button type="submit" class="btn btn-primary">提交申请</button>
							<button type="submit" class="btn">撤销返回</button>
							
    					</div>
					</div>
					
					
				</form>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<br />
	<div class="col-md-12 bg-white">
		<#include '_inc_readme.ftl'>
	</div>
					
	<iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
	<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
		<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
		<input type="file" name="file" id="uploadfile" multiple onchange="document.getElementById('uploadform').submit()" accept="image/*" />
	</form>	

	
</div>



<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.btn-as, .btn-as-active{ width:120px; height:48px; border:1px solid #ccc; background:none;background-color:#fff; font-size:14px; }
	.btn-as:hover, .btn-as-active:hover{ background-color:#eaf8ff;}
	.btn-as:active, .btn-as-active:active{ background-color:#eaf8ff;background-image:url(../images/2bmain/u156.png); 
	background-repeat:no-repeat; background-position: bottom right;}
	.btn-as:focus, .btn-as-active:focus{ background-color:#eaf8ff;background-image:url(../images/2bmain/u156.png); 
	background-repeat:no-repeat; background-position: bottom right;}
	.btn-as-active{  background-image:url(../images/2bmain/u156.png); 
	background-repeat:no-repeat; background-position: bottom right;}
	
	.addr-box{ padding:20px; background-color:#ecebf0;}
  
	
</style>
</@layout>

<#macro script>
	requirejs(['afs'], function(afs){
		afs.initApplyForm('.apply-form');
	});
	window.fileupload_callback = window["fileupload_callback"] || function(data) {
		var data = eval(data);
		for(var i=0; i<data.length; i++) {
			var file = data[i];
			$(".active [name=aftersale\\.file]").val(file);
			$(".active .fileLabel").text("已上传凭证");
		}
	}
</#macro>