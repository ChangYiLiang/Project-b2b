<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/about.css" />
<link rel="shortcut icon" href="${BasePath}/favicon.ico"/>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${BasePath}/layer/layer.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/layerEx.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jqslide.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoopAll.js"></script>
<!--导航部分-->
<div class="nav_wrp" style="width:100%">
    <!--登录部分-->
    <div class="nav_ti">
        <div class="nav_center nav_center3">
            <div class="nav_left">
            	<#if user ??>
					<span><a style="text-decoration:none" href="${BasePath}/controller/toUserCenter.do" target="_self">${user.username?default("")}，欢迎来到九河网&nbsp;&nbsp; </a></span>
					<span><a style="text-decoration:none" href="${BasePath}/controller/logout.do" target="_self">退出</a></span>	
				<#else>
	  				<span class="current_r">欢迎访问九河网！请&nbsp;<a style="text-decoration:none" href="${BasePath}/login.html" target="_self" id="toLogin">登录</a></span>
                	<span><a style="text-decoration:none" href="${BasePath}/register.html" target="_self">注册</a></span>
				</#if>
            </div>
            <div class="nav_right">
                <ul class="clearfix">

                    <li class="xiugai1"><a href="${BasePath}">九河网首页</a></li>
                    <li class="xiugai1"><a href="${BasePath}/controller/toUserCenter.do">我的九河网</a><em class="you1"></em>
                        <ul class="liebiao1">
                            <li><a href="${BasePath}/controller/order/tomyorder.do" class="xiugai3">我的订单</a></li>
                            <li>   <a href="#" class="xiugai3">我的积分</a></li>

                        </ul>
                    </li>
                    <li class="nav_xiaoxi">消息中心 
                        <ul class="liebiao1 liebiao2">
                            <li class="xiugai1"><a href="${BasePath}/message/list.do" class="xiugai2">活动消息</a></li>
                            <li class="xiugai1">   <a href="#" class="xiugai2">与我相关</a>
                            	<!--
                                <span class="my_xiaoxi"></span>
                                -->
                            </li>

                        </ul>
                    </li>
                    <li >会员俱乐部 <em class="you3"></em>
                        <ul class="liebiao1 liebiao2">
                            <li><a href="#" class="xiugai2">九河社区</a></li>
                            <li><a href="#" class="xiugai2">积分商城</a></li>
                        </ul>
                    </li>
                    <li >9he - Family <em class="you3"></em>
                        <ul class="liebiao1 liebiao2">
                            <li><a href="#" class="xiugai2">九河集团</a></li>
                          <#--  <li><a href="#" class="xiugai2">九河互联</a></li>-->
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--logo部分-->
    <div class="nav_center">
    	<a href="${BasePath}">
        	<div class="nav_logo" style="background:url(${BasePath}/images/2bmain/9helogocha.png) no-repeat left bottom;width:255px;height:112px;float:left;padding-left:35px;position:relative;left:-52px;top:22px"></div>
        </a>
        <div class="nav_daohang">
            <form action="${BasePath}/search.do" method="get" accept-charset="utf-8"  class="ar_so_3">
                <input type="text"  class="ar_so_1" placeholder="产品名称/型号" name="keyword"/>
                <input type="submit" value="搜索"class="ar_so_2" />
            </form>
            <#if user ??>
	            <div class="shop_wap clearfix">
	                <div class="shopcar" id="gouwu">
	                    <div class="shopwen" id="gouwu2">购物车</div>
	                    <div class="shopnum">${cartlong?default(0)}</div><em class="you4"></em>
	                </div>
	                <div class="shop_con1">
	                    <div class="zhedang"></div>
	                    <div class="f1">最新加入的商品</div>
	                    <div class="f2">购物车暂无商品</div>
	                    <div class="f3">
	                        <div class="f3_fl1">共计<span class="red_sp">0</span> 件商品，共计 <span class="red_sp">￥</span></div>
	                         <a href="${BasePath}/cart/mycart.do">去购物车</a>
	                    </div>
	                </div>
	                <div class="shop_con2">
	                    <div class="zhedang"></div>
	                    <div class="f1">最新加入的商品</div>
	                    <div class="f4">
	                        <ul class="jsprice">
	                        	<#list cartuser as ct>
	                            <li>
	                                <div class="p_img">
	                                    <img src="${ct.goodsImg?default("")}" alt="" width="50" height="50"></a>
	                                </div>
	                                <div class="p_name" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
	                                    <a href="#" title="XXX" target="_blank" class="a_con">${ct.goodsName}</a>
	                                </div>
	                                <div class="p-detail">
	                                        <span class="p-price">
	                                            <strong>${ct.allprice?default(0)}</strong>
	                                            x${ct.goodsNum}
	                                        </span>
	                                    <br>
	                                    <a class="delete" data="${ct.id}" href="">删除</a>
	                                </div>
	                            </li>
	                            </#list>
	                        </ul>
	                    </div>
	                    <div class="f3">
	                        <div class="f3_fl1">共计 <span class="red_sp">￥${cartsum?default(0)}</span></div>
	                        <a href="${BasePath}/cart/mycart.do">去购物车</a>
	                    </div>
	                </div>
	            </div>
	        <#else>
	        	<div class="shop_wap clearfix">
	                <div class="shopcar" id="gouwu">
	                    <div class="shopwen" id="gouwu2">购物车</div>
	                    <div class="shopnum">0 </div><em class="you4"></em>
	                </div>
	                <div class="shop_con1">
	                    <div class="zhedang"></div>
	                    <div class="f1">最新加入的商品</div>
	                    <div class="f2">您还未登录，<strong><a href="${BasePath}/login.html" style="color:#1b9d97">马上登录</a></strong> 查看购物车吧！</div>
	                    <div class="f3">
	                    </div>
	                </div>
	            </div>
            </#if>
            <!--出现的热门的搜索词-->
            <div class="remenci">
            	<@include path="/widget/website/search-hot-keyword.do" />
            </div>

        </div>
    </div>
</div>
<!--首页导航-->
<div class="shouyedaohao_wrp clearfix">
<div class="shouyedaohao clearfix">
    <@include path="/widget/website/product-navigation.do" />
</div>
</div>
<script>
	$(function(){
		$(".delete").click(function(){
			var BasePath=$("#BasePath").text();
			var url=BasePath+"/cart/delete.do";
			var data={
					"id":$(this).attr("data")
				};
		$.ajax({url:url,data:data,success:function(data){
					if(data == "success"){
						 alert("删除成功！！！");
						 document.execCommand("Refresh");
					} else {
						 alert("删除失败！！！");
						 document.execCommand("Refresh");		
					}
		        }
			});
		});
	});
	
</script>
<div id="loginAlert" class="jh-login-panel" style="display: none">
    <h3>亲, 你还没有登录哦~</h3>
    <p>现在去 <a href="${BasePath}/login.html">登录 &gt;&gt;</a></p>
</div>
<span id="BasePath" style="display:none">${BasePath}</span>