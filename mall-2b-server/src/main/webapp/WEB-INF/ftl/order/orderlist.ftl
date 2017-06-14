<#include "../layout.b2b.ftl">
<#assign active='o1'>

<#macro script>
requirejs(['order']);
</#macro>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/order/tomyorder.do">我的订单</a></li>
</#macro>

<@layout>
	<h2 class="bg-white">我的订单</h2>
	<div class="bg-white other-body" style="min-height: 865px; padding: 10px 31px;">
	<ul class="nav nav-pills nav-other">
		<li ${page.state!"class='active'"}><a href="${BasePath}/controller/order/tomyorder.do">全部订单</a></li>
		<#if page.state ??>
		<li <#if page.state == 0>class="active"</#if>><a href="${BasePath}/controller/order/tomyorder.do?state=0" >待支付</a></li>
		<li <#if page.state == 6>class="active"</#if>><a href="${BasePath}/controller/order/tomyorder.do?state=6" >待收货</a></li>
		<li <#if page.state == 4>class="active"</#if>><a href="${BasePath}/controller/order/tomyorder.do?state=4" >已取消</a></li>
		<li style="border-right:0px solid red" <#if page.state == 7>class="active"</#if>><a href="${BasePath}/controller/comment/uncommentlist.do">待评价</a></li>
		<#else>
		<li><a href="${BasePath}/controller/order/tomyorder.do?state=0" >待支付</a></li>
		<li><a href="${BasePath}/controller/order/tomyorder.do?state=6" >待收货</a></li>
		<li><a href="${BasePath}/controller/order/tomyorder.do?state=4">已取消</a></li>
		<li style="border-right:0px solid red"><a href="${BasePath}/controller/comment/uncommentlist.do">待评价</a></li>
		</#if>
	</ul>
	<hr class="order-hr"/>
	<#if orderList ?? && (orderList?size>0)>
	<#list orderList as order>
		<div class="row bg-white order-div">
			<#if order.state == 6>
				<div class="col-md-12" style="padding: 18px;border: 1px solid #999;border-bottom-width: 0px ;background-color: #F8E5DA;">
			<#elseif order.state == 0>
				<div class="col-md-12" style="padding: 18px;border: 1px solid #999;border-bottom-width: 0px ;background-color: #EAF8FF;">
			<#elseif order.state == 4>
				<div class="col-md-12" style="padding: 18px;border: 1px solid #999;border-bottom-width: 0px ;background-color: #F1F1F1;">
			<#else>
				<div class="col-md-12" style="padding: 18px;border: 1px solid #999;border-bottom-width: 0px ;background-color: #E3E3E3;">
			</#if>
				<div class="row col-md-12">
					<h4>
					<#list orderState?keys as key>
						<#if order.state == key?eval>
							&nbsp&nbsp&nbsp${orderState[key]}
						</#if>
					</#list>
					</h4>
				</div>
				<div class="row col-md-12">
					<div class="col-md-8">
						<span>${order.createdDate?datetime} &nbsp|&nbsp ${order.userName!''}  &nbsp|&nbsp 订单号：${order.id!''}</span>
					</div>
					<div class="col-md-3 col-md-offset-1">
						<span>订单金额：<span style="color: #1B9D97;font-size: 20px">${order.amount!''}</span>元</span>
					</div>
				</div>
			</div>
			<div class="col-md-12 order-goodsDiv" style="padding: 0px;border: 1px solid #999">
				<div class="col-md-8 goodsTable"  style="border-right: 1px solid #999">
				<#if order.orderType == 0>
				 <div class="row" style="padding:20px; margin-top:16px;">
					<div class="col-md-8">
						<div class="col-md-6 order-img">
							<img src="${order.goodsImg!''}" style="width:110px ;height:80px">
						</div>
						<div class="col-md-6 order-p">
							<p>${order.goodsName!''}</p>
							<p style="color: #999">${((order.amount-(order.expressfee!'0')?number)/order.count?number)!''}<span>元&nbspx</span>${order.count!''}</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="col-md-offset-7">
							<#if order.state == 6>
								<#if order.logisticsState ??>
									<#if order.logisticsState == 1>
										<p>已发货</a></p>
										<p><a href='javascript:;' onclick="MyApp.order.logisticsquery({orderId:${order.id}})">物流跟踪</a></p>
										<p><a href="javascript:;"  onclick="MyApp.order.contactService()">联系客服</a></p>
									</#if>
								<#else>
									<p>待发货</a></p>
									<p><a href="javascript:;"  onclick="MyApp.order.contactService()">联系客服</a></p>
								</#if>
								
							<#elseif order.state == 7>
								<p><a href="${BasePath}/afs/apply.do?orderId=${order.id}&goodsId=${order.goodsId}">申请售后</a></p>
							<#elseif order.state == 0>
								<#-- <p><a href="javascript:;" onclick="MyApp.order.deleteOrder({id:${order.id}})">取消订单</a></p> -->
							<#elseif order.state == 4>
								
							</#if>
						</div>
					</div>
					</div>
					<#else>
						<#list order.orderList as ord>
						 <div class="row order-div2" <#if ord_index = 0><#if !ord_has_next>style="border-top:0px;margin-top:16px;border-bottom:0px;"<#else>style="border-top:0px;margin-top:16px;"</#if><#elseif !ord_has_next>style="border-bottom:0px;"</#if>>
							<div class="col-md-8">
								<div class="col-md-6">
									<img src="${ord.goodsImg!''}" style="width:100px ;height:100px">
								</div>
								<div class="col-md-6 order-p">
									<p>${ord.goodsName!''}</p>
									<p style="color: #999">${((ord.amount-(ord.expressfee!'0')?number)/ord.count?number)!''}<span>元&nbspx</span>${ord.count!''}</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="col-md-offset-7">
									<#if ord.state == 6>
										<#if order.logisticsState ??>
											<#if order.logisticsState == 1>
												<p>已发货</a></p>
												<p><a href='javascript:;' onclick="MyApp.order.logisticsquery({orderId:${ord.id}})">物流跟踪</a></p>
												<p><a href="javascript:;"  onclick="MyApp.order.contactService()">联系客服</a></p>
											</#if>
										<#else>
											<p>待发货</a></p>
											<p><a href="javascript:;"  onclick="MyApp.order.contactService()">联系客服</a></p>
										</#if>
										
									<#elseif ord.state == 7>
										<p><a href="${BasePath}/afs/apply.do?orderId=${ord.id}&goodsId=${ord.goodsId}">申请售后</a></p>
									<#elseif ord.state == 0>
										
									<#elseif ord.state == 4>
										
									</#if>
								</div>
							</div>
							</div>
							</#list>
					</#if>	
				</div>
				<div class="col-md-4">
					<div class="row" style="text-align: center;">
						<div class="operation">
							<button class="btn btn-primary order-button" onclick="window.location.href='orddetail.do?orderId=${order.id}'">订单详情</button></br></br>
							<#if order.state == 7>
								<#-- <button class="btn btn-primary order-button">评论晒单</button></br></br>
								<button class="btn btn-primary order-button">查看发票</button></br> -->
								<#if order.isComment ??>
									<#if order.isComment == 0>
										<button class="btn btn-primary order-button" onClick="window.location.href='${BasePath}/controller/comment/uncommentlist.do?id=${order.id}'">评论晒单</button></br>
									<#elseif order.isComment == 1>
										<button class="btn btn-primary order-button" onClick="window.location.href='${BasePath}/controller/comment/commentlist.do?id=${order.id}'">查看评论</button>
									</#if>
								<#else>
								    	<button class="btn btn-primary order-button" onClick="window.location.href='${BasePath}/controller/comment/uncommentlist.do?id=${order.id}'">评论晒单</button></br>
								</#if>
							<#elseif order.state == 6>
								<button class="btn btn-primary order-button" onclick="MyApp.order.received({id:${order.id}})">确认收货</button></br></br>
							<#elseif order.state == 0>
							
								<#if order.amount gt 0>
									<button class="btn btn-primary order-button" onclick="MyApp.order.topay({id:${order.id}})">立即支付</button></br></br>
								<#else>
									<button class="btn btn-primary order-button" onclick="ysf.open()">向客服询价</button></br></br>
								</#if>
								<p><a href="#" onclick="MyApp.order.deleteOrder({id:${order.id}})">取消订单</a></p>
							</#if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</#list>
	
	<#--分页-->
		<nav>
	 	  <ul class="pagination order-page">
	 	  	<li><a href="${BasePath}/controller/order/tomyorder.do?pageNo=1${page.url!''}">首页</a></li>
		  	<#if page.pageNo != 1>
		  		<li><a href="${BasePath}/controller/order/tomyorder.do?pageNo=${page.pageNo -1}${page.url!''}">&laquo;</a></li>
		  	<#else>
		  		<li class="disabled"><a>&laquo;</a></li>
		  	</#if>	
		    <#list 1..page.pageCount as i>
		   	 <#if page.pageNo == i>
		   	 	<li class="active"><a >${i}</a></li>
		   	 <#else>
		   	 	<#if ((i>page.pageNo-3) || (i<3)) && ((i<page.pageNo+3) || (i>page.pageCount-2))>
		   	 	<li><a href="${BasePath}/controller/order/tomyorder.do?pageNo=${i}${page.url!''}">${i}</a></li>
		   	 	</#if>
		   	 </#if>	
		    </#list>
		    <#if page.pageNo != page.pageCount>
		    	<li><a href="${BasePath}/controller/order/tomyorder.do?pageNo=${page.pageNo +1}${page.url!''}">&raquo;</a></li>
		    <#else>
		    	<li class="disabled"><a>&raquo;</a></li>
		    </#if>
		    <li><a href="${BasePath}/controller/order/tomyorder.do?pageNo=${page.pageCount}${page.url!''}">尾页</a></li>
		    <li><span>共${page.pageCount!''}页</span></li>
		  </ul>
		</nav>
		
		
		<#else>
			<br/><br/>
			<p class="text-center" style="font-size:18px;color:#999999">当前没有交易订单。</p>
		</#if>
	</div>
	<input id="BasePath" type="hidden" value="${BasePath!''}">	
