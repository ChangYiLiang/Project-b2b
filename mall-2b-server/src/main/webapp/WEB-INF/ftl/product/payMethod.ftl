<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>九河互联-有节操</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<link rel="shortcut icon" href="favicon.ico"/>
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<!--font-awesome 核心我CSS 文件-->
<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 在bootstrap.min.js 之前引入 -->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="${BasePath}/scripts/custom/laydate.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css"/> -->
<link rel="stylesheet" type="text/css" href="${IncPath}/css/mallcheckout.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
.bg-addr{background:url(${IncPath}/images/address.gif) no-repeat;}
.table-condensed{background-color: #ffffff;}
</style>

<!--[if lt IE 9]>
  <link rel="stylesheet" href="${BasePath}/css/bsie.css" />
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="${BasePath}/css/IE8.js"></script>
<![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!--[if IE 7]><body class="ie7"><![endif]-->
<!--[if IE 8]><body class="ie8"><![endif]-->
<!--[if IE 9]><body class="ie9"><![endif]-->
<!--[if !IE]>-->
<body>
<!--<![endif]-->
<#include "../idcheader.ftl" >
<div class="div-check">
	 <#if goods.ifIdc==true>
	    <br/>
		<div class="check-addr">
			<ul class="list-group">
				  <li class="list-group-item" style="background-color:#428bca;border:1px solid #428bca;color:white">收货人地址</li>
				  <button type="button" class="btn btn-primary addr-btn" data-toggle="modal" data-target="#myModal">+&nbsp;添加收货人</button>
				 <#if  address ?? && (address?size > 0)>
				  <button type="button" class="btn btn-primary addr-btn" data-toggle="modal" data-target="#myModal3" style="position:relative;left: 500px;">删除地址</button>
				 </#if>
			</ul>
		<#if address ??>
			<ul class="addr-list">
			<#list address as addr>
				<#if addr.isMain==true>
				<li class="bg-addr">
					<ul class="addr-info">
						<li>${addr.consigneeName!''}</li>
						<li>${addr.regionStructure!''}</li>
						<li>${addr.streetAddress!''} </li>
						<li>${addr.mobile!''}---*默认地址</li>
					</ul>
					<input type="hidden" value="${addr.id}">
				</li>
				<#else>
				<li>
					<ul class="addr-info">
						<li>${addr.consigneeName!''}</li>
						<li>${addr.regionStructure!''}</li>
						<li>${addr.streetAddress!''} </li>
						<li>${addr.mobile!''}</li>
					</ul>
					<input type="hidden" value="${addr.id}">
				</li>
				</#if>
			</#list>
			</ul>
		</#if>
		</div>
	 </#if>
		<!-- 添加收货人地址弹窗BEGIN -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">添加收货人</h4>
			  </div>
			  <form action="#" id="addAddress" method="POST" autocomplete="off">
			  	  <style>
				  	.modal-body span{color:black}
				  	.modal-body .help-block{color: #ff0000} 
				  </style>
			  <div class="modal-body">
					<select name="address1" class="form-control" id="address1" required >
						<#list regions as region>
						<option value="${region.id}" selected>${region.regionName}</option>
						</#list>
					</select>
					<br/>
					<select name="address2" class="form-control" id="address2" required  >
						<option value="">--加载中--</option>
					</select>
					<br/>
					<select name="address3" class="form-control" id="address3" required >
						<option value="">--加载中--</option>
					</select>
					<br/>
					<li class="list-group-item">
							<span>详细地址：</span>
								<textarea name="streetAddress" id="streetAddress" class="form-control" rows="3" required ></textarea>
					</li>
					<li class="list-group-item">
						<span>收货人名称：</span>
						<input type="text" class="form-control2" name="consigneeName" id="consigneeName" required >
					</li>
					<li class="list-group-item">
						<span>手机号：</span>
						<input type="text" class="form-control2" name="mobile" id="mobile" required data-regex="^1[34578][0-9]{9}$" >
					</li>
					<li class="list-group-item">
						<span>邮编：</span>
						<input type="text" class="form-control2" name="postcode" id="postcode"  data-number="true" >
					</li>					
					
			  </div>
			 	 <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
					<button type="submit" class="btn btn-primary">添加</button>
			  	</div>
			  </form>
			</div>
		  </div>
		</div>
		<!--END-->
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">删除地址</h4>
			 </div>
			  <form action="#" id="deleteAddress" method="POST" autocomplete="off">
			  <div class="modal-body">
					<h4>确定要删除该地址吗?(默认地址不可删除)</h4>
			  </div>
			  <input type="hidden" id="deaddress" name="deaddress"/>
			 	 <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton2">关闭</button>
					<button type="submit" class="btn btn-primary">删除</button>
			  	</div>
			  </form>
			</div>
		  </div>
		</div>
		<br/>
		<br/>
		<div class="check-three">
			<ul class="list-group">
				  <li class="list-group-item" style="background-color:#428bca;border:1px solid #428bca;color:white">订单结算</li>
				  <li class="list-group-item">
				  <a class="btn btn-primary" id="goodsdetails" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					${goods.goodsName!''}
				  </a>
				  <style>
				  	.well span{color:black}
				  </style>
					<div class="collapse" id="collapseExample">
					  <div class="well">
					 <#if  orderdetail ?? && (orderdetail?size > 0)>
					  <#if order.type2==0>
					  <span>  型号：${orderdetail.modelName!'联系客服!'} <span><br/>
					  <span>  CPU：${orderdetail.cpuCount!'联系客服!'} <span><br/>
					  <span>  内存：${orderdetail.ramSize!'联系客服!'} <span><br/>
					  <span>  硬盘容量：${orderdetail.hddSize!'联系客服!'} <span><br/>
					  <span>  公网ip：${orderdetail.ipCount!'联系客服!'}个 <span><br/>
					  <span>  网络带宽：${orderdetail.bandwidth!'联系客服!'} <span><br/>
					  <span>  操作系统：${orderdetail.os!'联系客服!'} <span><br/>
					  </#if>
					  <#if order.type2==3>
					  <span>  托管规格：${orderdetail.trusteeshipSize!'联系客服!'} <span><br/>
					  <span>  机柜功率：${orderdetail.power!'联系客服!'} <span><br/>
					  <#if orderdetail.hddSize ??>
					 	 <span>  线路：${orderdetail.hddSize!'联系客服!'} <span><br/>
					  </#if>
					  <span>  国际带宽：${orderdetail.bandwidth!'联系客服!'} <span><br/>
					  <span>  公网ip：${orderdetail.ipCount!'联系客服!'}个 <span><br/>
					  </#if>
					  <#if order.type2==1>
					  <span>  防御峰值：${orderdetail.maxDefense!'联系客服!'} <span><br/>
					  <span>  CPU核数：${orderdetail.cpuCount!'联系客服!'} <span><br/>
					  <span>  内存：${orderdetail.ramSize!'联系客服!'} <span><br/>
					  <span>  硬盘容量：${orderdetail.hddSize!'联系客服!'} <span><br/>
					  <span>  公网ip：${orderdetail.ipCount!'联系客服!'}个 <span><br/>
					  <span>  网络带宽：${orderdetail.bandwidth!'联系客服!'} <span><br/>
					  <span>  操作系统：${orderdetail.os!'联系客服!'} <span><br/>
					  </#if>
					  <#if order.type2==2>
					  
					  </#if>
					  </#if>
					  <#if order.type2==4>
					  	 <#list items as item>
					  	 	<span>  ${item.title} <span><br/>
					  	 </#list>
					  </#if>
					  </div>
					</div>
				  </li>
				  <#if goods.ifIdc!=true>
				  <li class="list-group-item">购买时长:<p class="navbar-right">${ORDER_ORDERCYCLE_MAP["${orderGoods.orderCycle}"]}&nbsp;&nbsp;&nbsp;</p></li>
				  </#if>
				  <li class="list-group-item">购买台数:<p class="navbar-right">${orderGoods.count}台&nbsp;&nbsp;&nbsp;</p></li>
				  <li class="list-group-item">购买总价:<p class="navbar-right">${order.amount?string.currency}&nbsp;&nbsp;&nbsp;</p></li>
				  <li class="list-group-item">
					<div class="checkbox" style="font-size: 14px;font-weight: bold;"> 
					<label><input type="checkbox" name="accepttos" id="accepttos"> 我已经阅读并同意该服务条款 <a href="http://www.9he.com.com" target="_blank">服务条款</a></label>
					</div>
				  </li>
			</ul>
		</div>
	<form action="${BasePath}/controller/product/alipay.do" id="zfb" method="POST" autocomplete="off" target="_blank">
		<#if  goods.ifIdc==true> 
			<input type="hidden" name="addressId" id="addressId" value="" required>
		</#if>
		<input type="hidden" name="orderId" id="orderId" value ="${order.id}" required>
		<div class="check-pay">
			<ul class="list-group">
				  <li class="list-group-item" style="background-color:#428bca;border:1px solid #428bca;color:white">支付方式</li>
			</ul>
			<ul class="pay-list">
                <li id="zfbbb"><img src="${IncPath}/images/pay_3.jpg"></li>
                <li id="xpay"><img src="${IncPath}/images/pay_2.jpg" ></li>
                
			</ul>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<button class="form-control btn-primary" type="submit" style="display:none" id="pay-zfb" name="pay-zfb" onclick="javascript:doSubmit();">确认付款</button>
		</div>
	</form>
		
		<!--外面的弹窗线下支付BEGIN-->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
				<div class="modal-content">
				  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="resetbutton"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">添加线下支付信息</h4>
				  </div>
				<form action="#" id="xxpay" method="POST" autocomplete="off">
				  <div class="modal-body">
					<#if  goods.ifIdc==true> 
						<input type="hidden" name="address" id="address" value="" required >
					</#if>
					<input type="hidden" name="orderId" id="orderId" value ="${order.id}" >
						<li class="list-group-item">
							<span>付款金额：</span>
							<input type="text" class="form-control2" name="bankMoney" id="bankMoney" required data-number="true" date-maxlenght="6">
						</li>
						<li class="list-group-item">
							<span>付款姓名：</span>
							<input type="text" class="form-control2" name="payName" id="payName" required >
						</li>
						<li class="list-group-item">
							<span>付款银行：</span>
<!-- 							<input type="text" class="form-control2" name="payBank" id="payBank" required > -->
							<select class="form-control2" name="payBank" id="payBank" required>
								<option value="中国银行">中国银行</option>
								<option value="中国工商银行">中国工商银行</option>
								<option value="中国建设银行">中国建设银行</option>
								<option value="中国银行">中国银行</option>
								<option value="中国农业银行">中国农业银行</option>
								<option value="交通银行">交通银行 </option>
								<option value="招商银行">招商银行</option>
								<option value="中国邮政银行">中国邮政储蓄银行</option>	
								<option value="中信银行">中信银行</option>
								<option value="光大银行">光大银行</option>
								<option value="民生银行">民生银行</option>
								<option value="兴业银行">兴业银行</option>
								<option value="华夏银行">华夏银行</option>
								<option value="上海浦东银行">上海浦东发展银行</option>
								<option value="深圳发展银行">深圳发展银行</option>
								<option value="广东发展银行">广东发展银行</option>
								<option value="上海银行">上海银行</option>
								<option value="平安银行">平安银行</option>
								<option value="其他银行">其他银行</option>
							</select>             
						</li>                        
						<li class="list-group-item">
							<span>付款账号：</span>       
							<input type="text" class="form-control2" name="bankNumber" id="bankNumber" required data-number="true">
						</li>
						<li class="list-group-item">
							<span>付款时间：</span>
							<input type="text" class="form-control2" id="receiptTime" name="receiptTime" required onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
						</li>
						<li class="list-group-item">
							<span>收款方银行：</span>
							<select class="form-control2" name="payment" id="payment" required >
									<option value="10017">现金付款</option>
									<option value="10026">企业支付宝账号:DS@9he.com</option>
									<option value="10030">淘宝C店:welcome.cwt@163.com</option>
									<option value="10032">支付宝（刘水平）账号(pay@9he.com)</option>
								
									<option value="10033">招商银行（刘水平）卡号：6214836557143027</option>
								
									<option value="10034">农业银行（刘水平）卡号：6228480128302877476</option>
								
									<option value="10035">建设银行（刘水平）卡号：6217007200023767372</option>
								
									<option value="10036">工商银行（刘水平）账 号：6212264000036469514</option>
								
									<option value="10037">工商银行（公司账户）卡号：4000031939200266484</option>
								
									<option value="10038">工商银行（公司一般户）卡号：4000053019100131473</option>
								
									<option value="10039">ThinkDream Technology Limited:697068112838HSBC account</option>
									
							</select>
						</li>
						<li class="list-group-item">
							<span>流水号：</span>
							<input type="text" class="form-control2" name="invoiceNum" id="invoiceNum" >
						</li>
						<li class="list-group-item">
							<span>备注：</span>
								<textarea name="clientRemark" id="clientRemark" class="form-control" rows="3"  style="position:relative;left:45px;top:-22px;width: 450px;"></textarea>
							<p>提交付款信息后，请您联系系统管理员。</p>
						</li>
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton1">关闭付款</button>
					<button type="submit" class="btn btn-primary">确认付款</button>
				  </div>
				  </form>
				</div>
			  </div>
		</div>
			<!--外面的弹窗END-->
	</div>
<#include "../idcfooter.ftl" >


<!-- <script src="${IncPath}/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" type="text/javascript"></script> -->
<!-- <script src="${IncPath}/assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script> -->

<script src="${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>

<script src="${IncPath}/assets/scripts/core/app.js"></script>
<script src="${BasePath}/scripts/custom/cl.js"></script>
<script src="${BasePath}/scripts/custom/common.js"></script>
<script src="${BasePath}/scripts/custom/pay.js"></script>
<script src="${BasePath}/scripts/custom/region.js"></script>
<script>
    jQuery(document).ready(function() {
       FormCl.init();
       FormCl1.init();
       FormCl2.init();
       $("#goodsdetails").click();
    });
</script>

</body>

</html>