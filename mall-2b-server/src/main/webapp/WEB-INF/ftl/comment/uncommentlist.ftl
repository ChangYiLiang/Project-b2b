<#include "../layout.b2b.ftl">
<#assign active='o5'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/comment/uncommentlist.do">评价晒单</a></li>
</#macro>

<#macro script>
requirejs(['jquery','comment'],function(){
});
</#macro>

<@layout header=myheader footer=scripts>
<link rel="stylesheet" href="${BasePath}/css/comment.css" />

<h2 class="bg-white">评价晒单</h2>

<div class="other-body" style="padding: 10px 31px;">	
	<ul class="nav nav-pills nav-other">
		<li class='active'><a href="${BasePath}/controller/comment/uncommentlist.do">待评价</a></li>
		<li><a href="${BasePath}/controller/comment/commentlist.do">已评价</a></li>
	</ul>
	<hr class="comment-hr"/>
	<#if orderList ?? && (orderList?size>0)>
		<iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
		<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
			<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
			<input type="file" name="file" id="uploadfile" multiple />
		</form>
	<#list orderList as order>
		<form action="" class="comment_from" method="post">
		
		<div class="row bg-white commont-div">
			<div class="col-md-12 commont-commontBox-header" style="padding: 18px;border: 1px solid #999;border-bottom: 0px ">
				<div class="col-md-3">
					订单号：${order.id!''}
				</div>
				<div class="col-md-4">
					${(order.createdDate?datetime)!''}
				</div>
			</div>
			<#if order.orderType == 0>
			<input type="hidden" name="goodsId" value="${order.goodsId!''}">
			<input type="hidden" name="orderId" value="${order.id!''}">
			<div class="col-md-12" style="border: 1px solid #999">
				<div class="col-md-3 commmont-div2">
					<p><img src="${order.goodsImg!''}" ></p>
					<br/>
					<p>${order.goodsName!''}</p>
					<p style="color: #999">${(order.amount/order.count?number)!''}<span>元&nbspx</span>${order.count!''}</p>
				</div>
				<div class="col-md-9" style="padding:20px; border-left:1px solid #999;">
					<div class="row">
						<div class="col-md-8 comment-satisfied">
							<span>商品满意度&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<img src="${BasePath}/images/comment/u174.png" class="star-1">&nbsp&nbsp
							<img src="${BasePath}/images/comment/u174.png" class="star-2">&nbsp&nbsp
							<img src="${BasePath}/images/comment/u174.png" class="star-3">&nbsp&nbsp
							<img src="${BasePath}/images/comment/u174.png" class="star-4">&nbsp&nbsp
							<img src="${BasePath}/images/comment/u174.png" class="star-5">&nbsp&nbsp
							</span>&nbsp
							<input type="hidden" name="goodsSatisfied" class="goodsSatisfied" value="5">
						</div>
						
					</div>
					<br/>
					<div class="row">
						<div class="col-md-12">
							<div class="overallComment-title">买家印象 </div>
							<div class="overallComment">	
								<div class="overallComment-1">好评</div>
								<div class="overallComment-2">中评</div>
								<div class="overallComment-3">差评</div>
								<input type="hidden" name="overallComment" class="overallComment" value="2">
							</div>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-md-12">
							<div style="float: left"><span>评价晒单</span></div>
							<div class="col-md-10 content">
								<textarea name="content" class="form-control content" style="height:100px" placeholder="商品是否给力？块分享你的心得吧！"></textarea>
							</div>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="uploadimg">
							<div class="showPhoto">
								<a href="javascript:;" class="upload-button"><img src="${BasePath}/images/comment/u184.png"></a>
								<input type="hidden" class="next" value="0" />
						    </div>
							&nbsp<p id="pht">最多能上传<span class="frimary-color">&nbsp5&nbsp</span>张图片</p>
							<input type="hidden" name="photo" class="photo">
						</div>
					</div>
				</div>
			</div>
			<#elseif order.orderType == 2>
				<#list order.orderList as ord>
					<input type="hidden" name="goodsId" value="${ord.goodsId!''}">
					<input type="hidden" name="orderId" value="${ord.id!''}">
					<div class="col-md-12 commmont-order-div2" <#if !ord_has_next>style="border:1px solid #999;"</#if>>
						<div class="col-md-3 commmont-div2">
							<p><img src="${ord.goodsImg!''}" ></p>
							<br/>
							<p>${ord.goodsName!''}</p>
							<p style="color: #999">${(ord.amount/ord.count?number)!''}<span>元&nbspx</span>${ord.count!''}</p>
						</div>
						<div class="col-md-9" style="padding:20px; border-left:1px solid #999;">
							<div class="row">
								<div class="col-md-8 comment-satisfied">
									<span>商品满意度&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<img src="${BasePath}/images/comment/u174.png" class="star-1">&nbsp&nbsp
									<img src="${BasePath}/images/comment/u174.png" class="star-2">&nbsp&nbsp
									<img src="${BasePath}/images/comment/u174.png" class="star-3">&nbsp&nbsp
									<img src="${BasePath}/images/comment/u174.png" class="star-4">&nbsp&nbsp
									<img src="${BasePath}/images/comment/u174.png" class="star-5">&nbsp&nbsp
									</span>&nbsp
									<input type="hidden" name="goodsSatisfied" class="goodsSatisfied" value="5">
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-md-12">
									<div class="overallComment-title">买家印象 </div>
									<div class="overallComment">	
										<div class="overallComment-1">好评</div>
										<div class="overallComment-2">中评</div>
										<div class="overallComment-3">差评</div>
										<input type="hidden" name="overallComment" class="overallComment" value="2">
									</div>
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="col-md-12">
									<div style="float: left"><span>评价晒单</span></div>
									<div class="col-md-10 content">
										<textarea name="content" class="form-control" style="height:100px" placeholder="商品是否给力？块分享你的心得吧！"></textarea>
									</div>
								</div>
							</div>
							<br/>
							<div class="row">
								<div class="uploadimg">
									<div class="showPhoto">
										<a href="javascript:;" class="upload-button" ><img src="${BasePath}/images/comment/u184.png"></a>
								    	<input type="hidden" class="upload-type" value="0" />
								    </div>
									&nbsp<p class="pht">最多能上传<span class="frimary-color">&nbsp5&nbsp</span>张图片</p>
									<input type="hidden" name="photo" class="photo">
								</div>
							</div>
						</div>
					</div>
				</#list>
			</#if>
			<#--按钮-->
			<div class="row">
				<div class="col-md-7 comment-btn">
					<div class="form-group col-md-4">
						<input type="button" class="btn btn-primary comment-submit-btn" value="提交">
					</div>
				</div>
			</div>
		</div>
		</form>
		<br/>
		<br/>
	</#list>
	<input type="hidden" id="tempPhoto">
	<input id="BasePath" type="hidden" value="${BasePath}"/>
	<#--分页-->
		<nav>
	 	  <ul class="pagination order-page">
	 	  	<li><a href="${BasePath}/controller/comment/uncommentlist.do?pageNo=1">首页</a></li>
		  	<#if page.pageNo != 1>
		  		<li><a href="${BasePath}/controller/comment/uncommentlist.do?pageNo=${page.pageNo -1}">&laquo;</a></li>
		  	<#else>
		  		<li class="disabled"><a>&laquo;</a></li>
		  	</#if>	
		    <#list 1..page.pageCount as i>
		   	 <#if page.pageNo == i>
		   	 	<li class="active"><a >${i}</a></li>
		   	 <#else>
		   	 	<#if ((i>page.pageNo-3) || (i<3)) && ((i<page.pageNo+3) || (i>page.pageCount-2))>
		   	 	<li><a href="${BasePath}/controller/comment/uncommentlist.do?pageNo=${i}">${i}</a></li>
		   	 	</#if>
		   	 </#if>	
		    </#list>
		    <#if page.pageNo != page.pageCount>
		    	<li><a href="${BasePath}/controller/comment/uncommentlist.do?pageNo=${page.pageNo +1}">&raquo;</a></li>
		    <#else>
		    	<li class="disabled"><a>&raquo;</a></li>
		    </#if>
		    <li><a href="${BasePath}/controller/comment/uncommentlist.do?pageNo=${page.pageCount}">尾页</a></li>
		    <li><span>共${page.pageCount!''}页</span></li>
		  </ul>
		</nav>	
	<#else>
		<br/><br/>
		<p class="text-center" style="font-size:18px;color:#999999">当前没有待评价订单。</p>
	</#if>
	
