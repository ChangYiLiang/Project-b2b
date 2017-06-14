<#include "../layout.b2b.ftl">
<#assign active='o3'>
<#macro breadcrumb>
<li>个人中心</li>
<li>我的关注</li>
</#macro>

<#macro script>
function look(goodsId){
	window.location.href="${BasePath}/i9he/fuwuqi.do?goodsId="+goodsId;
}
requirejs(['jquery'],function(){
        $(".goods").hover(function(){ 
          $(this).children().children("a").show();
        },function(){ 
          $(this).children().children("a").hide(); 
           
        })
        <#--取消关注-->
        $(".cancel").click(function(){
        	var pageNo = $("#pageNo").val();
			var concernId = $(this).next().val();
			$.post("cancelConcern.do",{pageNo:pageNo,concernId:concernId},function(){
				location.reload();
			})
			
        })
        <#--打开 降价提醒   或者取消降价提醒窗口-->    
        $(".remind").click(function(){
        var state = $(this).next().val();
        	if(state==1){
        	    $("#conId1").val($(this).parent().prev().val());
        	    layer.confirmEx({content: "是否取消该商品的降价提醒?", icon: "question", yes: function () {
        			    var concernId = $("#conId1").val();
			        	$.post("updateRemind.do",{id:concernId,remindStatus:'0'},function(data){
			        		if(data==1){
			        			$(".concernId").each(function(){
			        				if($(this).val()==concernId){
			        					$(this).next().children(".remind").css('color','#666');
			        					var state = 0;
			        					$(this).next().children(".state").val(state);
			        					layer.closeAll();
			        				}
			        			})
			        		}
			        	},'json')
                }});
        		<#--$("#cancelRemindFm").modal();-->
        	}else{
        		$("#conId2").val($(this).parent().prev().val());
        		<#--$("#addRemindFm").modal();-->
        		$('.jiangjiatongzhi_t1').stop().fadeIn();
	            $('.jiangjiatongzhi_wap').stop().fadeIn();
        	}
        })
        
        
        
        <#--取消降价提醒
        $("#cancelRemind").click(function(){
           
        })-->
        <#--添加降价提醒-->
        $("#addRemind").click(function(){
        	var concernId = $("#conId2").val(); 
        	var expectPrice = $("#expectPrice").val();
        	if(!isNaN(expectPrice) && $.trim(expectPrice)){
        	$.post("updateRemind.do",{id:concernId,remindStatus:'1',expectPrice:expectPrice},function(data){
        		if(data==1){
        		    $("#price1").html(expectPrice);
        			$(".concernId").each(function(){
        				if($(this).val()==concernId){
        					$(this).next().children(".remind").css('color','#1B9D97');
        					var state = 1;
        					$(this).next().children(".state").val(state);
        					$('.jiangjiatongzhi_wap').stop().fadeOut();
                			$('.jiangjiatongzhi_t3').stop().fadeIn();
        				}
        			})
        			
        		}
        		
        	},'json')
        	}else{
        		alert("你不能这么做!")
        	}
        	$("#expectPrice").val("");
        })
        $('.quxiao-X').click(function(){
                $('.jiangjiatongzhi_t1').stop().fadeOut();
            })
            
        $('.jjtz_zl_r_guanbi').click(function(){
                $('.jiangjiatongzhi_t3').stop().fadeOut();
                $('.jiangjiatongzhi_t1').stop().fadeOut();
            })   
            
         <#--模态窗口
       $(function(){
	  
            $('.jiangjiatongzhi').click(function(){
            	var remind = $(".jiangjiatongzhi").html();
            	var email = $("#email").val();
            	if(email==""){
            		alert("您需要登录哦!");
            	}else{
            		if(remind=='降价通知'){
						$('.jiangjiatongzhi_t1').stop().fadeIn();
	               		$('.jiangjiatongzhi_wap').stop().fadeIn();
					}else if(remind=='已关注'){
						alert("您已经关注本商品，您可以到我的关注查看");
					}
            	}
            })
            
            $('.btn-primary').click(function(){
            
            var  expectPrice = $("#price-notice").val();
			var  goodsId = $("#goodsId").val();
			var  goodsPrice = $("#price").val();  
        	if(!isNaN(expectPrice) && $.trim(expectPrice)){
        	$.post("${BasePath}/concern/concernGoods.do",{expectPrice:expectPrice,goodsId:goodsId,goodsPrice:goodsPrice},function(data){
        		if(data){
        			$(".jiangjiatongzhi").html("已关注");
        			$('.jiangjiatongzhi_wap').stop().fadeOut();
                	$('.jiangjiatongzhi_t3').stop().fadeIn();
        		}
        	},'json')
        	}else{
        		alert("你不能这么做!");
        	}
            })
            $('.jjtz_zl_r_guanbi').click(function(){
                $('.jiangjiatongzhi_t3').stop().fadeOut();
                $('.jiangjiatongzhi_t1').stop().fadeOut();
            })
            
			var  goodsId = $("#goodsId").val();
			$.post("${BasePath}/concern/isConcern.do",{goodsId:goodsId},function(data){
					if(data=='1'){
						$(".jiangjiatongzhi").html("已关注");
					}else{
						$(".jiangjiatongzhi").html("降价通知");
					}
			},'json');
     });  

  --> 
  
  	$(".pr").each(function(){
  		$(this).html(parseFloat($(this).html()).toFixed(2));
  	})
  	$("#concernhd").hide();
  	$("#sp").click(function(){
  		$("#concernhd").hide();
  		$("#concernsp").show();
  	})
  	$("#hd").click(function(){
  		$("#concernsp").hide();
  		$("#concernhd").show();
  	})
      
})
</#macro>

