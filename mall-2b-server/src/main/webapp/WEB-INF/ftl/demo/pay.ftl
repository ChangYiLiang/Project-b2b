<#include "../layout.b2b.ftl">

<@layout>
	<br />
	<br />
	<br />
	<div class="row">
		<div class="col-md-offset-2 col-md-4 text-center">
			<iframe src="alipay.do?qrMode=true" frameborder="0" width="210" height="210"></iframe>
			<p>手机扫描支付宝二维码支付</p>
			<p><button type="button" class="btn btn-primary btn-block" onclick="window.open('alipay.do')">登录支付宝支付</button></p>
			<#--
			<p><button type="button" class="btn btn-primary btn-block" onclick="window.open('refund.do')">立即申请退款</button></p>
			-->
		</div>
		<div class="col-md-4 text-center">
			<iframe src="wxpay.do" frameborder="0" width="210" height="210"></iframe>
			<p>手机扫描微信二维码支付</p>
		</div>
	</div>
	<br />
	<br />
	<br />
	<#--
	<form action="alipay.do" method="get" id="frm">
		
		<fieldset>
			<legend>支付宝支付</legend>
		</fieldset>
		<div class="form-group">
			<label class="col-md-4">订单号</label>
			<div class="col-md-6">
				<input type="hidden" value="${orderNo}" name="outTradeNo" />
				<p class="form-control-static">${orderNo}</p>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">商品名称</label>
			<div class="col-md-6">
				<input class="form-control" type="text" value="" name="subject" required data-required-message="请输入商品名称" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">商品单价</label>
			<div class="col-md-6">
				<input class="form-control" type="text" value="0.01" name="totalFee" data-number="true" data-number-message="请输入正确的价格" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">商品预览</label>
			<div class="col-md-6">
				<input type="hidden" value="http://fp.9he.com/privilege_inc/images/main/pic_1.png" name="showUrl" />
				<img src="http://fp.9he.com/privilege_inc/images/main/pic_1.png" alt="" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4">商品描述</label>
			<div class="col-md-6">
				<input type="hidden" value="这是测试专用商品" name="body" />
				<p>这是测试专用商品</p>
			</div>
		</div>
		
		<div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		    	<button type="submit" class="btn btn-primary">支付宝支付</button>
		    </div>
	  	</div>
	  	<div class="clearfix"></div>
	  	<br /><br />
	</form>
	-->
	<#--
	<script src="${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
	<script>requirejs(['demo'])</script>
	-->
</@layout>
