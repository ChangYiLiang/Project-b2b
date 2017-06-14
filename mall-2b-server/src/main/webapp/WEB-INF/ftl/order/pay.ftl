
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


<div class="pay-body" style="min-height: 863px; padding: 10px 49px;">
	
	<div class="pay-top">
		<span class="top-1">订单提交成功，订单号:<span id="orderId">${orderId!""}</span>，应付金额：<span class="top-2">${allPrice!""}￥</span></span>
		<br/>			
		<span class="top-3">请您在提交订单后<span class="top-4">24小时</span>内完成支付，否则订单会自动取消</span>
		<br/>
		<br/>
		<br/>
		<div class="pay-str" style="height:55px">
			<br/>
			<span class="str-1">商品名称：
				<#if goodsList?? >
	 			 	<#list goodsList as payCart>
	 			 		<#if (payCart_index>0)>
	 			 			${payCart.goodsName}x${payCart.goodnum}
	 			 		<#else>
	 			 			${payCart.goodsName}x${payCart.goodnum}
	 			 		</#if>
	 			 	</#list>
			    </#if>
		    </span>
		    <br/>
		</div>
	</div>
	<span class="sty-span">选择支付方式：</span>
	<br/>
	<br/>
	<div class="pay-big0">
		<p class="bibobi0"></p>
		<span class="p-1">余额支付</span>
		<span class="p-2 yuee">可用余额：￥<font class="yuee" id="yuee"></font></span>
		<span><a style="font-size:16px;position:relative;left:60px;top:-20px" href="${BasePath}/mark/usercharge.do">余额不足时，点击充值</a></span>
		<div class="yue-str">
			<br/>	
			<input class="pw-sty" type="password" id="password" name="password"/>
			<br/>
			<span id="errorInfo"></span>
			<br/>
			<button id="topay" type="button" onclick="yuePay({type:0})" class="btn pay-btn">立即支付</button>
		</div>			
	</div>
	<div class="pay-big">
		<p class="bibobi"></p>
		<span class="p-1">扫码支付</span>
		<span class="p-2">手机轻松一扫，付款够方便、够快捷、够安全！</span>
		<br/>
		<br/>
		<ul class="pay-type">
			<li>
				<div class="zfb">
					<iframe src="toAlipay1.do?qrMode=true&orderId=${orderId!""}" frameborder="0" width="210" height="210"></iframe>
				</div>
				<p>支付宝扫码支付</p>
			</li>
			<li>
				<div class="zfb">
					<img src="wxpay.do?orderId=${orderId!""}"  width="210" height="210">
				</div>
				<p>微信扫码支付</p>
			</li>
		</ul>
	</div>
	<div class="pay-big2">
		<p class="bibobi2"></p>
		<span class="p-1">银行卡</span>
		<span class="p-2" style="padding-left:73px">银行卡支付需要开通网上银行</span>
		<br/>
		<form action="jdpay.do" target="_blank" method="post">
			<input type="hidden" name="orderId" value="${orderId!""}" />
			<button type="submit" class="btn btn-bank">登录网上银行支付</button>
		</from>
	</div>
		
</div>

<script>
requirejs(['payc','core'], function(){
	$.post("money.do",{},function(data){
	    if(data){
	    	$("#yuee").html(data);
	    }
	},'json');
	
	$("#password").focus(function(){
		$("#errorInfo").html("");
	});
	
	function f5(){
			var data={
					"id":$("#orderId").html()
				};
			var BasePath="${BasePath}";
			var url = BasePath+"/cart/f5.do";
			$.ajax({url:url,type:"post",data:data,success:function(data){
						if(data!="false"){
							window.location.href='./success.do';
						}
			        }
				});
	}
	
	//setInterval(f5, 3000);
	 
})	
</script>
<script>
requirejs(['jquery'], function(){
	$(".bibobi0").click(function(){
		$(this).toggleClass("test");
		$(".yue-str").toggleClass("test1");
		$(".pay-big0").toggleClass("test0");
		
		$(".bibobi2").removeClass("test");
		$(".btn-bank").removeClass("test11");
		$(".pay-big2").removeClass("test22");
		$(".bibobi").removeClass("test");
		$(".pay-type").removeClass("test1");
		$(".pay-big").removeClass("test2");
		
	});
	$(".bibobi").click(function(){
		$(this).toggleClass("test");
		$(".pay-type").toggleClass("test1");
		$(".pay-big").toggleClass("test2");
		$(".bibobi2").removeClass("test");
		$(".btn-bank").removeClass("test11");
		$(".pay-big2").removeClass("test22");
		
		$(".bibobi0").removeClass("test");
		$(".yue-str").removeClass("test1");
		$(".pay-big0").removeClass("test0");
		
	});
	$(".bibobi2").click(function(){
		$(this).toggleClass("test");
		$(".btn-bank").toggleClass("test11");
		$(".pay-big2").toggleClass("test22");
		$(".bibobi").removeClass("test");
		$(".pay-type").removeClass("test1");
		$(".pay-big").removeClass("test2");
		
		$(".bibobi0").removeClass("test");
		$(".yue-str").removeClass("test1");
		$(".pay-big0").removeClass("test0");
		
	})
});
</script>

<#include "../2bmain/footer2b.ftl">
	
</html>