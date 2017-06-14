
<!DOCTYPE html>
<html lang="zh-CN">
<head>
		<title>${SeoInfo.title}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
		<meta content="${SeoInfo.description}" name="description"/>
		<meta content="${SeoInfo.keyword}" name="keyword"/>
		<#include '../_inc_head.ftl'>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
		<#include "../2buser/userheader.ftl">
		<link rel="stylesheet" href="${BasePath}/css/pay.css" />
</head>

<br/>
<div class="bg-white col-md-10 col-md-offset-1" style="min-height: 600px">
	<br/>
	 <div class="container">
			 <div class="row">
			 		<div class="col-md-1">
			 			 <img src="${BasePath}/images/2buser/u313.png" style="height:80px;width:80px;margin-top:5px;"/>
			 		</div>
			 		<div class="col-md-8"  style="margin-left:15px;margin-top:13px;">
			 			 <div class="row">
			 			 	<strong class="title">订单提交成功，应付金额<span class="money" >￥<span id="sum" class="money" >${payMoney!""}</span></span></strong>
			 			 </div>
			 			 <div class="row" style="border-bottom: 1px solid #E5E5E5;">
			 			 	<span>订单号:<span id="orderId">${order.id!""}</span> &nbsp;&nbsp;&nbsp;请您在提交订单后<font style="color:#1B9D97">24小时<font>内完成支付，否则订单会自动取消</span>
			 			 </div>
			 			 
			 			 <div class="row" style="margin-top:10px;">
			 			 	<span>商品:</span>
			 			 	<span>${goods.goodsName!""}&nbsp;&nbsp<font class="num">x${orderGoods.count!""}</font></span><br/>
			 			 
			 			 	<span>联系人电话：${address.mobile!""}</span><br/>
			 			 	<span>收货地址：${address.regionStructure!""}${address.streetAddress!""}</span>
			 			 </div>
			 		</div>
		  	 </div>
		  	 <br/>
		  	 <br/>
		  	 
		  	 <div class="row">
		  	 		<div class="col-md-1">
		  	 	    </div>
		  	 		<div class="col-md-2">
			  	 		<ul id="myTab" class="nav nav-tabs">
							<li class="active">
								<a href="#yue" id="pay1" data-toggle="tab">余额支付</a>
							</li>
							<li>
								<a href="#code" id="pay2" data-toggle="tab">扫码支付</a>
							</li>
							<li>
								<a href="#jdpay" id="pay3" data-toggle="tab">银联支付</a>
							</li>
						</ul>
		  	 		</div>
		  	 </div>
		  	 <div class="row">
		  	 	<div class="col-md-1">
		  	 	</div>
		  	    <div class="col-md-8">
		  	    
		  	 	<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="yue">
								<br/>
									<span class="yuee">您当前的余额为：￥<font class="yuee" id="yuee" style="color:#1B9D97">${money!'0'}</font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="${BasePath}/mark/usercharge.do">去充值</a>
								<br/>
								<br/>
									<span class="password">密码:</span>
									<input type="password" id="password" name="password"/>
									<span id="errorInfo"></span>
								<br/>
								<br>
									<button type="button" onclick="yuePay({type:1})" class="btn btn-success">立即支付</button>
							</div>
							<div class="tab-pane fade" id="code">
									<br/>
									<div class="row">
											<div class="col-md-4">
												<div class="zfb">
												<iframe src="${BasePath}/cart/toAlipay1.do?qrMode=true&orderId=${order.id}" frameborder="0" width="210" height="210"></iframe>
												</div>
												<p class="text-center">手机扫描支付宝二维码支付</p>
											</div>
											<div class="col-md-4">
												<div class="weix">
												 	<img src="${BasePath}/cart/wxpay.do?orderId=${order.id!""}"  width="200" height="200">
												</div>
												<p class="text-center">手机扫描微信二维码支付</p>
											</div>
									</div>
									<br/>
									<button type="button" id="alipayGo" class="btn btn-success">去支付宝付款</button>
							</div>
							<div class="tab-pane fade" id="jdpay">
								<form action="jdpay.do" target="_blank" method="post">
									<input type="hidden" name="orderId" value="${order.id!''}" />
									<br/><!--
									<div class="row">
											<input type="radio" name="bank" value="1025" /> 中国工商银行
											<input type="radio" name="bank" value="1051" /> 中国建设银行
											<input type="radio" name="bank" value="104" /> 中国银行
											<input type="radio" name="bank" value="103" /> 中国农业银行
											<input type="radio" name="bank" value="3080" /> 招商银行
									</div>
									<br/>-->
									<button type="submit" id="alipayGo" class="btn btn-success">登录网上银行支付</button>
								</form>
							</div>
				</div> 
		  	 </div>
		  </div>   	
    </div>
    <script>
    	function f5(){
    			var orderId = $("#orderId").html();
    			$.post("${BasePath}/cart/f5.do",{orderId:orderId},function(data){
    				if(data!='0'){
    					window.location.href='${BasePath}/cart/success.do';
    				}
    			},'json')
    	
    		}	
    </script>
	<script>requirejs(['payc','core'], function(){
			$("#alipayGo").click(function(){
				var orderId = $("#orderId").html();
				window.location.href = "${BasePath}/cart/toAlipay.do?orderId="+orderId;
			})
			
			$("#password").focus(function(){
				$("#errorInfo").html("");
			});
			
			 setInterval(f5, 3000);  
			
		})
	</script>
	
</div> 
<script type="text/javascript" src="${BasePath}/scripts/custom/mycart.js"></script>

<#include "../2bmain/footer2b.ftl">

</html>