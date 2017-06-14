<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>${SeoInfo.title}</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
		<meta content="${SeoInfo.description}" name="description"/>
		<meta content="${SeoInfo.keyword}" name="keyword"/>
		<#include '../_inc_head.ftl'>
		<link rel="stylesheet" href="${BasePath}/css/mycart.css" />
		<#include "../2buser/userheader.ftl">
	</head>
<body>
<div class="big-cart">
	<h4 class="h-sty">我的购物车</h4>
	<#if cartList ?? && (cartList?size>0)>
	<br/>
	<div class="table-container">
		<table class="table table-bordered" id="mycart">
			<thead>
				<tr role="row" class="heading">
					<th width="8%">
						<input type="checkbox" id="checkAllBox" value=""/>全选
					</th>			
					<th width="40%" style="text-align:left;padding-left:90px">
						商品
					</th>
					<th width="10%">
						 单价(元)
					</th>
					<th width="12%">
						数量
					</th>
					<th width="10%">
						 小计
					</th>
					<th width="10%">
						 操作
					</th>
				</tr>
				<tr>
					<th colspan="6"></th>
				</tr>
			</thead>
			<tbody>
			<#list cartList as cart>
				<tr class="bodying">
					<td style="vertical-align:middle">
						<input class="checkBox" name="checkBox" type="checkbox" value="${cart.id}"/>
					</td>
					<td>
						<div class="pull-left">
							<img src="${cart.img!''}"/>
						</div>
						<span class="pull-left left02">
							${cart.goodsName!'商品为空'}
						</span>
					</td>
					<td style="vertical-align:middle;">
						${cart.price!'0'}
					</td>
					<td style="vertical-align:middle;">
						<button class="min"><img src="${BasePath}/images/cut.png"></button>
						<input  class="text_box" name="goodnum" value="${cart.goodnum!''}" readonly="readonly"/>
						<button class="add"><img src="${BasePath}/images/add.png"></button>
						<input type="hidden" class="id" value="${cart.id!''}"/>
					</td>
					<td class="checkedPrice" style="vertical-align:middle;">
						<span class="allprice">${cart.allprice!'0'}</span>
					</td>
					<td style="vertical-align:middle;">
						<a style="color:#ccc;font-size:15px" href="javascript:;" onclick="MyApp.cart.delete({id:${cart.id}})">删除</a>
					</td>
				</tr>
				<tr>
					<td colspan="6"></td>
				</tr>
			</#list>
			</tbody>
		</table>
		
		<div class="cart-foot">
			<div class="col-md-2 foot-1">
				<a href="javascript:;" onclick="MyApp.cart.delete({id:0})">删除选中的商品</a>
				<p>已选择&nbsp<span id="checkedCount" style="color:#1B9D97">0</span>&nbsp件商品</p>					
				<p class="p-sty">总价&nbsp<span id="cartAllPrice" style="color:#1B9D97">0</span>&nbsp元</p>
			</div>
		</div>
		<br/>
		<div class="col-md-2 pull-right">
			<button class="btn" onclick="MyApp.cart.paycart()">去结算</button>
		</div>
		
	</div>
	<#else>
		<a class="catr0" href="http://www.9he.com">
			<img src="${BasePath}/images/mycart.png">
		</a>
	</#if>
</div>	
<div>
	<div class="clearfix"></div>
</div>

<#---弹窗模板-->
<div class="modal fade" id="confirm">  
  <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-body"> 
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>   
      	<input id="tempData" type="hidden" value="">
      	<input id="tempData1" type="hidden" value="">
        <h3 id="confirmContent"></h3>  
      </div>  
      <div class="modal-footer">  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <button id="onclickButton" onclick="" class="btn btn-primary" data-dismiss="modal">确定</button>  
      </div>  
    </div>
  </div>
</div> 
<script type="text/javascript" src="${BasePath}/scripts/custom/mycart.js"></script>

<#include "../2bmain/footer2b.ftl">

</body>
</html>