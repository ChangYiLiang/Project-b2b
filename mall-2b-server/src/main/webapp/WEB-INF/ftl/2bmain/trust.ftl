<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>

<#include "../keyword.ftl" >

<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/dell_r230.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/zoomify.min.css"/>
<link rel="shortcut icon" href="favicon.ico"/>
<script type="text/javascript" src="${BasePath}/scripts/custom/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jqslide.js"></script>

<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop2.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop3.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop4.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop5.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop6.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop7.js"></script>

<script type="text/javascript" src="${BasePath}/scripts/custom/cl.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/ex.js"></script>


<link rel="stylesheet" href="${BasePath}/css/agenttrust.css">

<ul style="display:none">
	<#list mapp?keys as val>
		<#if val_index = len-1>
			<li>
				<ul class="Pikachu">
					<#list mapp[val] as v>
						<li data="${v.id}">${v.price}</li>
					</#list>
				</ul>
			</li>
		</#if>
	</#list>
</ul>

<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
	function autoflag(){
		var flag = "${goods.goodsName}";    
        var liLength = $("#bibi li").length;
        //alert(liLength);    
        for(var i = 0; i < liLength; i++){   
            var Eva = $("#bibi li a")[i];  
            //alert(Eva.innerHTML);
            if(Eva.innerHTML==flag){
            	//alert(i);
            	var b = i;
            	//注：实在不了解为什么一定要重新给i值定义下面才能识别eq(xx) 
            	//获取该ul对象
            	ls = document.getElementById("bibi").getElementsByTagName("li");
				//给该对象某个li添加样式class
				ls[i].className="bb";
				$(function(){
					$("#bibi").children("li:eq("+b+")").children("a").css({"color":"white"});
				})
            }    
        }   
    }
    
    $(function(){
		$(".P_price").ready(function(){

			var ipData = $(".Pikachu").children("li:eq(0)").attr("data");
			var ipVal = $(".Pikachu").children("li:eq(0)").text();

			var l = ${len}-1;
			var p = "";
			var d = "";
			var k = "";
			for(var i=0;i<l;i++){			
				p +="<li>0</li>";
				d +="<li>0</li>";
				k +="<li></li>";
			}			
			$(".P_price").append(p);
			$(".P_id").append(d);
			$(".right-ul").append(k);
			$(".P_id2").children("li:eq(0)").text(ipData);
			$(".P_id2").children("li:eq(0)").attr("data",ipVal);
			$("#ipprice").text(ipVal);
			$("#ipflag").val(ipData);
		});
	});
    
	$(function(){
		$(document).ready(function(){
			autoflag();
		})
	})
	
	$(function(){
		$(document).ready(function(){
		$("#sz").hide();
	     $('.nb_ce').children("div").eq(0).show().siblings().hide();
	     $("#yueg").hide();
	     
	     <#--赊账和分期付款-->
	     $("#qk").click(function(){
	     		$("#yueg").hide();
	     		$("#quank").show();
	     		$("#ljgm").val("立即购买");
	     		<#--
	     		$("#gwc").val("加入购物车");-->
	     		$("#gwc").show();
	     		$("#sz").hide();
	     		$("#gssy").val("0");
	     })
	      $("#fq").click(function(){
	            var email = $("#email").val();
	     		$("#yueg").show();
	     		$("#quank").hide();
	     		$("#ljgm").val("立即赊账");
	     		$("#ljgm").attr({"disabled":true});
	     		<#--
	     		$("#gwc").val("了解赊账");-->
	     		$("#gwc").hide();
	     		$("#sz").show();
	     		$("#gssy").val("1");
	     })
		});
	});
	 $(function(){
	 		
	 		$(".xfqt").click(function(){
	 			$(".xfqt").removeClass("lists");
				$(this).addClass("lists");
	 		})
	   <#--模态窗口--> 
            $('.jiangjiatongzhi').click(function(){
            	var remind = $(".jiangjiatongzhi").html();
            	var email = $("#email").val();
            	if(email==""){
            		layer.open({type: 1, content: $("#loginAlert"), area: ["610px", "280px"], title: false, btn: false, shadeClose: true});
            	}else{
            		if(remind=='降价通知'){
						$('.jiangjiatongzhi_t1').stop().fadeIn();
	               		$('.jiangjiatongzhi_wap').stop().fadeIn();
					}else if(remind=='已通知'){
						layer.alertEx({content: "该商品已经设置为降价通知", icon: "info", end: function() { }});
					}
            	}
            })
            $('.quxiao-X').click(function(){
                $('.jiangjiatongzhi_t1').stop().fadeOut();
            })
            $('.btn-primary').click(function(){
            
            var  expectPrice = $("#price-notice").val();
			var  goodsId = $("#goodsId").val();
			var  goodsPrice = $("#price").val();  
        	if(!isNaN(expectPrice) && $.trim(expectPrice)){
        	$.post("${BasePath}/concern/concernGoods.do",{expectPrice:expectPrice,goodsId:goodsId,goodsPrice:goodsPrice},function(data){
        		if(data=='1'){
        			$(".jiangjiatongzhi").html("已通知");
        			$('.jiangjiatongzhi_wap').stop().fadeOut();
                	$('.jiangjiatongzhi_t3').stop().fadeIn();
                	$('.guanzhu_1').html("已关注");
        		}else{
        			layer.alertEx({content: "邮箱未验证!", icon: "info", end: function() { }});
        		}
        	},'json')
        	}else{
        		layer.alertEx({content: "你不能这么做!", icon: "info", end: function() { }});
        	}
            })
            $('.jjtz_zl_r_guanbi').click(function(){
                $('.jiangjiatongzhi_t3').stop().fadeOut();
                $('.jiangjiatongzhi_t1').stop().fadeOut();
            })
     });
     $(function(){
     	$(".mm").click(function(){
     		var v = $(this).attr("data");
     		$("#trustarea").attr("value",v);
     	})
     })
     
     $(function(){
     	/*选项卡固定头部*/
          var mtst = $('.neibu_ce').offset().top;
        
        $(window).scroll(function () {
              
                    if($(window).scrollTop()>mtst){
                    $('.neibu_ce ').addClass('nav_3_current');
                }else if($(window).scrollTop() < mtst-50){
                    $('.neibu_ce ').removeClass('nav_3_current');
                }
            });
  
		/*end选项卡固定头部*/
		/*单卖商品轮播选项卡*/
		$(function(){
			$('.ban-head li').click(function(){
				var i = $(this).index();
				$(".ban-fuwuqi").children("li:eq("+i+")").show().siblings().hide();
				$(this).addClass('current').siblings().removeClass('current');
			})
		})
		
     })
     
     $(function(){
		$(".consult_btn1").click(function(){
			$("#globalService").click();
		})
	})
     
     function GoCenter(){
     
     	window.location.href="${BasePath}/controller/order/tomyorder.do";
     	
     }
     
     $(function(){
     	$(".chacha").click(function(){
     		var url="${BasePath}/i9he/manpower.do";
			var data={
					"id":${goods.id}
				};
			$.ajax({url:url,data:data,success:function(data){
						if(data=="true"){
							layer.alertEx({content: "创建成功，此商品须联系客服人员确定价格！", icon: "info", end: function() { }});
							setTimeout("GoCenter()",2500);
						}
			        }
				});
     	})
     })
     
     
     $(function(){
        breathLoop7(5000);
        $('.nb_jieshao').show();
        $('.s_rb').show();
       $('.zuobtn').click(function(){
           $('.saituul').animate({left:"-220px"});
       })
       $('.youbtn').click(function(){
           $('.saituul').animate({left:"0px"});
       })
       $('.huifu').click(function(){
           $(this).siblings('.kuangj').show();
       })
       $('.daohul li').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
           $('.nb_ce').children("div").eq($(this).index()).show().siblings().hide();
       })
       $('.s_rt span').eq(0).click(function(){
           $(this).addClass('current').siblings().removeClass('current');
           $('.s_rb').show().siblings('.s_rb2').hide();
       })
       $('.s_rt span').eq(1).click(function(){
           $(this).addClass('current').siblings().removeClass('current');
           $('.s_rb2').show().siblings('.s_rb').hide();
       })
       $('.s_rb2 input,.s_rb input').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
       })
       $('.baoz_r div').hover(function(){
           $('.tuihuang7 div').eq($(this).index()).show().siblings().hide();
       },function(){
           $('.tuihuang7 div').hide();
       });
       $('.diqu_r input').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
       })
       $('.xinghao input').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
       })
    })
	
	
