<link rel="stylesheet" href="${IncPath}/css/idc.css" type="text/css">
<style>
	.base-price{color:red}
	.all-price{color:red}
</style>
<div class="nav_container">
	<div class="nav_top_box">
       <div class="nav_top">
            <div class="t_left"><a href="${BasePath}/i9he/main.do">返回主站</a>&nbsp;&nbsp;&nbsp;&nbsp;技术支持：4001193389</div>
            <div class="t_right">
            	<style>
            		.t_right p{display:inline-block;line-height:16px}
            	</style>
                <#if user ??>
					<p><a href="${BasePath}/controller/toUserCenter.do" target="_self">${user.username?default("")}，欢迎来到九河互联 </a></p>
					<p><a href="${BasePath}/controller/logout.do" target="_self">退出</a></p>	
				<#else>
	  				<span class="current_r"><a href="${CasPath}/login?service=${url}" target="_self" id="toLogin">登录</a></span>
                	<span><a href="${BasePath}/i9he/toRegister.do" target="_self">注册</a></span>
				</#if>
            </div>
        </div>
    </div>
    
    <div class="nav_foot">
    	<div class="logo_box1"><a href="${BasePath}/i9he/main.do"><img src="${IncPath}/images/logo_11.png" style="border:none;"></a></div>
        <ul class="nav_list">
        	
            <li><a href="${BasePath}/i9he/main.do">首页</a></li>
            <li class="nav_chan">产品
            	<div class="list_box1" style="height:500px">
            		<style>
            		 .libo_1 dd{width:200px}
            		</style>
                    <dl class="libo_1">
                        <dt>基础服务</dt>
                        <dd><a href="http://idc.9he.com/dedicated/hk.shtml">服务器租用</a></dd>
                        <dd><a href="http://idc.9he.com/colocation/usa.shtml">服务器托管</a></dd>
                        <dd><a href="http://idc.9he.com/ddos/hk.shtml">高防服务器</a></dd>
                        <dd><a href="http://idc.9he.com/link/index.shtml">专线直连</a></dd>
                        <dd><a href="${BasePath}/i9he/product/szServerhire.do">深圳服务器租用</a><span class="hot">hot</span></dd>
						<dd><a href="${BasePath}/i9he/product/hkServerhire.do">香港服务器租用</a></dd>
						<dd><a href="${BasePath}/i9he/product/twServerhire.do">台湾服务器租用</a></dd>
						<dd><a href="${BasePath}/i9he/product/usaServerhire.do">美国服务器租用</a></dd>
						<dd><a href="${BasePath}/i9he/product/sgServerhire.do">新加坡服务器租用</a></dd>
                        <dd><a href="${BasePath}/i9he/product/szTrustee.do">深圳服务器托管</a></dd>
						<dd><a href="${BasePath}/i9he/product/hkTrustee.do">香港服务器托管</a></dd>
						<dd><a href="${BasePath}/i9he/product/usaTrustee.do">美国服务器托管</a></dd>
						<dd><a href="${BasePath}/i9he/product/hkDefense.do" title="">香港高防</a></dd>
                      <!--  <dd><a href="">带宽资源租赁</a></dd>-->
                    </dl>
                     <dl class="libo_2">
                        <dt>云计算产品</dt>
                        <dd><a href="http://idc.9he.com/cloud/index.shtml">亚太云服务</a></dd>
                    </dl>
                     <dl class="libo_3">
                        <dt>安全与加速</dt>
                        <dd><a href="http://idc.9he.com/platform/ddos.shtml">分布式防御</a></dd>
                        <dd><a href="http://idc.9he.com/platform/cdn.shtml">CDN加速</a></dd>
                       
                    </dl>
                     <dl class="libo_4">
                        <dt><a href="http://idc.9he.com/datacenter/cluster.shtml">数据中心集群</a></dt>
                        <dd><a href="http://idc.9he.com/datacenter/hk.shtml">香港数据中心</a></dd>
                        <dd><a href="http://idc.9he.com/datacenter/usa.shtml">美国数据中心</a></dd>
                        <dd><a href="http://idc.9he.com/datacenter/sz.shtml">深圳数据中心</a></dd>
                        <dd><a href="http://idc.9he.com/datacenter/taiwan.shtml">台湾数据中心</a></dd>
                        <dd><a href="http://idc.9he.com/datacenter/singapore.shtml">新加坡数据中心</a></dd>
                        <dd><a href="http://idc.9he.com/datacenter/korea.shtml">韩国数据中心</a></dd>
                    </dl>
                     <dl class="libo_5">
                        <dt>数据中心建设</dt>
                        <dd><a href="http://idc.9he.com/idc/construction.shtml">数据中心建设标准</a></dd>
                        <!--<dd><a href="">网络技术全面支持</a></dd>-->
                       <!-- <dd><a href="">搭建优势（技术和服务）</a></dd>-->
                       <!-- <dd><a href="">设备采购方案</a></dd>-->
                    </dl>
                    
