<#include "../layout.b2b.ftl">
<#assign active='o5'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/comment/uncommentlist.do">评价晒单</a></li>
</#macro>

<#macro script>
requirejs(['jquery','comment','zoomify'],function(){
	  $(".comment-img").zoomify();
});
</#macro>

<@layout header=myheader footer=scripts>
<link rel="stylesheet" href="${BasePath}/css/comment.css" />
<link rel="stylesheet" href="${BasePath}/css/zoomify.css" rel="stylesheet" type="text/css"/>

<h2 class="bg-white">评价晒单</h2>

<div class="other-body" style="padding: 10px 31px;">	
	<ul class="nav nav-pills nav-other">
		<li><a href="${BasePath}/controller/comment/uncommentlist.do">待评价</a></li>
		<li class='active'><a href="${BasePath}/controller/comment/commentlist.do">已评价</a></li>
	</ul>
	<hr class="comment-hr"/>
	<#if orderList ?? && (orderList?size>0)>
	<#list orderList as order>
		<div class="row bg-white commont-div">
			<div class="col-md-12 commont-commontBox-header" style="padding: 18px;border: 1px solid #999;border-bottom: 0px ">
				<div class="col-md-3">
					订单号：${order.id!''}
				</div>
				<div class="col-md-4">
					${(order.createdDate?datetime)!''}
					<span class="add-bonus">评论&nbsp&nbsp<img src="${BasePath}/images/comment/u269.png">&nbsp<span class="frimary-color">+5</span></span>
				</div>
			</div>
			<#if order.orderType == 0>
			<div class="col-md-12" style="border: 1px solid #999">
				<div class="col-md-3 commmontList-div2">
					<p><img src="${order.goodsImg!''}" ></p>
					<p>${order.goodsName!''}</p>
					<p style="color: #999">${(order.amount/order.count?number)!''}<span>元&nbspx</span>${order.count!''}</p>
				</div>
				<div class="col-md-9 commmontList-div3" style="padding:20px; border-left:1px solid #999;">
					<div class="row">
						<div class="col-md-8">
							<span>商品满意度：&nbsp&nbsp
							<#list 1..order.commentEx.goodsSatisfied as i>
								<img src="${BasePath}/images/comment/u176.png">&nbsp&nbsp
							</#list>
							</span>&nbsp
						</div>
					</div>
					</br>
					<div class="row">
						<div class="col-md-12">
							<div style="float: left"><span>买家评价：</span></div>
							<div class="col-md-10 content">
								<span>${order.commentEx.content!''}</span>
							</div>
						</div>
					</div>
					<#if order.commentEx.photo ?? && (order.commentEx.photo != "" )>
						<br/>
						<div class="row">
							<#if order.commentEx.photos ??>
								<p class="commentList-imgbox">
								<#list order.commentEx.photos as photo>
									 <img class="comment-img" src="${photo!''}">
								</#list>
								</p>
							</#if>
						</div>
					</#if>
					<#if order.commentEx.replyContent??>
						<br/>
						<div class="row">
							<div class="col-md-12">
								<div style="float: left"><span class="frimary-color">官方回复：</span></div>
								<div class="col-md-10 content">
									<span class="frimary-color">${order.commentEx.replyContent!''}</span>
								</div>
							</div>
						</div>
					</#if>
				</div>
			</div>
			<#elseif order.orderType == 2>
				<#list order.orderList as ord>
					<div class="col-md-12 commmont-order-div2" <#if !ord_has_next>style="border:1px solid #999;"</#if>>
						<div class="col-md-3 commmontList-div2">
							<p><img src="${ord.goodsImg!''}" ></p>
							<p>${ord.goodsName!''}</p>
							<p style="color: #999">${(ord.amount/ord.count?number)!''}<span>元&nbspx</span>${ord.count!''}</p>
						</div>
						<div class="col-md-9 commmontList-div3" style="padding:20px; border-left:1px solid #999;">
							<div class="row">
								<div class="col-md-8">
									<span>商品满意度:&nbsp&nbsp&nbsp&nbsp
									<#list 1..ord.commentEx.goodsSatisfied as i>
										<img src="${BasePath}/images/comment/u176.png">&nbsp&nbsp
									</#list>
									</span>&nbsp
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-md-12">
									<div style="float: left"><span>买家评价：</span></div>
									<div class="col-md-10 content">
										<span>${ord.commentEx.content!''}</span>
									</div>
								</div>
							</div>
							<#if ord.commentEx.photo ?? && (ord.commentEx.photo != "" )>
								<br/>
								<div class="row">
									<#if ord.commentEx.photos ??>
										<p class="commentList-imgbox">
										<#list ord.commentEx.photos as photo>
											 <img class="comment-img" src="${photo!''}">
										</#list>
										</p>
									</#if>
								</div>
							</#if>
							<#if ord.commentEx.replyContent??>
								<br/>
								<div class="row">
									<div class="col-md-12">
										<div style="float: left"><span class="frimary-color">官方回复：</span></div>
										<div class="col-md-10 content">
											<span class="frimary-color">${ord.commentEx.replyContent!''}</span>
										</div>
									</div>
								</div>
							</#if>
						</div>
					</div>
				</#list>
			</#if>
		</div>
		<br/>
		<br/>
	</#list>
	<#--分页-->
		<nav>
	 		<ul class="pagination order-page">
		 	  	<li><a href="${BasePath}/controller/comment/commentlist.do?pageNo=1">首页</a></li>
			  	<#if page.pageNo != 1>
			  		<li><a href="${BasePath}/controller/comment/commentlist.do?pageNo=${page.pageNo -1}">&laquo;</a></li>
			  	<#else>
			  		<li class="disabled"><a>&laquo;</a></li>
			  	</#if>	
			    <#list 1..page.pageCount as i>
			   		<#if page.pageNo == i>
			   	 		<li class="active"><a >${i}</a></li>
			   		<#else>
			   	 		<#if ((i>page.pageNo-3) || (i<3)) && ((i<page.pageNo+3) || (i>page.pageCount-2))>
			   	 			<li><a href="${BasePath}/controller/comment/commentlist.do?pageNo=${i}">${i}</a></li>
			   	 		</#if>
			   		</#if>	
			    </#list>
			    <#if page.pageNo != page.pageCount>
			    	<li><a href="${BasePath}/controller/comment/commentlist.do?pageNo=${page.pageNo +1}">&raquo;</a></li>
			    <#else>
			    	<li class="disabled"><a>&raquo;</a></li>
			    </#if>
			    <li><a href="${BasePath}/controller/comment/commentlist.do?pageNo=${page.pageCount}">尾页</a></li>
			    <li><span>共${page.pageCount!''}页</span></li>
			</ul>
		</nav>	
	<#else>
		<br/><br/>
		<p class="text-center" style="font-size:18px;color:#999999">当前没有已评价订单。</p>
	</#if>
	
</div>
</@layout>