</script>

<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/trust.js"></script>

<script type="text/javascript" src="${goods.jsfile!""}"></script>

<script type="text/javascript" src="${BasePath}/scripts/custom/cl.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/ex.js"></script>
<style>
	.xuanze1{padding:0 0 0 0px;}
	.P_box0 li{height:50px}
	.xinghao a{display:inline-block}
	.goodscat{display:inline-block}
	.xinghao_in{width:174px;height:28px;text-align:center;line-height:28px;margin-bottom:5px;background:white;border:1px solid #ccc}
	.bb{background-color:#1b9d97;height:32px !important;line-height:32px !important;color:white !important}
	#bibi{width:530px;height:auto;display:inline-block;margin-bottom:10px}
	#bibi li{float:left;width:100px;height:30px;text-align:center;line-height:30px;margin-bottom:5px;margin-right:5px}
	#bibi li a{color:#666}
	#fenqi { font:12px verdana, arial, sans-serif;}
	#fenqi, #fenqi li {
		list-style:none; 
		padding:0; 
		margin:0; 
		}
	#fenqi li {
		padding-top:1px;
		padding-left:20px;
		margin-left:8px;
		width:40px;
		height:17px;
		border:1px solid #999999;
		float:left; 
		}
	.sc{color:#dd143c;font-size:20px;}
	#quank{margin-left:68px; margin-top:20px;}
	#yueg{margin-left:55px; margin-top:25px;}
	#fqyg{margin-left:10px; margin-top:20px;}
	.fqyg{font-size:16px;color:#dd143c;}
	.hmfq{background:#999 !important}
	.lists{background:#1b9d97;color:White}
</style>

<!--     加关注css样式-->
<style>
.guanzhu_tianj{
	display: inline-block;
	width: 14px;
	height: 13px;
	background: url(../images/comment/sprite.png) no-repeat;
	background-position: -52px -44px;
	vertical-align: middle;
	margin-right: 5px;
}
.guanzhu_1{
	font-style: normal;
	display: inline-block;
		vertical-align: middle;
}
.attention_t1{width: 100%; height: 100%; background: rgba(0,0,0,0.5); position: fixed; z-index: 10;display: none;}
.regMessage{width: 100%; height: 100%; background: rgba(0,0,0,0.5); position: fixed; z-index: 10;display: none;}
.attention_t2{  width:500px;height: 150px; position:fixed; z-index: 11; left: 50%; top: 8%; margin: 75px 0 0 -250px;}
.attention_t3{  width:500px;height: 150px; position:fixed; z-index: 12; left: 50%; top: 8%; margin: 75px 0 0 -250px;display: none;}
.regMessage_1{ width:500px;height: 150px; position:fixed; z-index: 12; left: 50%; top: 8%; margin: 75px 0 0 -250px;display: none;}
.attention_wap1,.attention_wap2{width:500px;height: 230px;background:#fff;}
.attention_con1{
	margin-top:33px;
	padding:0 0 10px 162px;
	overflow: hidden;
}
.attention_icon{ 
	width: 40px;
    height: 40px;
  	margin:0px 10px 0 0px;
    vertical-align: middle;
    background-position: 0 -60px;
    display: inline-block;
   background-image: url(../images/comment/sprite-tip.png);
    background-repeat: no-repeat;}
.attention_success{font-weight: bold;color:#333;font-size: 16px;vertical-align: middle;}
.attention-check{font-size: 14px;color: #666666;display: inline-block;color:#1B979D;}
.syReg{font-size: 14px;color: #666666;display: inline-block;color:#1B979D;}
.attention-con2{text-align: center;line-height: 28px;font-size: 14px;height: 28px;padding-top:17px;}	
.close{display: inline-block;position:absolute;top:0px;right:10px;
    font-size:21px;color:#333333;}
    .r20_duibi .duibi{border:none;}
</style>


<#--加关注js代码-->
<script type="text/javascript">
$(function(){
	$('.duibi').click(function(){
		if($('.guanzhu_1').html() == "关注"){
		 	
		 	var email = $("#email").val();
            	if(email==""){
            		layer.open({type: 1, content: $("#loginAlert"), area: ["610px", "280px"], title: false, btn: false, shadeClose: true});
            		return;
            }
            var  goodsPrice = $("#price").val();
			var  goodsId = $("#goodsId").val();
			var state = 0;
		    $.post("${BasePath}/concern/concernGoods.do",{goodsId:goodsId,goodsPrice:goodsPrice,state:state},function(data){
		   			if(data=='1'){
		   			   $('.attention_t1').stop().fadeIn();
			           $('.attention_t2').stop().fadeIn();
			           $('.attention_t3').stop().fadeOut();
					   $('.guanzhu_1').html("已关注");
		   			}else{
		   				layer.alertEx({content: "邮箱未验证!", icon: "info", end: function() { }});
		   			}
		   	
		   },'json')
		}else{
		   $('.attention_t1').stop().fadeIn();
           $('.attention_t3').stop().fadeIn();
           $('.attention_t2').stop().fadeOut();
		}
	})
     $('.quxiao-X').click(function(){
        $('.attention_t1').stop().fadeOut();
    })	
    $(".close").click(function(){
    	$(".regMessage").stop().fadeOut();
    })
    $(".attention-check").click(function(){
    	var email = $("#email").val();
            	if(email==""){
            		layer.open({type: 1, content: $("#loginAlert"), area: ["610px", "280px"], title: false, btn: false, shadeClose: true});
            		return;
               }
         $(this).prop("href","${BasePath}/concern/list.do");  
    })
         init();
         function init(){
         	var  goodsId = $("#goodsId").val();
         	var email = $("#email").val();
		         	if(email!=""){
		         		$.post("${BasePath}/concern/isConcern.do",{goodsId:goodsId},function(data){
							if(data=='1'){
								$(".guanzhu_1").html("已关注");
							}else{
								$(".guanzhu_1").html("关注");
							}
					},'json');
					$.post("${BasePath}/concern/isRemind.do",{goodsId:goodsId},function(data){
							if(data=='1'){
								$(".jiangjiatongzhi").html("已通知");
							}else{
								$(".jiangjiatongzhi").html("降价通知");
							}
					},'json');
		         }
         	}
})

</script>

</head>
<!--[if IE 7]><body class="ie7 page-header-fixed"><![endif]-->
<!--[if IE 8]><body class="ie8 page-header-fixed"><![endif]-->
<!--[if IE 9]><body class="ie9 page-header-fixed"><![endif]-->
<!--[if !IE]>-->
<body class="page-header-fixed">

<!--    模态窗口——关注弹窗 -->
   <div class="attention_t1">
        <div class="attention_t3">
            <a href="javascript:;" class="quxiao-X">x</a>
            <div class="attention_wap1">
                <div class="jjtz_tit">
                   提示
                </div>
                <div class="attention_con1">
                	<i class="attention_icon" style="background-position: -180px 0;"></i><span class="attention_success">您已关注该产品</span>
                </div>
                <div class="attention-con2">您已关注该产品，更多关注内容，请点击<a href="javascript:;" class="attention-check">查看我的关注</a></div>
            </div>
        </div>
        <div class="attention_t2">
            <a href="javascript:;" class="quxiao-X">x</a>
            <div class="attention_wap2">
                <div class="jjtz_tit">
                   提示
                </div>
                <div class="attention_con1">
                	<i class="attention_icon"></i><span class="attention_success">关注成功</span>
                </div>
                <div class="attention-con2">感谢您的关注，更多关注内容，请点击<a href="javascript:;" class="attention-check">查看我的关注</a></div>
            </div>
        </div>
   </div>
<!--    end模态窗口——关注弹窗 -->
 <#--    模态窗口——降价通知 -->
   <div class="jiangjiatongzhi_t1">
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
                    <div class="notice-tab-cont hide" id="notify_cont_flag" style="display: block;">
                        <form class="popup-notice-form clearfix" id="form">
                            <p class="hint">若商品在90日内降价，我们会通过邮件、短信和手机客户端来通知您哦~</p>
                            <div class="form-item lowest-price">
                                <div class="field-label">当商品低于：</div>
                                <div class="field-value">
                                    <input type="text" class="input-text1_1" name="hopePrice" id="price-notice" value="">
                                    <span style="color:#999;margin-left:10px;">通知你</span>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="field-label">手机号码：</div>
                                <div class="field-value">
                                	<#if user?? >
                                    		<input type="text" class="input-text" value="${user.mobile!""}" name="cellphone" id="cellphone">
                                    	<#else>
                                    		<input type="text" class="input-text" value="" name="cellphone" id="cellphone" >
                                	</#if>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="field-label">邮箱地址：</div>
                                <div class="field-value">
                                	<#if user?? >
                                   		 <input type="text" class="input-text J-email-input" name="email" value="${user.email!""}" id="email"/>
                                    	<#else>
                                    	 <input type="text" class="input-text J-email-input" name="email" value="" id="email" />
                                    </#if>
                                    <ul class="auto-complete hide" style="display: none;">
                                    </ul>
                                </div>
                            </div>
                            <div class="form-btnbox">
                                <button class="btn-primary" type="button" >确定</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
   </div> 

<!--<![endif]-->
<#include "header2b.ftl" >
<div class="r230_dinggou" style="width:100%">
		<div style="width:1200px;margin:0px auto;">
        <div class="dinggou_tit" style="height:0px">当前位置><a href="#" target="_blank">${parName!""}></a><a href="#" target="_blank">${catname}></a><a href="javascript:;" class="R20">${goods.goodsName}</a></div>
        <div class="tit2">
            ${catname}托管订购
        </div>
        <div class="r230_con clearfix">
			<form action="${BasePath}/cart/rightnow.do"  method="post" id="form_cl" autocomplete="off">
				<input type="hidden" name="goodsId" id="goodsId" value="${goods.id}">
            	<input type="hidden" name="orderCycle" id="orderCycle" value="0">
            	<input type="hidden" name="pay" id="pay">
				<input type="hidden" name="config" id="config">
				<input type="hidden" name="isIdc" id="isIdc" value="1">
				<input type="hidden" name="idlink" id="idlink">
				<input type="hidden" name="ipnum" id="ipnum" value="1">
				<input type="hidden" name="ipflag" id="ipflag">
            	<input type="hidden" name="price" id="price" value="${goods.goodsPrice?default(0)}">
            	<input type="hidden" name="trustarea" id="trustarea" value="0">
            	<input type="hidden" name="gssy" value="0" id="gssy">
            	<input type="hidden" name="centerid" value="0" id="centerid">
            	<div class="xinghao">
                    <span class="tru-diqu">所在地区 :</span>
                    <div class="goodscat">
                    	<ul id="bibi">
		                    <#list goodscat as gc>
		                    	<li class="xinghao_in"><a href="${BasePath}/trust/${gc.id}.html">${gc.goodsName}</a></li>
		                    </#list>
	                    </ul>
                    </div>
                </div>
            		
            <div class="big-left">
				<ul class="ul-left">
					<#list mapp?keys as val>
						<#if val_index lt len-1>
							<li>
							<p class="left-p">${val}：</p>
								<ul class="ul-left${val_index}">
									<#list mapp[val] as v>
										<li><button type="button" class="btn btn-default" value="${v.price}" id="${v.id}">${v.title!""}</button></li>
									</#list>
								</ul>
							</li>
						</#if>
					</#list>
				</ul>
				
				<div class="buy-num" style="margin-top:5px">
				<p class="left-p">公网IP：</p>
						<ul class="ul-ip" style="position:relative;left:0px">
							<li>
								<button type="button" class="btn btn-success22" style="width:40px" onclick="ip_cut(min)" id="ip-leftcut">
									<span class="sty-ip"><img src="${BasePath}/images/2bmain/bottom.png"></span>
								</button>
								<input type="text" class="form-control ip sty-input" value="1" disabled>
								<button type="button" class="btn btn-success22" style="width:40px" onclick="ip_add(max)" id="ip-rightadd">
									<span class="sty-ip"><img src="${BasePath}/images/2bmain/top.png"></span>
								</button>
							</li>
						</ul>
				</div>	
				<div class="buy-num" style="margin-top:-15px">
				<p class="left-p" style="position:relative;top:-13px">购买时长：</p>
					<ul class="ul-time">
						<li><button type="button" class="btn btn-default" value="1">一年付</button></li>
						<li><button type="button" class="btn btn-default" value="2">两年付</button></li>
					</ul>
				</div>
				<div class="buy-num">
					<p class="left-p" style="position:relative;top:-30px">购买数量：</p>
						<ul class="ul-num" style="position:relative;top:-16px"> 
							<li>
								<button type="button" class="btn btn-success22" style="width:40px" onclick="goods_cut()" id="left-cut">
									<span class="sty-ip"><img src="${BasePath}/images/2bmain/bottom.png"></span>
								</button>
								<input type="text" class="form-control sty-input"  value="1"  id="number" name="number" readonly="readonly">
								<button type="button" class="btn btn-success22" style="width:40px" onclick="goods_add()" id="right-add">
									<span class="sty-ip"><img src="${BasePath}/images/2bmain/top.png"></span>
								</button>
							</li>
						</ul>
						<span id="ip-tip" style="position:relative;left:180px;top:-182px">增加<span id="ipprice"></span>元/个/年</span>
				</div>
			</div>
        </form>
       
      	<ul class="P_price" style="display:none">
		</ul>
		<ul class="P_price2" style="display:none">
			<li>1</li>
			<li>0</li>
			<li>1</li>
		</ul>
		<ul class="P_id" style="display:none">
		</ul>
		<ul class="P_id2" style="display:none">
			<li></li>
		</ul>
		
      	
      	
        <div class="r230_cr clearfix" style="width:450px;float:left;margin-top:-42px">
            <div class="dangqianpz" style="margin-left:-20px">当前所选配置</div>
            	<br/>
				<ul class="list-group right-ul" style="margin-bottom:-2px">
				</ul>
				<ul class="list-group right-ul2" style="margin-bottom:-2px">
					<li class="list-group-item">公网IP：1</li>
					<li class="list-group-item">购买时长：一年付</li>
					<li class="list-group-item" style="border-bottom:0px">购买数量：1</li>
				</ul>
				<ul class="list-group right-ul3" style="margin-bottom:-2px">
					<li class="list-group-item other-li">配置价格：<span class="price-sty"></span></li>
				</ul>
				<ul class="list-group right-ul4" style="margin-bottom:-2px">
					<li class="list-group-item other-li">基本价格：<span class="base-price"></span></li>
				</ul>
				<ul class="list-group right-ul5">
					<li class="list-group-item other-li">商品总价：<span class="all-price"></span></li>
				</ul>
			
            
            
            <div class="r230_jiage">
                <div class="r230jg_l"> 
               		<span class="r230_j">商城价：</span>
               		<span class="r230_g">￥</span>
               		<span class="r230_g M_pay" id="scj"></span>
               		&nbsp;<span class="jiangjiatongzhi">降价通知</span>
               		<div class="r20_duibi" style="margin-left:160px;margin-top:7px;"><a class="duibi" href="javascript:;"><span class="guanzhu_tianj" ></span><em class="guanzhu_1">关注</em></a></div>
               	</div>
            </div>
            <br/>
            
            <div class="radio">
                                       购买方式：&nbsp;
			  <label id="qk">
			    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>&nbsp;全额支付</label>
			  &nbsp;
			  <!--
			  <label id="fq">
			    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1" >&nbsp;河马赊账</label>
			    -->
			</div>
			
				<div id="yueg">
				<span style="margin-left:12px;">九河网为您提供“先提货，后付款”的信赊服务；</span><br/>
				
				<span style="margin-left:12px;">使用该服务需要通过河马赊账申请。</span><br/>
				<#--
					<ul id="fenqi">
						<li class="xfqt">3期</li>
						<li class="xfqt">6期</li>
						<li class="xfqt">12期</li>
						<li class="xfqt">24期</li>
					</ul>
					  <br>
					<p id="fqyg">月供:<span class="fqyg">￥</span><font class="fqyg">300元</font></p>
					-->
	          </div>
	          
          <div id="quank">
				商城价:<span class="sc">￥</span><span class="sc" id="allprice"></span>          		
          </div>
            	<div class="fukuan">
            	<#if user ??>
                   <input type="button" id="ljgm" name="submit" value="立即购买" class="fuk1" onclick="User.submit()"/>
                   <input type="button" id="gwc"  value="咨询客服" onclick="ysf.open()" class="fuk2" />
                   <input type="hidden" id="loginUrl" value="${loginUrl!""}">
                <#else>   
                   <input type="button" id="ljgm" value="立即购买" class="fuk1" onclick="User.noLogin()"/>
                   <input type="button" id="gwc"  value="咨询客服" onclick="ysf.open()" class="fuk2" />
                </#if>
                   		<a href="${BasePath}/about/jinrong.do" target="_blank" id="sz" style="font-size:13px;">了解河马赊账>>></a>
                </div>
              </div>
           </div>         
    </div>
    	</div>
    </div>	
    <!-- 热销榜 -->
    <div class="rexiaob clearfix">
        <div class="rexiao_ce clearfix">
            <div class="rexiao_biao" style="background:url(${BasePath}/images/2bmain/rexiaob.png) no-repeat;">热销榜</div>
            <div class="rexiao_l">
            	<#list goodstype as gtt>
                <dl>
                    <dt><img src="${gtt.goodsImg!''}" alt="" /></dt>
                    <!--
                    <dd class="rexiaod1">${gtt.goodsName}</dd>
                    -->
                    <dd class="rexiaod2">${gtt.secondTitle?default("")}</dd>
                    <#if gtt.ifonly=1>
                    	<dd class="rexiaod3">￥${gtt.goodsPrice?default("0")}</dd>
                    <#else>
                    	<dd style="margin-top:5px;margin-bottom:5px"><a href="javascript:;" onclick="ysf.open()">客服询价</a></dd>
                    </#if>
                    <dd><a href="${BasePath}/trust/${gtt.id}.html" class="lijigoum">立即购买</a></dd>
                </dl>
                </#list> 
            </div>
            <div class="rexiao_r">
                <dl>
                    <dt>活动促销</dt>
                    <!--
                    <dd><span class="dian1">•</span><a href="javascript:;">高效简捷 戴尔R230 仅售5999</a></dd>
                    <dd><span class="dian1">•</span><a href="javascript:;">助力成长型企业 R530 正在热销</a></dd>
                    <dd><span class="dian1">•</span><a href="javascript:;">DELL R730 明星服务器 现货促销</a></dd>
                    -->
                    <#list pro as pr>
                    	<dd><span class="dian1">•</span><a href="${pr.promotionUrl!""}">${pr.title!""}</a></dd>
                    </#list>
                </dl>
            </div>
        </div>
    </div>
   
   <!-- 产品内部导航 -->
    <div class="neibudaoh clearfix">
        <div class="neibu_ce">
            <ul class="clearfix daohul">
                <li class="current">产品介绍</li>
                <li>配置参数</li>
                <li>口碑评价</li>
                <li>服务保障</li>
                <li>评测详解</li>
                <li>社区论坛</li>
            </ul>
        </div>
        <div class="neibudaohcon" style="width:100%">
            <div class="nb_ce"> 
            	<!-- 介绍 -->
            	<div class="jieshao">
	            	<br/>
	            	<br/>
	            	${goods.goodsDesc?default("暂时没有")}
            	</div>
                <!-- 配置参数 -->
                <div class="peizhics">
	                <br/>
	                <div class="nbs">
                        <li class="peizhi_tit">
                            <div class="peiziz">特性</div>
                            <div class="peiziy">${goods.goodsName}技术规格</div>
                        </li>
                        <style>
                        	.tab{margin-left:-2px}
                        	.tab tr td{background:#edf2f2;font-size: 16px;
									   padding: 17px 0 14px 23px;}
                        </style>
                        <table class="tab">
	                        <#list goodstag as gtag>
		                        <tr>
		                        	<td style="width:283px">${gtag.goodsTag}</td>
		                        	<td style="width:844px">${gtag.goodsAttr}</td>
		                        </tr>
	                        </#list>
                        </table>
	                </div>
                </div>
                <!-- 口碑评价 -->
                <div class="koubei_pj clearfix">
	                <div class="nbs">
	                     <div class="haopingd clearfix">
	                 
	                     </div>
	                    <ul class="pingjiatongji clearfix">
	                        <li class="haopingli">全部评价（${counts.allCount!''}+）</li>
	                        <li class="haopingli">好评率(<span style="color:red;font-weight:bold">${counts.commentDegree!''}%</span>)</li>
	                        <li>好评（${counts.positiveCount!''}+）</li>
	                        <li>中评（${counts.mediumCount!''}）</li>
	                        <li>差评（${counts.badCount!''}）</li>
	                    </ul>
	                    <#list comments as cot>
		                    <div class="kehupj clearfix">
		                        <div class="kuhutx">
		                            <dl>
		                                <dt>
		                                <#if cot.sex=='1'>
		                                	 <img src="${BasePath}/images/comment/u117.png" height="80" width="80" alt="" />
		                                	<#else>
		                                	 <img src="${BasePath}/images/comment/u157.png" height="80" width="80" alt="" />
		                                </#if>
		                                </dt>
		                                <dd class="dd1">${cot.userName}</dd>
		                            </dl>
		                        </div>
		                        <div class="pingjiacon">
		                            <div class="biaoqian1">
		                                   	商品满意度:&nbsp;&nbsp;
		                                   	<#list 1..cot.goodsSatisfied as i>
		                                   		<img src="${BasePath}/images/comment/u22.png">
		                                   	</#list>
		                            </div>
		                                 <div class="pingjiayu">
		                                  <span class="haopingli">[买家评价]：</span>${cot.content}<br/>
		                                  <span class="comment-date">[${cot.commentDate?datetime}]</span>
		                                </div>
		                                       <#if cot.photos??>
		                                       		<#list cot.photos as p>
		                                       			<#if p??&& p!=''>
		                                       			  <img class="comment-img" style="width:50px; height:50px;" src="${p}">
		                                       			</#if>
		                                       		</#list>
		                               		</#if>
		                                	<br/>
		                                    <div class="pingjiayu">
		                                    <span class="haopingli">[官方回复]：</span>${cot.replyContent?default("谢谢您的支持。")}<br/>
		                                    <span class="comment-date">[${cot.replyDate?datetime}]</span>
		                                    </div>
		                        </div>
		                           <#--
		                        <div class="saitu2 clearfix">
				                         <div class="saitu">
					                            <div class="zhanshi2">
					                         
						                                <ul class="clearfix saituul">	                            		
						                            		<#if cot.photos ??>
																<#list cot.photos as photo>
																	<li><img class="example" style="width:100px ;height:100px" src="${IncPath}/images/commentImg/${photo}"></img></li>
																</#list>
															</#if>	                            			          
						                                </ul>
					                              
					                            </div>
				                            <a href="javascript:;" class="zuobtn"></a>
				                            <a href="javascript:;" class="youbtn"></a>
				                        </div>
		                               <div class="saitu5"> 晒图   </div>
		                        </div>
		                         -->
		                    </div>
		                    
	                   </#list>
	                    
	                </div>  
                 </div>
                 <!--服务保障-->   
                 <div class="koubei_baoz clearfix">
                 <div class="nbs">
                     <div class="baozhang_tiaok">
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">01 </span>发货时间
                             </dt>
                             <dd>
                                 	一般产品下单付款后72小时内可发货（周六日及法定节假日除外），部分货源紧缺情况下以客服提供的发货时间为主，发货后物流信息会进行更新，如发现物流有异常情况，请第一时间跟客服联系，我们将尽快为您解决；
                             </dd>
                         </dl>
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">02 </span>邮寄物流
                             </dt>
                             <dd>
                                 	为了确保硬件产品安全无损送达客户手中，九河所有硬件产品默认发顺丰、联邦等第三方金牌物流公司，当然您也可以根据实际需求，选择更便捷安全的物流方式，深圳地区可以送货上门；
                             </dd>
                         </dl>
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">03 </span>关于发票
                             </dt>
                             <dd>
                                 	在九河网自营商城购买的产品均提供正规增值税发票，如有特殊要求，请联系官方在线客服，一般情况下商品与发票同行，如遇到特殊情况不能发票同行的情况，客服会第一时间与您沟通，并在3个工作日内邮寄发票；
                             </dd>
                         </dl>
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">04 </span>商品签收
                             </dt>
                             <dd>
                                 	快递送货给您后，请一定先核实商品数量并确认包装无损坏、封条是完好的后签收，一旦出现包装破损或其它异常情况，请第一时间联系客服并拒绝签收;
                             </dd>
                         </dl>
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">05 </span>7天价保
                             </dt>
                             <dd>
                                 	九河商城提供的硬件产品全国统一标价，公开透明价格细微到每一个组件；另外我们建立了完善的价格保护机制，购买服务器七天内价格如有下调变动，用户可以联系客服人员索取差价；
                             </dd>
                         </dl>
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">06 </span>关于退换货
                             </dt>
                             <dd>
                                 	客户在九河网自营商城购买的商品，在不影响二次销售并确认包装附件完整的前提下，支持7天无理由的退换货，超过7天无质量问题不支持无理由退货；用户购买货物30天内，由于商品的质量问题，可以提出“30天免费换货”的申请；质量问题由九河承担来回运费，个人原因以及人为损坏需要买家承担退货运费;
                             </dd>
                         </dl>
                         <dl class="tiaok_1">
                             <dt><span class="shuzi3">07 </span>正品联保
                             </dt>
                             <dd>
                                 	九河商城向您保证所售商品均为正品行货，凭质保证书及九河商城发票，可享受全国联保服务，联保时长均为三年以上，具体产品有所不同，详情咨询客服人员;
                             </dd>
                         </dl>
                     </div>
                     <div class="haoli"><img src="${BasePath}/images/2bmain/haoli.png" height="204" width="1200" alt="" /></div>
                 </div>
                 
                 </div>
                 <div class="canshu" style="width:1200px;margin:0px auto">
                 	<br/>
                 	<br/>
                 	<!--
                 	<img width="1200px" src="${goods.goodsTest?default("0")}">
                 	-->
                 	<img width="1200px" src="${BasePath}/images/2bcatmain/jianshe.png">		
                 </div>
                 
                 <div class="" style="width:1200px;margin:0px auto">
                 	<br/>
                 	<br/>
                 	<img width="1200px" src="${BasePath}/images/2bcatmain/jianshe.png">	
                 </div>
                
            </div>
        </div>
    </div>
    
   
   
<#include "footer2b.ftl" >
  <script id="addcart" type="text/html">
        <div>添加成功</div>
        <a href="${BasePath}/cart/mycart.do" style="font-size: 14px">去购物车</a>
  </script>
</body>
<script type="text/javascript" src="${BasePath}/scripts/custom/zoomify.js"></script>
<script type="text/javascript">
$(function(){
	$(".comment-img").zoomify();
})
</script>
</html>