<!--                     <dl class="libo_jie">
                        <dt>产品公告&nbsp;&nbsp;&nbsp;<img src="http://idc.9he.com/images/1.gif" ></dt>
                        <dd>●&nbsp;<a href="http://idc.9he.com/cloud/index.shtml"> 九河互联亚太云正式开放使用</a></dd>
                        <dd>●&nbsp;<a href="http://idc.9he.com/platform/cdn.shtml"> 亚太CDN加速服务正式上线</a></dd>
                       
                        
                    </dl>-->
                    
  					<dl class="libo_jie">
                        <dt>明星产品&nbsp;&nbsp;&nbsp;</dt>
                        <dd><span class="red_1">●&nbsp;</span><a href="http://idc.9he.com/dedicated/hk_1.shtml"> E3香港服务器创业型</a></dd>
                        <dd><span class="red_1">●&nbsp;</span><a href="http://idc.9he.com/dedicated/sz_1.shtml">深圳服务器 E3先锋版</a></dd>
                        <dd><span class="red_1">●&nbsp;</span><a href="http://idc.9he.com/dedicated/usa_1.shtml" > E3美国服务器 极速1G大带宽之星</a></dd>
                        <dd><span class="red_1">●&nbsp;</span><a href="http://idc.9he.com/colocation/usa_2.shtml">加州  美国服务器托管</a></dd>
                        <dd><span class="red_1">●&nbsp;</span><a href="http://idc.9he.com/colocation/sz_2.shtml"> 深圳专注托管 安心托付</a></dd>
                         <dd><span class="red_1">●&nbsp;</span><a href="http://idc.9he.com/colocation/hk_2.shtml" >沙田  香港服务器托管</a></dd>
                    </dl>
                   
                </div>
            </li>      
              <li class="us2">解决方案
            	<div class="list_box5" style="width:150px">
                   <dl class="libo_1">
                   		<dt></dt>
                      	<dd style="margin-left:-60px"><a href="http://idc.9he.com/solutions/cdn.shtml">CDN分发加速</a></dd>
                        
                    </dl>
                    
                </div>
            </li>           
            
            <li class="nav_tai">平台与技术
            	<div class="list_box2" style="width:380px">
                 <dl class="libo_6">
                        <dt>平台</dt>
                        <dd><a href="http://idc.9he.com/platform/ibgp.shtml">iBGP网络平台</a></dd>
                        <dd><a href="http://idc.9he.com/platform/he.shtml">HE管理平台</a></dd>
                        
                    </dl>
                    <dl class="libo_7">
                        <dt>技术</dt>
                        <dd><a href="http://idc.9he.com/platform/self-healing.shtml">网络自愈技术</a></dd>
                        <dd><a href="http://idc.9he.com/platform/cdn.shtml">亚太CDN加速技术</a></dd>
                        <dd><a href="http://idc.9he.com/platform/ddos.shtml">分布式防御技术</a></dd>
                        <dd><a href="http://idc.9he.com/platform/backups.shtml">分布式灾备技术</a></dd>

                    </dl>
                </div>
            </li>
            <li><a href="http://idc.9he.com/market/index.shtml">运维增值市场</a></li>
            
            

            
            
            
            <li class="nav_fu">服务与合作
            	<div class="list_box3">
                   <dl class="libo_8">
                        <dt>服务支持</dt>
                        <dd><a href="http://idc.9he.com/service/customer.shtml">人工服务</a></dd>
                        <dd><a href="http://idc.9he.com/service/self.shtml">自助服务</a></dd>
                        <dd><a href="http://idc.9he.com/service/security.shtml">服务保障</a></dd>
                        <dd><a href="http://idc.9he.com/service/goods.shtml">产品帮助</a></dd>
                    </dl>
                    <dl class="libo_9">
                        <dt>技术合作</dt>
                        <dd><a href="http://idc.9he.com/about/contact-us.shtml">saas项目</a></dd>
                       <!-- <dd><a href="">系统集成项目</a></dd>-->
                     </dl>
                    <dl class="libo_10">
                        <dt>商务合作</dt>
                        <dd><a href="http://idc.9he.com/service/sources.shtml">渠道伙伴</a></dd>
                       <!-- <dd><a href="">推广返佣</a></dd>-->
                    </dl>
                </div>
            </li>
            <li class="us">关于我们
            	<div class="list_box4" style="width:150px">
                   <dl class="libo_1">
                   		<dt></dt>
                      	<dd style="margin-left:-60px"><a href="http://idc.9he.com/about/index.shtml">公司简介</a></dd>
                        <dd style="margin-left:-60px"><a href="http://idc.9he.com/about/contact-us.shtml">联系我们</a></dd>
                        <dd style="margin-left:-60px"><a href="http://idc.9he.com/about/payment.shtml">支付方式</a></dd>
                        <dd style="margin-left:-60px"><a href="http://idc.9he.com/about/join-us.shtml">人才招聘</a></dd>
                        <dd style="margin-left:-60px"><a href="http://idc.9he.com/about/partners.shtml">合作伙伴</a></dd>
                        
                    </dl>
                    
                </div>
            </li>
        </ul>
    </div>
</div>
<script>
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
	$(".us2").mouseenter(function(){
		$(".list_box5").show();
		}).mouseleave(function(){
			$(".list_box5").hide();
			})			
			
						
	$(".us").mouseenter(function(){
		$(".list_box4").show();
		}).mouseleave(function(){
			$(".list_box4").hide();
			})
</script>
