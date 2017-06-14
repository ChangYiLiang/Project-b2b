<#include "../layout.b2b.ftl">
<#assign active='b1'>
<#macro breadcrumb>
<li>个人中心</li>
<li>账户余额</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
	可用余额：<span style="color:#1b9d97;font-weight:bold;font-size:14px">￥${yue!""}</span>
	<a style="width:130px;color:white;margin-top:15px;border-radius:0px;margin-right:22px;font-weight:normal" class="pull-right other-a" href="${BasePath}/mark/userchargeinfo.do">查看充值明细>></a>
	<a style="width:130px;color:white;font-weight:normal;margin-top:15px;border-radius:0px;margin-right:36px" class="btn-primary btn pull-right" href="tocharge.do">立即充值</a>
	</p>	
</div>
<div class="bg-white other-body" style="min-height: 863px; padding: 10px 49px;">
	<ul class="nav nav-pills nav-other" style="margin-left:-14px" role="tablist">
		<li role="presentation" class="active"><a href="#cha1" role="tab" data-toggle="tab">近半年收支明细</a></li>
		<li style="border-right:0px solid red" role="presentation"><a href="#cha2" role="tab" data-toggle="tab">前半年收支明细</a></li>
	</ul>
	<hr class="charge-hr"/>
	<div class="tab-content">
	  	<div role="tabpanel" class="tab-pane active" id="cha1">
	  		<table class="table table-bordered">
				  <thead>
				    <tr class="flag-tr">
				      <th>时间</th>
				      <th>充值金额</th>
				      <th>支付方式</th>
				      <th>充值/支出单号</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<#list listafter as l>
				    <tr class="flag2-tr">
				      <td>${l.chargeSj?datetime}</td>
				      <td>￥${l.money}</td>
				      <#if l.chargeType=1>
				      		<td><span style="color:#1b9d97">支付宝</span></td>
				      <#elseif l.chargeType=2>
				      		<td><span style="color:#1b9d97">微信</span></td>
				      <#elseif l.chargeType=3>
				      		<td><span style="color:#1b9d97">网上银行</span></td>
				      <#elseif l.chargeType=4>
				      		<td><span style="color:#1b9d97">节操币兑换</span></td>
				      <#else>
				      		<td><span style="color:#1b9d97">未充值</span></td>
				      </#if>
				      <td>${l.chargeOrder}</td>
				    </tr>
				    </#list>
				  </tbody>
			</table>
	  	</div>
	  	<div role="tabpanel" class="tab-pane" id="cha2">
	  		<table class="table table-bordered">
				  <thead>
				    <tr class="flag-tr">
				      <th>时间</th>
				      <th>充值金额</th>
				      <th>支付方式</th>
				      <th>充值/支出单号</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<#list listbefore as b>
				    <tr class="flag2-tr">
				      <td>${b.chargeSj?datetime}</td>
				      <td>￥${b.money}</td>
				      <#if b.chargeType=1>
				      		<td><span style="color:#1b9d97">支付宝</span></td>
				      <#else>
				      		<td><span style="color:#1b9d97">其他</span></td>
				      </#if>
				      <td>${b.chargeOrder}</td>
				    </tr>
				    </#list>
				  </tbody>
			</table>
	  	</div>
	</div>
</div>

<!--充值弹出框-->
<!--
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">填写充值金额</h4>
		  </div>
		  <div class="modal-body" style="height:406px">
			<form id="form_cl" action="toAlipay.do" method="POST">
				<input type="hidden" name="userId" value="${user.id}">
				<p>充值账户：${user.username?default("")}</p>
				<p>充值金额：<input type="text" style="border:1px solid #1b9d97" name="money" value="" id="money">&nbsp;元</p>
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
				<p>支付方式：<img src="${BasePath}/images/2buser/zhifubao.jpg"></p>
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
		  <div class="modal-footer">
			<button style="width:150px;color:white;border-radius:0px" type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			<button style="width:150px;color:white;border-radius:0px" type="submit" class="btn btn-primary">充值</button>
		  </div>
		  </form>
		</div>
	  </div>
</div>
-->
<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.other-a{color:#0099FE !important;font-size:14px;line-height:37px}
	/*弹窗css*/
	.modal-header{background:#1b9d97;opacity:0.8}
	.modal-header h4{color:white;font-size:16px}
	.modal-body p{font-size:16px}
	.modal-body p > input{border:1px solid #666;height:30px}
	.modal-body p > img{width:150px;height:60px;border:1px solid #1b9d97}
	.body-ul li{float:left;width:83px;height:90px;}
	.li-other{position:relative;left:-3px}
	.li-div{border:1px solid #666;height:30px;margin-top:10px;padding-left:10px}
	.li-div span{line-height:25px}
	.div-tip{width:470px;height:130px;border:1px solid #1b9d97;
			 margin-top:20px;position:relative;left:80px;top:-42px}
	.body-ul2{margin-left:20px;margin-top:20px}
	/*充值信息css*/
	.flag-tr th{background-color:#F1F1F1;text-align:center;border:1px solid #F1F1F1 !important;font-size:14px}
	.flag2-tr td{text-align:center;font-size:14px;border:1px solid #F1F1F1 !important}
</style>
</@layout>