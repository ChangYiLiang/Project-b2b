<#include "../layout.b2b.ftl">

<#macro myheader>
<style>
#xzw_starSys{width:400px;border:0px solid #ccc;margin:0px auto}
#xzw_starBox{position:relative;width:120px;float:left}
#xzw_starSys .description{clear:both;padding:10px 0px}
#xzw_starSys .star{height:20px;width:120px;position:relative;background:url(${BasePath}/scripts/custom/images/123.png) repeat-x;cursor:pointer}
#xzw_starSys .star1{height:20px;width:120px;position:relative;background:url(${BasePath}/scripts/custom/images/123.png) repeat-x;cursor:pointer}
#xzw_starSys .star2{height:20px;width:120px;position:relative;background:url(${BasePath}/scripts/custom/images/123.png) repeat-x;cursor:pointer}
#xzw_starSys  li{float:left;padding:0px;margin:0px; list-style-type:none;}
#xzw_starSys  li a{display:block;width:24px;height:20px;overflow:hidden;text-indent:-9999px;position:absolute;z-index:5}
#xzw_starSys  li a:hover{background:url(${BasePath}/scripts/custom/images/123.png) 0 -25px repeat-x;z-index:3;left:0}
#xzw_starSys  a.one-star{left:0}
#xzw_starSys  a.one-star:hover{width:24px}
#xzw_starSys  a.two-stars{left:24px}
#xzw_starSys  a.two-stars:hover{width:48px}
#xzw_starSys  a.three-stars{left:48px}
#xzw_starSys  a.three-stars:hover{width:72px}
#xzw_starSys  a.four-stars{left:72px}
#xzw_starSys  a.four-stars:hover{width:96px}
#xzw_starSys  a.five-stars{left:96px}
#xzw_starSys  a.five-stars:hover{width:120px}
#xzw_starSys .current-rating{background:url(${BasePath}/scripts/custom/images/123.png) 0 -25px repeat-x;position:absolute;height:20px;z-index:1;top:0;left:0}
.showPhoto {height:50px;wigth:50px}
#showPhoto div{float:left;}
.ppt{ position: relative;left:-52px;top:13px;}
</style>
<link rel="stylesheet" type="text/css" href="${BasePath}/css/fileinput.min.css" />	
</#macro>

<#macro script>
requirejs(['jquery','zoomify'],function(){
});
</#macro>