<@layout>
<link rel="stylesheet" href="${BasePath}/css/concern.css" />
<link rel="stylesheet" href="${BasePath}/css/head.css" />
<style>
	.breadcrumb {
		margin-left:16px;
	}
	.nav-offset {
		margin-left:-10px;
	}
</style>
	<h2 class="bg-white">我的关注</h2>
	<div class="bg-white other-body" style="height:865px">	
	    <ul class="nav nav-pills nav-other nav-stan" role="tablist">
			<li role="presentation" class="active"><a id="sp" href="#requirement" role="tab" data-toggle="tab" style="font-size:14px;">我关注的商品</a></li>
			<li role="presentation" style="border-right:0px solid red"><a id="hd" href="#record" role="tab" data-toggle="tab" style="font-size:14px;">我关注的活动</a></li>			
		</ul>
		<hr class="guanzhu-hr"/>
		<div id="concernsp">
				<div class="row other-row" style="width:900px;">
					<#list concernList as concern>
						<div class="col-md-3 concernGoods">
							<div class="goods">
								<div style="width:0px;height:0px" class="cancel">
									<a href="javascript:;" class="closeGoods" ><img  src="${BasePath}/images/2bconcern/shan_1_u149.png" style="width:16px;height:16px;border:none;"/></a>
								</div>
								<input type="hidden" value="${concern.id}" class="concernId"/>
								<div style="width:0px;height:0px">
									<#if concern.remindStatus==1>
									<i class="btn glyphicon glyphicon-arrow-down remind" style="font-size:18px;color:#1B9D97"></i>
									<#else>
									<i class="btn glyphicon glyphicon-arrow-down remind" style="font-size:18px;color:#666"></i>
									</#if>
									<input type="hidden" class="state" value="${concern.remindStatus}"/>
								</div>
								
								<!--这部分要重写by-jack-->
								<div class="guanzhu-img">
									<img src="${concern.goods.goodsImg}">
									<p class="price">${concern.goods.goodsName!''}</p>
								</div>
								<br/>
								<p class="price">原价&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr">${concern.price}</span>&nbsp;元</p>
								<p class="price">现价&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr">${concern.goods.goodsPrice}</span>&nbsp;元</p>
								<#if (concern.price-concern.goods.goodsPrice>0)>
								<p class="price" id="reduce">直降&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr" style="color:#1B9D97;">${concern.price-concern.goods.goodsPrice}</span>&nbsp;元</p>
								<#else>
								<p class="price" id="reduce">涨价&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr" style="color:#1B9D97;">${concern.goods.goodsPrice-concern.price}</span>&nbsp;元</p>
								</#if>
								<button onClick="look('${concern.goods.id}')" class="btn btn-primary add add-guanzhu">立即购买</button>
							</div>
						</div>
						<#if concern_index==2>
						<#break>
						</#if>
					</#list>
				</div>
		
		<div class="row other-row" style="width:900px;">
			<#list concernList as concern>
				<#if (concern_index>2)>
				<div class="col-md-3 concernGoods">
							<div class="goods">
								<div style="width:0px;height:0px" class="cancel">
									<a href="javascript:;" class="closeGoods" ><img  src="${BasePath}/images/2bconcern/shan_1_u149.png" style="width:18px;height:18px;border:none;"/></a>
								</div>
								<input type="hidden" value="${concern.id}" class="concernId"/>
								<div style="width:0px;height:0px">
									<#if concern.remindStatus==1>
									<i class="btn glyphicon glyphicon-arrow-down remind" style="font-size:18px;color:#1B9D97"></i>
									<#else>
									<i class="btn glyphicon glyphicon-arrow-down remind" style="font-size:18px;color:#666"></i>
									</#if>
									<input type="hidden" class="state" value="${concern.remindStatus}"/>
								</div>
								
								<!--这部分要重写by-jack-->
								<div class="guanzhu-img">
									<img src="${concern.goods.goodsImg}">
									<p class="price">${concern.goods.goodsName!''}</p>
								</div>
								<br/>
								<p class="price">原价&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr">${concern.price}</span>&nbsp;元</p>
								<p class="price">现价&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr">${concern.goods.goodsPrice}</span>&nbsp;元</p>
								<#if (concern.price-concern.goods.goodsPrice>0)>
								<p class="price" id="reduce">直降&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr" style="color:#1B9D97;">${concern.price-concern.goods.goodsPrice}</span>&nbsp;元</p>
								<#else>
								<p class="price" id="reduce">涨价&nbsp;&nbsp;:&nbsp;&nbsp;<span class="pr" style="color:#1B9D97;">${concern.goods.goodsPrice-concern.price}</span>&nbsp;元</p>
								</#if>
								<button onClick="look('${concern.goods.id}')" class="btn btn-primary add add-guanzhu">立即购买</button>
							</div>
						</div>
				</#if>
			</#list>
		</div>
		<input type="hidden" id="pageNo" value="${pageNo}"/>
	 		${pageCode} 
	 		
	 		
	 		
	</div>
	
	<div id="concernhd">
	 		
	 		<p style="font-size:14px;margin-left:4px;">本期蔬菜团：</p>
	 		<div>
	 		 <a href="javascript:;"><img  src="${BasePath}/images/2bconcern/u195.png" style="width:770px;"/></a>
	 		</div>
	 </div>
	
	<div class="modal fade" id="cancelRemindFm">
    <div class="modal-dialog" style="width:300px;">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title"><i class="glyphicon glyphicon-exclamation-sign" style=" font-size:15px;color:#a94442"></i>取消降价提醒</h4>  
      </div>  
      <div class="modal-body">  
        <p><font class="red">即将取消降价提醒,</font></p>
        <p><font class="red">取消后将无法继续在邮箱接受本产品降价到您预期价格的提醒。</font></p>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="conId1"/>  
         <button  id="cancelRemind" class="btn btn-success" data-dismiss="modal">确认取消</button> 
         <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>   
      </div>  
    </div>
  </div>
