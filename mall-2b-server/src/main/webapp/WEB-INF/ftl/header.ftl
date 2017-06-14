<link rel="stylesheet" href="${IncPath}/css/fwq.css" type="text/css">

<script type="text/javascript">
    $(function(){
            $(".t_right span").mouseenter(function(){
        $(this).addClass("current_r").siblings().removeClass("current_r");
        })
    
    $(".nav_chan").mouseenter(function(){
        $(".list_box1").show();
        }).mouseleave(function(){
            $(".list_box1").hide();
            })
            
    $(".nav_tai").mouseenter(function(){
        $(".list_box2").show();
        }).mouseleave(function(){
            $(".list_box2").hide();
            })
            
    $(".nav_fu").mouseenter(function(){
        $(".list_box3").show();
        }).mouseleave(function(){
            $(".list_box3").hide();
            })
                        
    $(".us").mouseenter(function(){
        $(".list_box4").show();
        }).mouseleave(function(){
            $(".list_box4").hide();
            })

    })
</script>

<script> 
	var startTime,endTime; 
	var d=new Date(); 
	startTime=d.getTime();  
</script>

<div class="nav_container">  
	<div class="nav_top_box">
       <div class="nav_top">
            <div class="t_left"><a href="#">返回主站</a>&nbsp;&nbsp;&nbsp;&nbsp;技术支持QQ：800808876&nbsp;&nbsp;&nbsp;&nbsp;销售热线：4001193389</div>
            <div class="t_right">
            	<style>
            		.t_right p{display:inline-block}
            	</style>
            	
                <#if user ??>
					<p><a href="${BasePath}/controller/toUserCenter.do" target="_self">${user.username?default("")}，欢迎来到九河互联 </a></p>
					<p><a href="${BasePath}/controller/logout.do" target="_self">退出</a></p>	
				<#else>
	  				<#-- <span class="current_r"><a href="${CasPath}/login?service=${url}" target="_self" id="toLogin">登录</a></span> -->
                	<span><a href="${BasePath}/i9he/register.do" target="_self">注册</a></span>
				</#if>
    
            </div>
        </div>
    </div>  
    <div class="nav_foot">
    <div class="logo_box1"><a href="${BasePath}/i9he/main.do"><img src="${IncPath}/images/logo_11.png" style="border:none;"></a></div>
        <ul class="nav_list">
            <li><a href="${BasePath}/i9he/main.do">首页</a></li>
            <li class="nav_chan"><a href="http://idc.9he.com">IDC产品与服务</a> </li>
            <li class="nav_tai">数据中心硬件
                <div class="list_box2">
                 <dl class="libo_6">
                        <dt>服务器整机</dt>
                        <dd><a href="${BasePath}/i9he/mall/dell.do">戴尔（Dell）</a></dd>
                        <dd><a href="${BasePath}/i9he/mall/ibm.do">IBM服务器</a></dd>
                        <dd><a href="${BasePath}/i9he/mall/sys.do">美超微</a></dd>
                    </dl>
                    <dl class="libo_7">
                        <dt>服务器配件</dt>
                        <dd><a href="#">光纤/线缆</a></dd>

                    </dl>
                </div>
            </li>
            <li><a href="http://idc.9he.com/platform/he.shtml">平台与技术</a></li>
            <li class="nav_fu"><a href="http://idc.9he.com/service/customer.shtml">服务中心</a></li>
            <li class="us"><a href="http://idc.9he.com/about/index.shtml">关于我们</a></li>
        </ul>
    </div>
</div>

<!--中间绝对定位-->
<div class="fix_box">
    <ul class="f_b">

        <li class="weixin">
            <dl class="f_img2"></dl>
            <span>微信关注</span>
             <div class="weix_box"><img src="${IncPath}/images/main/ic_weix.png"></div>
        </li>
          <li>
             <a href="http://wpa.qq.com/msgrd?v=3&uin=1085047494&site=qq&menu=yes"><dl class="f_img3"></dl>
           <span>提交需求</span></a>
        </li>
        <li>
             <a href="#"><dl class="f_img6"></dl>
           <span>我的订单</span></a>
        </li>
 <!--        <li>
             <a href="#"><dl class="f_img4"></dl>
           <span>购物车</span><span class="hong">0</span></a>
        </li> -->
         <li class="top" onClick="goTop()">
            <dl class="f_img5"></dl>
            <span><a href="javascript:;" style="display:block; width:60px;height:14px;color:#fff;" >TOP</a></span>
        </li>
    </ul>
</div>

<script>
$(function(){
    $(".side ul li").hover(function(){
        $(this).find(".sidebox").stop().animate({"width":"120px"},100).css({"background":"#333"})   
    },function(){
        $(this).find(".sidebox").stop().animate({"width":"48px"},100).css({"background":"#dd143c"}) 
    });
});
//回到顶部函数
function goTop(){
    $('html,body').animate({'scrollTop':0},300);

}

//二维码函数
$(".weixin").mouseenter(function(){
    $(".weix_box").show();
    }).mouseleave(function(){
        $(".weix_box").hide();
        })
</script>