<!--物流详情弹窗  -->
 <div class="modal fade" id="logisticsQuery">  
    <div class="modal-dialog">  
    <div class="modal-content message_align">  
    	<div class="modal-header">  
      		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>  
        	<h4 class="modal-title">物流详情</h4> 
        	<h4 id="logisticsError" style="color:red;"></h4> 
      	</div>  
	    <div class="modal-body">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-6">
						<label class="control-label col-md-5">运单编号:</label>
						<div class="col-md-7">
							<span id="LogisticCode" class="form-control-static green"></span>
						</div>
					</div>
					<div class="col-md-6">
						<label  class="control-label col-md-5">快递公司:</label>
						<div class="col-md-7">
							<span id="expCompany" class="form-control-static green"></span>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="col-md-6">
						<label class="control-label col-md-5">物流状态:</label>
						<div class="col-md-4 col-md-offset-1">
							<span id="logisticStatus" class="form-control-static" style="color:red"></span>
						</div>
					</div>
					<div class="col-md-6">
						<label class="control-label col-md-5">预计达到时间:</label>
						<div class="col-md-7">
							<span id="estimatedDeliveryTime" class="green"></span>
						</div>
					</div>
				</div>
				<div class="col-md-12" style="margin-top:30px">
					<div class="col-md-12" style="margin-left:17px">
						<span id="Logistics" class="form-control-static"></span>
						<span id="logisticsError" style="color:red; font-size:20px"></span>
						<br>
					</div>
				</div>
			</div>
		</div>
   		<div class="modal-footer">  
        	<input type="hidden" id="url"/>  
        	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>  
   		</div>  
    </div>
  </div>
</div>
</@layout>