</div>
</div>
	<#--
<div class="modal fade" id="addRemindFm">  
    <div class="modal-dialog" style="width:300px;">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">添加降价提醒</h4>  
      </div>  
      <div class="modal-body">  
        <p>若商品在90日内降价，我们会通过邮件、短信和手机客户端来通知您哦~</p>
        <p><font class="red">商品低于&nbsp;:&nbsp;</font><input type="text" style="width:74px;" class="border" name="expectPrice" id="expectPrice"/>
           <font class="red">元</font>,通知我</p>
        <p>手机号码&nbsp;:&nbsp;<input class="border" readonly="readonly" type="text" value="${user.mobile!""}"/></p>
        <p>邮箱地址&nbsp;:&nbsp;<input class="border" readonly="readonly" type="text" value="${user.email!""}"/></p>
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="conId2"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>  
         <button  id="addRemind" class="btn btn-success" data-dismiss="modal">确认</button>  
      </div>  
    </div>
  </div>
</div>

<div class="modal fade" id="successRemindFm">
    <div class="modal-dialog" style="width:300px;">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title"><i class="glyphicon glyphicon-ok-circle" style=" font-size:18px;color:#1B9D97"></i>降价提醒设置成功</h4>  
      </div>  
      <div class="modal-body">  
        <p><font >您关注的产品价格到达<font id="price1" class="red"></font>元的时候,</font></p>
        <p><font >系统会发送到您的邮箱，记得查收哦~。</font></p>  
      </div>  
      <div class="modal-footer">  
         <button  id="cancelRemind" class="btn btn-success" data-dismiss="modal">确认</button>  
      </div>  
    </div>
  </div>
