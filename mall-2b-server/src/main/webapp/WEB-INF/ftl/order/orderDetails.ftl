<#include "../layout.b2b.ftl">
<#assign active='o1'>
<@layout>
<style>
.items span{
	color:#1B9D97;
}
.primary-color{color:#1b9d97;margin-right:30px}
</style>

<h2 class="bg-white">订单详情</h2>
<div class="bg-white other-body" style="min-height: 400px;padding: 17px 34px;">
	<h4 style="color:#1B9D97">
	<#list orderState?keys as key>
		<#if order.state == key?eval>
			&nbsp&nbsp&nbsp${orderState[key]}
		</#if>
	</#list>
	</h4>
	<br/>
	<p>订单信息 &nbsp&nbsp&nbsp${order.updatedDate?datetime} &nbsp|&nbsp 订单号：${order.id!''}</p>
	<input type="hidden" id="ordId" value="${order.id!''}">
	<#if order.orderType ==0>
	<div class="row">
		<div class="col-md-2">
			<img src="${order.goodsImg!''}" style="width:100px ;height:100px">
		</div>
		<div class="col-md-4">
			<br/>
			<span>${order.goodsName!''}</span><br/>
			<span>${((order.amount-(order.expressfee!'0')?number)/order.count?number)!''}<span>元&nbspx</span>${order.count!''}</span>	
		</div>
		<div class="col-md-6 items">
			<#list order.items as item>
				<#if item.itemType == 1>
					<span>机架类型</span>：${item.title!''}<br/>
				<#elseif item.itemType == 2>
					<span>处理器</span>：${item.title!''}<br/>
				<#elseif item.itemType == 3>
					<span>内存</span>：${item.title!''}<br/>
				<#elseif item.itemType == 4>
					<span>硬盘</span>：${item.title!''}<br/>
				<#elseif item.itemType == 5>
					<span>芯片</span>：${item.title!''}
				</#if>
			</#list>
		</div>
	</div>
	<#else>
		<#list order.orderList as ord>
		<div class="row">
			<div class="col-md-2">
				<img src="${ord.goodsImg!''}" style="width:100px ;height:100px">
			</div>
			<div class="col-md-4">
				<br/>
				<span>${ord.goodsName!''}</span><br/>
				<span>${((ord.amount-(ord.expressfee!'0')?number)/ord.count?number)!''}<span>元&nbspx</span>${ord.count!''}</span>
			</div>
			<div class="col-md-6 items">
				<#list ord.items as item>
					<#if item.itemType == 1>
						<span>机架类型</span>：${item.title!''}<br/>
					<#elseif item.itemType == 2>
						<span>处理器</span>：${item.title!''}<br/>
					<#elseif item.itemType == 3>
						<span>内存</span>：${item.title!''}<br/>
					<#elseif item.itemType == 4>
						<span>硬盘</span>：${item.title!''}<br/>
					<#elseif item.itemType == 5>
						<span>芯片</span>：${item.title!''}
					</#if>
				</#list>
			</div>
		</div>
		<br/>
		<hr>
		</#list>
	</#if>
	<hr>
	
	<br/>
	<#if address ??>
		<h4>收货信息</h4>
		<br/>
		<p>姓      名 ：${address.consigneeName!""}</p>
		<p>联系电话：${address.mobile!""}</p>
		<p>收货地址：${address.regionStructure!""}${address.streetAddress!""}</p>
		<hr>
	<#else>
		<h4 style="color:#1B9D97">未添加收货地址</h4>
		<hr>
	</#if>
	<br/>
	<h4>发票信息</h4>
	<br/>
	<#if invoice ??>
		<#if invoice.type == 0>
		<p>发票类型：个人纸质发票</p>
		<p>发票抬头：${invoice.header!''}</p>
		<#elseif invoice.type == 1>
		<p>发票类型：增值税发票 </p>
		<p>单位名称：${invoice.organization!''}</p>
		</#if>
	<#else>
		<p>没有开发票</p>	
	</#if>
	<hr>
	
	<br/>
	<input id="shippingStatus" type="hidden" value="${shippingStatus!''}">
	<#if order.state == 6>
		<h4>物流信息</h4>
		<br/>
		<#if shippingStatus == 0>
			<h5>未发货</h5>
		<#else>
			<div>
				快递名称：<span id="expCompany" class="primary-color"></span>
				运单编号：<span id="expNo" class="primary-color"></span>
				状态：<span id="state" class="primary-color"></span>
				预计送到时间：<span id="estimatedDeliveryTime" class="primary-color"></span>
			</div>
			<br>
			<span id="Logistics" class="form-control-static"></span>
		</#if>
		<hr>
	</#if>
	
	<br/>
	<div class="row from-controler">
		<div class="col-md-3 col-md-offset-9">
			<p>商品总价：<span style="color:#1B9D97">${((order.amount-expressFee?number)?string('0.00'))!''}元</span></p>
			<p>运       费：<span style="color:#1B9D97">${expressFee!''}元</span></p>
			<br/>
			<p>总金额：<span style="color:#1B9D97;font-size: 20px">${allPrice!''}元</span></p>
			<#if order.state == 6>
				<button class="btn btn-primary" onclick="MyApp.order.received({id:${order.id}})">确认收货</button>
			<#elseif order.state == 0>
				<button class="btn btn-primary" onClick="window.location.href='${BasePath}/cart/topay.do?orderId=${order.id}'">立即支付</button><br/><br/>
				&nbsp&nbsp&nbsp&nbsp
				<a href="javascript:void(0);" onclick="MyApp.order.deleteOrder({id:${order.id}})">取消订单</a>
			<#elseif order.state == 4>
				<button class="btn btn-primary"  onclick="window.location.href='${BasePath}/i9he/fuwuqi.do?goodsId=${order.goodsId}'">重新购买</button>
			</#if>
		</div>
	</div>
</div> 	
	
<div class="modal fade modal-dialog" id="confirm">  
    <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-body">  
      	<input id="tempData" type="hidden" value="">
        <h3 id="confirmContent"></h3>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="url"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <button id="onclickButton" onclick="" class="btn btn-primary" data-dismiss="modal">确定</button>  
      </div>  
    </div>
  </div>
</div> 	 
</@layout>
<#macro script>
	requirejs(['order','core'],function(order){
	order.getlogisticsquery();
	});
</#macro>

