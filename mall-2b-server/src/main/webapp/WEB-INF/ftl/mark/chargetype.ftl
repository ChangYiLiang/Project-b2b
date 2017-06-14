<#include "../layout.b2b.ftl">
<#assign active='b1'>
<#macro breadcrumb>
<li>个人中心</li>
<li>充值中心</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
		余额充值
	</p>	
</div>
<div class="bg-white other-body" style="min-height: 863px; padding: 10px 49px;">
	<br/>
	<p>充值账户：${user.username?default("")}</p>
	<p>充值金额：${pay!""}</p>
	<ul class="body-ul">
		<li></li>
		<li class="li-other" style="width:470px">
			<span>请注意：支持国内主流银行储蓄卡充值，在线支付成功后，充值金额会在1分钟内到账；如果需要提现，请致电九河客服办理.</span>
			<div class="li-div" style="border:1px solid #1b9d97">
			     <span class="glyphicon glyphicon-warning-sign"></span>
			     <span>客服电话：4001193389 | 0755-89257922    服务时间：周一至周五9:00~20:00</span>
			</div>
		</li>
	</ul>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<span class="sty-span">选择充值方式：</span>
	<br/>
	<br/>
	<div class="pay-big">
		<p class="bibobi"></p>
		<span class="p-1">扫码支付</span>
		<span class="p-2">手机轻松一扫，付款够方便、够快捷、够安全！</span>
		<span class="P-3"><span>充值金额：</span>${pay!""}</span>
		<br/>
		<br/>
		<ul class="pay-type">
			<li>
				<div class="zfb">
					<iframe src="toAlipay.do?qrMode=true&ChargeId=${ChargeId!""}" frameborder="0" width="210" height="210"></iframe>
				</div>
				<p>支付宝扫码支付</p>
			</li>
			<li>
				<div class="zfb">
					<img src="wxpay.do?orderId=${ChargeId!""}"  width="210" height="210">
				</div>
				<p>微信扫码支付</p>
			</li>
		</ul>
	</div>
	<div class="pay-big2">
		<p class="bibobi2"></p>
		<span class="p-1">银行卡</span>
		<span class="p-2">银行卡支付需要开通网上银行</span>
		<span class="P-4"><span>充值金额：</span>${pay!""}</span>
		<br/>
		<form action="jdpay.do" target="_blank" method="post">
			<input type="hidden" id="orderId" name="orderId" value="${ChargeId!""}" />
			<button type="submit" class="btn btn-bank">登录网上银行支付</button>
		</from>
	</div>
		
</div>

<script>
requirejs(['jquery'], function(){
	$(".bibobi").click(function(){
		$(this).toggleClass("test");
		$(".pay-type").toggleClass("test1");
		$(".pay-big").toggleClass("test2");
		$(".bibobi2").removeClass("test");
		$(".btn-bank").removeClass("test11");
		$(".pay-big2").removeClass("test22");
	});
	$(".bibobi2").click(function(){
		$(this).toggleClass("test");
		$(".btn-bank").toggleClass("test11");
		$(".pay-big2").toggleClass("test22");
		$(".bibobi").removeClass("test");
		$(".pay-type").removeClass("test1");
		$(".pay-big").removeClass("test2");
	})
	
	function f5(){
			var data={
					"Id":$("#orderId").val()
				};
			var BasePath="${BasePath}";
			var url = BasePath+"/mark/f5.do";
			$.ajax({url:url,type:"post",data:data,success:function(data){
						if(data!="false"){
							window.location.href='./usercharge.do';
						}
			        }
				});
			
	}
	setInterval(f5, 3000); 
	
});
</script>

<style>
	.bibobi,.bibobi2{width:30px;height:30px;background-image: url(${BasePath}/images/2buser/pay02.png);display:inline-block !important}
	.test{background-image: url(${BasePath}/images/2buser/pay01.png) !important}
	.test1{display:block !important;}
	.test2{border:2px solid #1b9d97 !important;height:380px !important}
	.test11{display:block !important;}
	.test22{border:2px solid #1b9d97 !important;height:120px !important}
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.other-a{color:#0099FE !important;font-size:14px;line-height:37px}
	/*弹窗css*/
	.other-body p{font-size:14px}
	.other-body p > input{border:1px solid #666;height:30px}
	.body-ul li{float:left;width:83px;height:90px;}
	.li-other{position:relative;left:-3px}
	.li-div{border:1px solid #666;height:30px;margin-top:10px;padding-left:10px}
	.li-div span{line-height:25px}
	.sty-span{font-size:14px;color:#1b9d97;margin-left:-28px}
	.pay-big,.pay-big2{width:848px;height:80px;border:0px solid #1b9d97;margin-left:-26px;padding-top:15px;padding-left:20px}
	.pay-type{display:none}
	.pay-type li{width:250px;float:left;margin-left:50px;margin-right:100px}
	.pay-type p{text-align:center}
	.zfb{border:1px solid #666 !important;border:1px solid red;padding-top:23px;padding-left:23px;padding-bottom:11px}
	.p-1{font-size:16px;color:black;padding-left:12px;position:relative;top:-20px}
	.p-2{padding-left:32px;position:relative;top:-20px}
	.P-3{font-size:16px;color:#1b9d97;padding-left:282px;position:relative;top:-20px}
	.P-4{font-size:16px;color:#1b9d97;padding-left:393px;position:relative;top:-20px}
	.pay-big2{height:120px}
	.btn-bank{background-color:#1b9d97;color:white;display:none}
	.div-tip{width:470px;height:130px;border:1px solid #1b9d97;
			 margin-top:20px;position:relative;left:80px;top:-42px}
	.input{width:150px;color:white;border-radius:0px;margin-left:80px;margin-top:-12px}
	.body-ul2{margin-left:20px;margin-top:20px}
</style>
</@layout>