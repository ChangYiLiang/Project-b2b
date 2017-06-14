<#if order??>
<dl class="jh-goods-img-details">
	<dt>
		<a href="${BasePath}/i9he/fuwuqi.do?goodsId=${goods.id!0}" target="_blank"><img src="${(goods.goodsImg)!''}" alt="" /></a>
	</dt>
	<dd>&nbsp;</dd>
	<dd><a href="${BasePath}/i9he/fuwuqi.do?goodsId=${goods.id!0}" target="_blank">${goods.goodsName!''}</a></dd>
	<dd>&nbsp;</dd>
	<#if order.amount gt 0>
	<dd>${(order.amount/orderGoods.count)}元 x ${orderGoods.count!1}</dd>
	<#else>
	<dd><a href="javascript:;" onclick="ysf.open()">联系客服改价</a></dd>
	</#if>
</dl>
</#if>