</div>

-->

 
   
</@layout>
<#--    模态窗口——降价通知 -->
<div class="jiangjiatongzhi_t1" style="top:0px;left:0px;">
       <div class="jiangjiatongzhi_t3">
           <a href="javascript:;" class="quxiao-X">x</a>
           <div class="jjtz_tit">
               降价通知
           </div>
           <div class="jjtz_z1">
                <div class="jjtz_zl_l">

                </div>
               <div class="jjtz_zl_r">
                   <div class="jjtz_zl_r_tit">通知预约成功！</div>
                   <div class="jjtz_zl_r_body">若商品在90日内降价，我们会通过邮件、 <br>短信和手机客户端来通知您哦~</div>
                   <button class="jjtz_zl_r_guanbi">关闭</button>
               </div>
           </div>
       </div>
        <div class="jiangjiatongzhi_t2">
            <a href="javascript:;" class="quxiao-X">x</a>
            <div class="jiangjiatongzhi_wap">
                <div class="jjtz_tit">
                    降价通知
                </div>
                <div class="jjtz_ts">
                    当商品降价时，我们可以为您提供以下服务
                </div>
                <div class="jjtz_tzn">
                    通知您
                    <div class="jjtz_tzn_xl"></div>
                </div>

                <div class="jjtz_xia">
                    <div class="notice-tab-cont" id="notify_cont_flag" style="display: block;">
                        <form class="popup-notice-form clearfix" id="form">
                            <p class="hint">若商品在90日内降价，我们会通过邮件、短信和手机客户端来通知您哦~</p>
                            <div class="form-item lowest-price">
                                <div class="field-label">当商品低于：</div>
                                <div class="field-value">
                                    <input type="text" class="input-text1_1" name="hopePrice" id="expectPrice" value="">
                                    <span style="color:#999;margin-left:10px;">通知你</span>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="field-label">手机号码：</div>
                                <div class="field-value">
                                	<#if user?? >
                                    		<input type="text" class="input-text" readonly="readonly" value="${user.mobile!""}" name="cellphone" id="cellphone">
                                    	<#else>
                                    		<input type="text" class="input-text" readonly="readonly" value="" name="cellphone" id="cellphone" >
                                	</#if>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="field-label">邮箱地址：</div>
                                <div class="field-value">
                                	<#if user?? >
                                   		 <input type="text" class="input-text J-email-input" readonly="readonly" name="email" value="${user.email!""}" id="email"/>
                                    	<#else>
                                    	 <input type="text" class="input-text J-email-input" readonly="readonly" name="email" value="" id="email" />
                                    </#if>
                                    <ul class="auto-complete hide" style="display: none;">
                                    </ul>
                                </div>
                            </div>
                            <div class="form-btnbox">
                            	<input type="hidden" id="conId2"/>  
                                <button class="btn-primary" id="addRemind" type="button" >确定</button>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
   </div> 