<@layout header=myheader footer=scripts>
<link rel="stylesheet" type="text/css" href="${BasePath}/css/zoomify.css" rel="stylesheet" type="text/css"/>
<h2 class="bg-white">商品评价</h2>	
	<!--
	<ul class="nav nav-pills bg-white nav-other">
		<li><a href="${BasePath}/controller/comment/list.do">已评价</a></li>
		<li><a href="${BasePath}/controller/order/tomyorder.do?state=7&isComment=0">待评价</a></li>
	</ul>
	-->
	</br></br>
	<iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
	<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
		<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
		<input type="file" name="file" id="uploadfile" multiple  onchange="change(this)" />
	</form>
	<div class="row" style="margin-left:20px">
		<div class="col-md-11" style="padding: 20px;border: 1px solid #999; border-bottom-width: 0px">
			<div class="col-md-4">
				订单编号：${order.id !''}
			</div>
			<div class="col-md-4">
				${order.createdDate?datetime}
			</div>
		</div>
		<div class="col-md-11" style="padding: 20px;border: 1px solid #999">
			<div class="col-md-3" style="text-align:center;vertical-align:middle">
				<p><img src="" style="width:100px ;height:100px"></p>
				<p>${good.goodsName!''}</p>
				<p>${order.amount!''}<span>元&nbspx</span>${orderGood.count!''}</p>
			</div>
			<div class="col-md-9" style="border-left: 1px solid #999">
			<form action="comment.do" id="comment_from" class="form-horizontal" method="post">
				<input type="hidden" name="goodsId" value="${good.id!''}">
				<input type="hidden" name="orderId" value="${order.id!''}">
				<div class="row">
						<label class="control-label col-md-2 text-right">商品满意度:</label>
						<div class="col-md-8" id="star">
								<div id="xzw_starSys">
									<div id="xzw_starBox">
										<ul class="star" id="star">
											<input type="hidden" name="goodsSatisfied" id="goodsSatisfied" value="">
											<li><a href="javascript:void(0)" title="1" class="one-star">1</a></li>
											<li><a href="javascript:void(0)" title="2" class="two-stars">2</a></li>
											<li><a href="javascript:void(0)" title="3" class="three-stars">3</a></li>
											<li><a href="javascript:void(0)" title="4" class="four-stars">4</a></li>
											<li><a href="javascript:void(0)" title="5" class="five-stars">5</a></li>
										</ul>
										<#-- <span style="color: #1B9D97"><span id="starMark">0</span>分</span> -->
										 <div class="current-rating" id="showb"></div> 
									</div>
								</div>  
							</div>
					</div>
					<br>
					<div class="row">
						<label class="control-label col-md-2" >总体评价:</label>
						<div class="btn-group col-md-7" data-toggle="buttons">
								<label class="btn btn-default col-md-4 active">
									<input type="radio" name="overallComment" value="2">好评
								</label>
								<label class="btn btn-default col-md-4">
									<input type="radio" name="overallComment" value="1">中评
								</label>
								<label class="btn btn-default col-md-4">
									<input type="radio" name="overallComment" value="0">差评
								</label>
						</div>
					</div>
					<br>
					<div class="row">
						<label class="control-label col-md-2">评价:</label>
						<div class="col-md-10">
								<textarea id="content" name="content" class="form-control" style="height:100px" placeholder="商品是否给力？块分享你的心得吧！"></textarea>
						</div>
					</div>
					<br>
					<div class="row"> 
						<label class="control-label col-md-2">晒单:</label>
						<div class="col-md-10">
							<div id="showPhoto">
								<a href="javascript:;" id="bb" onclick="document.getElementById('uploadfile').click()"><img style="wigth:50px;height:50px;" src="${BasePath}/images/comment/u184.png"></a>
						    </div>
							&nbsp<p id="pht">最多能上传5张图片</p>
						</div>
					</div>
					<div class="row">
					<div class="col-md-7 col-md-offset-2">
						<div class="form-group col-md-4">
							<input type="submit" class="btn btn-primary btn-block" value="提交">
						</div>
						<div class="col-md-4">
							<button type="button" class="btn btn-primary btn-block" onclick="back()">返回</button>
						</div>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		window.fileupload_callback = window["fileupload_callback"] || function(data) {
			data = eval(data)
			var file = "";
			var html = "";
			for(var i=0; i<data.length; i++) {
				 file += data[i]+";";
				  var str = '<div style="width:0px;height:0px;display:none" class="ppt" onmousemove="show1(this)" >'+
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
					                     '<input type="hidden" name="photo" class="phoo"  value="'+data[i]+'"/>'+
					              '</div>';
				 $("#showPhoto").append(photo);	 
				 $("#showPhoto").append(str);	
			}
			$("#photo").val(file);
			<#--'showPhoto' src='"+data[i]+"'>&nbsp"
			$("#showPhoto").html(html);
			-->
		}
	</script>
	<script>
	    function back(){
	    	window.location.href='tomyorder.do?state=7&isComment=0';
	    }
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
			$(p).closest('.ppt').remove();
			var count = 0;
			$(".showPhoto").each(function(){count++});
			var count1 = 5-count;
			$("#pht").html('共'+count+'张，还能上传'+count1+'张');
			
		}
		function modify(p){
			$(p).closest('.ppt').prev().remove();
			$(p).closest('.ppt').remove();
			document.getElementById('uploadfile').click();
			var count = 0;
			$(".showPhoto").each(function(){count++});
			var count1 = 5-count;
			$("#pht").html('共'+count+'张，还能上传'+count1+'张');
		}
		function change(file){
			 <#--已经上传图片-->
			 var pcount=0;
			 $(".showPhoto").each(function(){pcount++});
			 <#--选择图片-->
			 var fileCount=0;
			 if (file.files && file.files[0]) {
			    fileCount = file.files.length;
			  }
			  <#--剩余可传图片-->
			  var padd = 5-pcount;
			  if(fileCount>padd){
			    if(padd>0){
			    	alert('你最多还能选择'+padd+'张图片!')
			    }else{
			    	alert('你不能上传图片了');
			    }
			  	return;
			  }
			  $("#uploadform").submit();
			  var count=1;
			  $(".showPhoto").each(function(){count++});
			  var count1 = 5-count;
			  	  $("#pht").html('共'+count+'张，还能上传'+count1+'张');
		}
	</script>
</@layout>
