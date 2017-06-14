<#include "../layout.b2b.ftl">
<#assign active='b5'>
<#macro breadcrumb>
	<li>个人中心</li>
	<li>推荐返利</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
		推荐返利
	</p>	
</div>

<div class="bg-body bg-white other-body" style="min-height: 865px; padding: 14px 49px;">
	
	<img width="870px" src="${BasePath}/images/2bcatmain/jianshe.png">
	<!--
	<table class="table table-bordered">
		  <thead>
		    <tr>
		      <th class="tb-top" colspan="4">
			      <span>2016-10-30   23:12:34</span>
			      <span>|</span>
			      <span>Ann</span>
			      <span>|</span>
			      <span>退款编号：1161004700002366</span>
			      <span>|</span>
			      <span>线上支付</span>
			      <span class="tb-span">订单金额：<span class="tb-span2">5999</span>元</span>	
		      </th>
		    </tr>
		  </thead>
		  <tbody>
		  	<tr class="tb-body">
		  		<td class="tr1" width="40%">
		  			<img src="">
		  			<span>戴尔R230</span><br/><span class="flag-sp">5999×1</span>
		  		</td>
		  		<td class="tr2" width="20%">退款退货</td>
		  		<td class="tr3" width="20%">待买家发货<br/>还剩1天17时27分</td>
		  		<td class="tr4" width="20%">服务详情<br/>和我联系</td>
		  	</tr>
		  </tbody>
	</table>
	-->
</div>
<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.table{width:850px}
	.tb-top{height:50px;border:1px solid #93d9d6 !important;background:#eaf8ff;line-height:30px !important}
	.tb-top span{font-size:14px;font-weight:normal;margin-left:15px}
	.tb-span{margin-left:130px !important}
	.tb-span2{margin-left:2px !important;color:#1b9d97;font-weight:bold !important;font-size:17px !important}
	.tr1 img {border:1px solid #ccc;width:110px;height:80px;margin-top:16px;margin-left:17px}
	.tr1 span{margin-left:15px;font-size:14px;color:black}
	.flag-sp{color:#bbb !important;font-size:12px !important;position:relative;left:132px;top:-33px}
	.tr2{color:red;text-align:center;font-size:14px;vertical-align:middle !important}
	.tr3{color:#83c44e;text-align:center;font-size:14px;vertical-align:middle !important}
	.tr4{color:red;text-align:center;font-size:14px;vertical-align:middle !important}
	.tb-body > td{border-top:0px solid #ccc;height:130px}
</style>
</@layout>