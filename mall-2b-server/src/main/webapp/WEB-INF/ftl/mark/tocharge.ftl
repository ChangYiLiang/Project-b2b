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
	<form id="form_cl" action="chargetype.do" method="POST">
		<input type="hidden" name="userId" value="${user.id}">
		<p>充值账户：${user.username?default("")}</p>
		<p>充值金额：<input type="text" name="money" value="" id="money">&nbsp;元</p>
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
		<div>
			<button type="submit" class="btn btn-primary input">下一步</button>
			<p style="margin-top:16px">温馨提示：</p>
			<div class="div-tip">
				<ul class="body-ul2">
					<li>1. 充值成功后，余额可能存在延迟现象，一般1到5分钟内到账，如有问题，请咨询客服；</li>
					<li>2. 充值金额输入值必须是不小于0且不大于50000的正整数；</li>
					<li>3. 您可以使用支付宝进行充值，如遇到任何支付问题可以查看在线支付帮助；</li>
					<li>4. 充值完成后，您可以进入账户充值记录页面进行查看余额充值状态。</li>
				</ul>
			</div>
		</div>
		
		
		
		
	</form>
</div>

<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.other-a{color:#0099FE !important;font-size:14px;line-height:37px}
	/*弹窗css*/
	.other-body p{font-size:16px}
	.other-body p > input{border:1px solid #666;height:30px}
	.body-ul li{float:left;width:83px;height:90px;}
	.li-other{position:relative;left:-3px}
	.li-div{border:1px solid #666;height:30px;margin-top:10px;padding-left:10px}
	.li-div span{line-height:25px}
	.div-tip{width:470px;height:130px;border:1px solid #1b9d97;
			 margin-top:20px;position:relative;left:80px;top:-42px}
	.input{width:150px;color:white;border-radius:0px;margin-left:80px;margin-top:-12px}
	.body-ul2{margin-left:20px;margin-top:20px}
</style>
</@layout>