</div>

	<script>
		window.fileupload_callback = window["fileupload_callback"] || function(data) {
			data = eval(data)
			var file = "";
			var html = "";
			for(var i=0; i<data.length; i++) {
				 file += data[i]+";";
				  var str = '<div style="width:0px;height:0px; display:none" class="ppt" onmousemove="show1(this)">'+
				   				'<table>'+
				   					'<tr>'+
				   						'<td>'+
				   							'<a href="javascript:;" onclick="modify(this)">'+
										 		'<img src="${BasePath}/images/comment/16-16-2.png" style="width:15px;height:15px;margin:3px 0px 0px 3px"/>'+
										 	'</a>'+
				   						'</td>'+
				   						'<td>'+
				   							 '<a href="javascript:;" onclick="del(this)" >'+
										 		 '<img src="${BasePath}/images/comment/16-16-1.png" style="width:15px;height:15px;margin:3px 0px 0px 3px"/>'+
										 	 '</a>'+
				   						'</td>'+
				   					'</tr>'
				   				'</table>'+
							'</div>';
					var photo =  '<div class="st" style="padding-right:7px;">'+
					                     '<img class="showPhoto" onmouseout="hide(this)" onmousemove="show(this)" style="width:50px;height:50px;" src="'+data[i]+'"/>'+
					                     '<input type="hidden" class="photos"  value="'+data[i]+'"/>'+
					              '</div>';
				/* $("#tempPhoto").val(photo); */	
				/*  $("#showPhoto").append(photo);	 
				 $("#showPhoto").append(str);	 */
				 $(".upload-button").each(function(){
				 		if($(this).next().val()=='1'){
				 			$(this).parent().append(photo);
				 			$(this).parent().append(str);
				 		}
				 });
			}
			 $(".upload-button").each(function(){
				 	if($(this).next().val()=='1'){
				 		var pht = $(this).siblings("div").children("input");
				 		var phttos = "";
				 		for(var i =0; i<pht.length;i++){
				 			phttos +=  pht[i].value+";";
				 		}
				 		$(this).parent().siblings().last().val(phttos);
				 		 var count=pht.length;
						 var count1 = 5-count;
						 $(this).parent().siblings("p").html('共<span class="frimary-color">&nbsp'+count+'&nbsp</span>张，还能上传<span class="frimary-color">&nbsp'+count1+'&nbsp</span>张');
				 	}
				 });
			$(".upload-type").val("0");
		}
	</script>
	<script>
		function show(p){
			$(p).parent().next('.ppt').show();
		}
		function hide(p){
			$(p).parent().next('.ppt').hide();
		}
		
		function show1(p){
			$(p).show();
		}
		function show2(p){
			$(p).show();
		}
		function hide1(p){
			$(p).hide();
		}
		function del(p){
			$(p).closest('.ppt').prev().remove();
			var pht = $(p).closest('.ppt').siblings("div").children("input");
	 		var phttos = "";
	 		for(var i =0; i<pht.length;i++){
	 			phttos +=  pht[i].value+";";
	 		}
	 		$(p).closest('.ppt').parent().siblings().last().val(phttos);
	 		var count=pht.length;
			var count1 = 5-count;
			$(p).closest('.ppt').parent().siblings("p").html('共<span class="frimary-color">&nbsp'+count+'&nbsp</span>张，还能上传<span class="frimary-color">&nbsp'+count1+'&nbsp</span>张');
			$(p).closest('.ppt').remove();
		}
		function modify(p){
			$(p).closest('.ppt').prev().remove();
			$(p).closest('.ppt').siblings("a").click();
			var pht =$(p).closest('.ppt').siblings("div").children("input");
	 		var phttos = "";
	 		for(var i =0; i<pht.length;i++){
	 			phttos +=  pht[i].value+";";
	 		}
	 		$(p).closest('.ppt').parent().siblings().last().val(phttos);
	 		var count=pht.length;
			var count1 = 5-count;
			$(p).closest('.ppt').parent().siblings("p").html('共<span class="frimary-color">&nbsp'+count+'&nbsp</span>张，还能上传<span class="frimary-color">&nbsp'+count1+'&nbsp</span>张');
			$(p).closest('.ppt').remove();
		} 
	</script>
</@layout>
