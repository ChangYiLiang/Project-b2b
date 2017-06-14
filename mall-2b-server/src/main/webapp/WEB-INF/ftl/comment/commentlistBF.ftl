<#include "../layout.b2b.ftl">
<#assign active='o5'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/comment/list.do">评价晒单</a></li>
</#macro>
<#macro myheader>
<style>

</style>
</#macro>
<#macro script>

requirejs(['jquery'],function(){
});
</#macro>


<@layout header=myheader footer=scripts>
<link rel="stylesheet" href="${BasePath}/css/comment.css" />

<h2 class="bg-white">评价晒单</h2>
	<div class="bg-white other-body" style="min-height: 500px; padding: 10px 40px;">
		<ul class="nav nav-pills nav-other">
			<li><a href="${BasePath}/controller/order/tomyorder.do?state=7&isComment=0"">待评价</a></li>
			<li class="active"><a href="${BasePath}/controller/comment/list.do">已评价</a></li>
		</ul>
		<hr class="commont-hr"/>	
	<#if comments ?? || (comments?size>0)>
	<#list comments as comment>
			<div class="row bg-white commont-div">
				<div class="col-md-12 commont-commontBox-header" style="padding: 18px;border: 1px solid #999;border-bottom-width: 0px ">
					<div class="col-md-4">
						订单编号：${comment.orderId !''}
					</div>
					<div class="col-md-6">
					<#if comment.commentDate??>
						${comment.commentDate?datetime} &nbsp 评论 &nbsp
						<#if comment.goodsSatisfied == 5>
							<img src="${BasePath}/scripts/custom/images/u269.png"><span style="color: #1B9D97">&nbsp+1</span>
						</#if>
					</#if>	
					</div>
				</div>
				<div class="col-md-12" style="border: 1px solid #999">
					<div class="col-md-5 commmont-div2">
						<div class="col-md-6">
							<div id="slider" class="commontImg">
								<img src="${comment.goodsImage!''}">
							</div>
						</div>
						<div>
						<br/>
							<#list goodsMap?keys as key>
								<#if key?eval == comment.goodsId>
									<p>${goodsMap[key]}</p>
								</#if>
							</#list>
							<p style="color: #999">${comment.amount!''}<span>元&nbspx</span>${comment.count!''}</p>
						</div>
					</div>
					<div class="col-md-7" style="min-height:140px; padding:20px;border-left: 1px solid #999">
						<div class="row">
							<div class="col-md-8 comment-satisfied">
								<span>商品满意度&nbsp:&nbsp&nbsp&nbsp
								<#list 1..comment.goodsSatisfied as i>
								<img src="${BasePath}/scripts/custom/images/u276.png">&nbsp
								</#list>
								</span>&nbsp
								<span style="color: #1B9D97">${comment.goodsSatisfied !''}分</span>
							</div>
							</div>
							<div class="row">
							<div class="col-md-12">
								<div class="col-md-8">
									<div class="col-md-12 comment-content">
										<span style="margin-left:-30px">商品评价&nbsp:&nbsp</span>
										<span>${comment.content!''}</span>	
									</div>
									<#if comment.replyContent??>
									<div class="col-md-12 comment-reply">
										<span style="margin-left:-30px" class="common-font-color">卖家回复&nbsp:&nbsp</span>
										<span class="common-font-color">${comment.replyContent}</span>	
									</div>
									</#if>
								</div>
								<#if comment.photo ?? && (comment.photo != "" )>
								<div class="col-md-4" id="box">
									<div id="carousel-example-${comment.id}" class="carousel slide" data-ride="carousel">
									 <div class="carousel-inner">
									 	<#if comment.photos ??>
											<#list comment.photos as photo>
												 <div  <#if photo_index == 0>class="item active"<#else>class="item"</#if> >
													      <img src="${photo}" class="example" style="height:80px;width:120px">
												   </div>
											</#list>
										<#else>
											
										</#if>
									 </div>
									 <a class="left carousel-control" href="#carousel-example-${comment.id}" data-slide="prev">
									 <span class="glyphicon glyphicon-chevron-left"></span></a>
									 <a class="right carousel-control" href="#carousel-example-${comment.id}" data-slide="next">
									 <span class="glyphicon glyphicon-chevron-right"></span></a>
									</div>
									</div> 
									</#if>
							</div>
							</div>
					</div>
				</div>
			</div>
	</#list>
	
		<nav>
		  <ul class="pagination comment-page">
		  	<li><a href="${BasePath}/controller/comment/list.do?pageNo=1">首页</a></li>
		  	<#if page.pageNo != 1>
		  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}">&laquo;</a></li>
		  	<#else>
		  		<li class="disabled"><a>&laquo;</a></li>
		  	</#if>	
		    <#list 1..page.pageCount as i>
		   	 <#if page.pageNo == i>
		   	 	<li class="active"><a >${i}</a></li>
		   	 <#elseif ((i>page.pageNo-3) || (i<3)) && ((i<page.pageNo+3) || (i>page.pageCount-2))>
		   	 	<li><a href="${BasePath}/controller/comment/list.do?pageNo=${i}">${i}</a></li>
		   	 </#if>	
		    </#list>
		    <#if page.pageNo != page.pageCount>
		    	<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo +1}">&raquo;</a></li>
		    <#else>
		    	<li class="disabled"><a>&raquo;</a></li>
		    </#if>
		    <li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageCount}">尾页</a></li>
		    <li><span>共${page.pageCount!''}页</span></li>
		  </ul>
		</nav>
		<#else>
			<br/><br/>
			<p class="text-center" style="font-size:18px;color:#999999">当前没有任何评价。</p>
		</#if>
</div>
	
</@layout>
