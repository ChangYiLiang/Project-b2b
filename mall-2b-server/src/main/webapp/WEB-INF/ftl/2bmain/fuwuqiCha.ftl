<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/about.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/dell_r230.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/img.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${BasePath}/css/zoomify.min.css" rel="stylesheet" type="text/css"/>
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
            	//获取该ul对象
            	ls = document.getElementById("bibi").getElementsByTagName("li");
				//给该对象某个li添加样式class
				ls[i].className="bb";
            }    
        }   
    }
	$(function(){
	  //点击图片放大
		$(".P_price").ready(function(){
			var l = ${len};
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
			$(".P_link").append(k);
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
     	$(".current").click(function(){
     		$(".pppp option[value='0']").click();
     		var t = 0;
     		$("#centerid").attr({"value":t});
     	})
     })
     $(function(){
     	$(".mm").click(function(){
     		var v = $(this).attr("data");
     		$("#trustarea").attr("value",v);
     		var url = "${BasePath}/i9he/datacenter.do";
     		var data= $(this).val();
     		if(data==0){
     			var t = 0;
     			$("#centerid").attr({"value":t});
     			$("#center").remove();
     			return false;
     		}
     		$.ajax({url:url,data:{"id":data},success:function(data){
					if(data){
						var obj = eval(data);
						var a   = "<select class='ppp' name='center' id='center'><option value='0'>-选择数据中心-</option>";
						var b   = "</select>";
						var s   ="";
						for(var i=0;i<obj.length;i++){
							var v=obj[i]['id'];
							var k=obj[i]['truname'];
							s +="<option value="+v+">"+k+"</option>";
						}
						var end=a+s+b;
						$("#center").remove();
						$(".pppp").after(end);
						$(document).on('click', '#center', function() {
							var t = $(this).val();
							$("#centerid").attr({"value":t});
						});
						return ;
					} else {
						alert("没有数据！！");
						return ;			
					}
		        }
			});
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
     
</script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/fuwuqi.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/cl.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/ex.js"></script>
<style>
	.xuanze1{padding:0 0 0 0px;}
	.P_box0 li{height:50px}
	.xinghao a{display:inline-block}
	.goodscat{display:inline-block}
	.xinghao_in{width:174px;height:30px;text-align:center;line-height:30px;margin-bottom:5px}
	.bb{background-color:#dd143c}
	#bibi{width:530px;height:auto;display:inline-block;margin-bottom:10px}
	#bibi li{float:left;width:170px;height:30px;text-align:center;line-height:30px;margin-bottom:5px;margin-right:5px}
	#bibi li a{color:white}
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
    
    
.Chanum{border:1px solid #ccc;width:40px;height:33px;text-align:center
}
.ChaQ{width:25px;height:15px;border:1px solid #ccc;display:inline-block;
text-align:center;line-height:12px}
.ChaQ:hover{
cursor:pointer
}
.ChaB{width:25px;height:30px;
display:inline-block;
position:relative;
top:8px;
}
.pppp,.ppp{width:80px;border:1px solid #ccc;height:25px;margin-bottom:10px}
.ppp{margin-left:40px;width:120px !important}
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
   
   <#--注册提示框
   <div class="regMessage">
   		<div class="regMessage_1">
            <a href="javascript:;" class="close">x</a>
            <div class="attention_wap1">
                <div class="jjtz_tit">
                                                              提示
                </div>
                <div class="attention_con1">
                	&nbsp;&nbsp;&nbsp;&nbsp;<span class="attention_success">您还没有注册信赊宝</span>
                </div>
                <div class="attention-con2">想赊账 <a href='${registerUrl!""}'  target="_blank" class="syReg">快到碗里来</a></div>
            </div>
        </div>
   </div>
-->

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