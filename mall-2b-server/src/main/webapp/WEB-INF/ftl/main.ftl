<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>九河互联-有节操</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<link rel="stylesheet" href="${IncPath}/css/dell.css" type="text/css">
<link rel="stylesheet" href="${IncPath}/css/xin2.css" type="text/css">
<link rel="shortcut icon" href="favicon.ico"/>
<script src="${IncPath}/js/breathLoop.js"></script>
<!-- 在bootstrap.min.js 之前引入 -->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="${BasePath}/css/IE8.js"></script>
<![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!--[if IE 7]><body class="ie7 page-header-fixed"><![endif]-->
<!--[if IE 8]><body class="ie8 page-header-fixed"><![endif]-->
<!--[if IE 9]><body class="ie9 page-header-fixed"><![endif]-->
<!--[if !IE]>-->
<body class="page-header-fixed">
<!--<![endif]-->
<#include "header.ftl" >

<script type="text/javascript">
	  $(function(){
		var ulKey = 0;//ul的li的索引值
        var ulKey2 = 0;
		$('.next').click(function(e) {
			myFn();
        });
		
		//左按钮
		$('.prev').click(function(e) {		
			ulKey--;
			if(ulKey < 0){
				ulKey = 4;
				//到达极值之后 我们还需要让ul的从-1600开始移动，因为用户想从小蓝鸟移动的时候看到小黄鸟
				$('.ping_1').css('top','-1100px');
			}
			var move = ulKey * -220;
			$('.ping_1').stop().animate({'top':move + 'px'},500);
        });
		
		//定时器
		function myFn(){
            //1：ol的li变多 2：ul的li变位置
			
			ulKey++;
			if(ulKey > 4){
				ulKey = 0;//到达极值之后 相当于用户当前看到的是最后一张临时工，但是用户以为当前看到的是第一张图 所以极值的时候我们要把ulKey恢复到索引值为1的位置
				//如果不把当前的ul位置恢复到0点的话，用户看到的效果不是无缝滚动，如果想实现无缝滚动，我们就要把ul一瞬间恢复到0，然后再animate移动，这样才是用户想看到的无缝滚动效果
				$('.ping_1').css('top','0px');
			}
			var move = ulKey * -220;
			$('.ping_1').stop().animate({'top':move + 'px'},500);
		}
		
		var timer = null;
		timer = setInterval(function(){
			myFn();
		},2000);
		
		//开启定时 关闭定时器
		$('.H_tui_1').hover(function(e) {
			clearInterval(timer);
        },function(){
			timer = setInterval(function(){
				myFn();
			},2000);
		});
<!--		第二个-------------------------------------->
		$('.next2').click(function(e) {
			myFn2();
        });
		
		//左按钮
		$('.prev2').click(function(e) {		
			ulKey2--;
			if(ulKey2 < 0){
				ulKey2 = 2;
				//到达极值之后 我们还需要让ul的从-1600开始移动，因为用户想从小蓝鸟移动的时候看到小黄鸟
				$('.ping_2').css('top','-660px');
			}
			var move = ulKey2 * -220;
			$('.ping_2').stop().animate({'top':move + 'px'},500);
        });
		
		//定时器
		function myFn2(){
            //1：ol的li变多 2：ul的li变位置
			
			ulKey2++;
			if(ulKey2 > 2){
				ulKey2 = 0;//到达极值之后 相当于用户当前看到的是最后一张临时工，但是用户以为当前看到的是第一张图 所以极值的时候我们要把ulKey恢复到索引值为1的位置
				//如果不把当前的ul位置恢复到0点的话，用户看到的效果不是无缝滚动，如果想实现无缝滚动，我们就要把ul一瞬间恢复到0，然后再animate移动，这样才是用户想看到的无缝滚动效果
				$('.ping_2').css('top','0px');
			}
			var move = ulKey2 * -220;
			$('.ping_2').stop().animate({'top':move + 'px'},500);
		}
		
		var timer2 = null;
		timer2 = setInterval(function(){
			myFn2();
		},2000);
		
		//开启定时 关闭定时器
		$('.H_tui_2').hover(function(e) {
			clearInterval(timer2);
        },function(){
			timer2 = setInterval(function(){
				myFn2();
			},2000);
		});
        breathLoop(5000);
		});
</script>

</head>

<body>
    <div class="bannerLoop banner_h" >
            <ul>
                <li><a href="http://idc.9he.com/colocation/hk.shtml"><img src="${IncPath}/images/main/1920-550-1.png"  /></a></li>
                <li><a href="http://idc.9he.com/dedicated/sz.shtml"><img src="${IncPath}/images/main/1920-550-2.png"  /></a></li>
                <li><a href="http://idc.9he.com/dedicated/hk.shtml"><img src="${IncPath}/images/main/1920-550-3.png"  /></a></li>
            </ul>
            <ol>
                <li class="current"></li>
                <li></li>
                 <li></li>
            </ol>
            <a href="javascript:;" class="leftBtn"></a>
            <a href="javascript:;" class="rightBtn"></a>
    </div>
	<div class="L_box bac_f3">
    	<div class="M_box">
        	<div class="M_box_L">
            	<span class="M_boll_1"><a href="http://idc.9he.com/datacenter/hk.shtml">香港</a></span>
                <span class="M_boll_2"><a href="http://idc.9he.com/datacenter/sz.shtml">深圳</a></span>
                <span class="M_boll_3"><a href="http://idc.9he.com/datacenter/usa.shtml">美国</a></span>
                <span class="M_boll_4"><a href="http://idc.9he.com/datacenter/taiwan.shtml">台湾</a></span>
                <span class="M_boll_5"><a href="http://idc.9he.com/datacenter/singapore.shtml">新加坡</a></span>
            </div>
            <div class="M_box_R">
            	<ul class="M_box_R">
                	<li class="H_t">
                		<span class="tit_1 fon_36 hui_3">亚太数据中心集群</span>
                    	<span class="tit_2 fon_20 hui_6" >多地互联 内网互通 极速体验</span>
                    	<div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                		<span class="w_1">九河互联将亚太各地机房实现中国电信CN2专线连通，各节点之间的专线网络任意定制。不同于外网，亚太各地专线延迟控制在20ms以内，同等条件下网络传输效率堪称奢侈。绝佳的网络环境缔造极速稳定的iBGP网络，满足国内外各类应用平台复杂的访问需求。</span>
                 		<a href="http://idc.9he.com/platform/ibgp.shtml"><div>点我了解更多</div></a>
                	</li>
                    <li class="H_tui_1">
                    	<div class="title">
                            <span class="hd_t">今日明星产品推荐</span>
<!--                             <ol>
                                 <li class="current">1</li>
                                 <li>2</li>
                                 <li>3</li>
                                 <li>4</li>
                                 <li>5</li>
                              </ol>-->
                             <span class="next"></span>
                            <span class="prev"></span> 
                   		</div>
                        <div class="dingwei">
						<ul class="ping_1">
               					 <li>
                	                            <div class="tui_1">
                                                <div class="bd_im"><img src="${IncPath}/images/main/pic_1.png"></div>
                                                    <dl>
                                                        <dt><span class="fon_20 hui_6">香港服务器E3-1230 V3</span> </dt>
                                                        <dd>推荐理由：<br>
                                                            1，香港服务器租用首月半价钜惠！<br>
                                                            2，四线BGP极速优化！<br>
                                                            3，月销百台销量看得见！<br>
                                                            <span class="fon_24 red">999</span>元/月
                                                         </dd>
                                                         <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/hkServerhire.do')"></dd>
                                                    </dl>
                                       			 </div>
                				</li>
                				<li>
                	                            <div class="tui_1">
                                                        <div class="bd_im"><img src="${IncPath}/images/main/pic_1.png"></div>
                                                        <dl>
                                                            <dt><span class="fon_20 hui_6">美国服务器E3-1230 v2</span> </dt>
                                                            <dd>推荐理由：<br>
                                                                1，美国服务器极速1G大带宽！<br>
                                                                2，智能iBGP，CN2直连！<br>
                                                                3，年付送2个月！<br>
                                                                <span class="fon_24 red">1980</span>元/月
                                                             </dd>
                                                             <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/usaServerhire.do')"></dd>
                                                        </dl>
                           						 </div>
               					 </li>
                					<li>
                	                            <div class="tui_1">
                                    <div class="bd_im"><img src="${IncPath}/images/main/pic_1.png"></div>
                                    <dl>
                                        <dt><span class="fon_20 hui_6">深圳服务器E3-1230 v3</span> </dt>
                                        <dd>推荐理由：<br>
                                            1，深圳服务器租用采用品牌硬件！<br>
                                            2，智能BGP，5ms惊人网络质量！<br>
                                            3，20M独享冗余带宽，年付送2个月！<br>
                                            <span class="fon_24 red">6999</span>元/年
                                         </dd>
                                         <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/szServerhire.do')"></dd>
                                    </dl>
                            </div>
               						 </li>
                					<li>
                	                            <div class="tui_1">
                                    <div class="bd_im"><img src="${IncPath}/images/main/pic_1.png"></div>
                                    <dl>
                                        <dt><span class="fon_19 hui_6">新加坡服务器E3-1230 v3</span> </dt>
                                        <dd>推荐理由：<br>
                                            1，新加坡服务器租用明星性价比产品！<br>
                                            2，国际CN2直连，极速稳定！<br>
                                            3，可免费体验，年付送2个月！<br>
                                            <span class="fon_24 red">999</span>元/月
                                         </dd>
                                         <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/sgServerhire.do')"></dd>
                                         
                                    </dl>
                            </div>
                                     </li>
                               					 <li>
                	                            <div class="tui_1">
                                                <div class="bd_im"><img src="${IncPath}/images/main/pic_1.png"></div>
                                                    <dl>
                                                        <dt><span class="fon_18 hui_6">台湾服务器E3-1230 v3</span> </dt>
                                                        <dd>推荐理由：<br>
                                                            1，台湾服务器租用年付送2个月！<br>
                                                            2，国际CN2直连，极速稳定！<br>
                                                            3，高可用亚太专线内网服务！<br>
                                                            <span class="fon_24 red">999</span>元/月
                                                         </dd>
                                                         <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/twServerhire.do')"></dd>
                                                    </dl>
                                       			 </div>
                				</li>
                                
            </ul>
            </div>
                    </li>
                </ul>
            </div>
        </div>
         <div class="M_lian"><a href="http://idc.9he.com">【了解更多亚太精彩内容，请点击进入IDC频道！】</a></div>
    </div>
    
   <!-- 机房运维托管-->
    <div class="L_box ">
    	<div class="M_box ">
        
            <div class="M_box_R">
            	<ul class="M_box_R">
                	<li class="H_t">
                		<span class="tit_1 fon_36 hui_3">机房运维托管</span>
                    	<span class="tit_2 fon_20 hui_6" >企业级运维标准 垂直生态环境 有效削减用户成本</span>
                    	<div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                		<span class="w_1">亚太数据中心互联体系提供独特的专线直连服务，建立安全的内网传输环境，实现资源的合理分配，是高效能运维服务的保障。同时，用户选择购买服务器进行托管，只需选择三年托管期限，即可同步豁免服务器整机的硬件投入成本。九河互联垂直生态链给你带来前所未有的生态体验。</span>
                 		<a href="http://idc.9he.com/colocation/hk.shtml"><div>点我了解更多</div></a>
                	</li>
                    <li class="H_tui_2">
                    	<div class="title">
                            <span class="hd_t">今日明星产品推荐</span>
<!--                             <ol>
                                 <li class="Olcurrent">1</li>
                                 <li>2</li>
                                 <li>3</li>
                              
                              </ol>-->
                             <span class="next2"></span>
                            <span class="prev2"></span> 
                   		</div>
                        <div class="dingwei">
						<ul class=" ping_2">
               					 <li>
                	                            <div class="tui_2">
                                                <div class="bd_im2"><img src="${IncPath}/images/main/pic_1.png"></div>
                                                    <dl>
                                                        <dt><span class="fon_20 hui_6">1U香港服务器托管</span> </dt>
                                                        <dd>推荐理由：<br>
                                                            1，丰裕的香港网络及带宽资源！<br>
                                                            2，极速稳定的智能iBGP网络！<br>
                                                            3，完善可靠的分布式灾备体系！<br>
                                                            <span class="fon_24 red">6400</span>元/年
                                                         </dd>
                                                         <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/hkTrustee.do')"></dd>
                                                    </dl>
                                       			 </div>
                				</li>
                				<li>
                	                            <div class="tui_2">
                                                        <div class="bd_im2"><img src="${IncPath}/images/main/pic_1.png"></div>
                                                        <dl>
                                                            <dt><span class="fon_20 hui_6">1U深圳服务器托管</span> </dt>
                                                            <dd>推荐理由：<br>
                                                                1，电信、双线、多线BGP骨干网接入！<br>
                                                                2，采用全新高端品牌硬件！<br>
                                                                3，专注托管，优质售后服务体系！<br>
                                                                <span class="fon_24 red">6500</span>元/年
                                                             </dd>
                                                             <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/szTrustee.do')"></dd>
                                                        </dl>
                           						 </div>
               					 </li>
                					<li>
                	                            <div class="tui_2">
                                    <div class="bd_im2"><img src="${IncPath}/images/main/pic_1.png"></div>
                                    <dl>
                                        <dt><span class="fon_20 hui_6">1U美国服务器托管</span> </dt>
                                        <dd>推荐理由：<br>
                                            1，快+稳+安全，五一短板！<br>
                                            2，冗余网络带宽资源，灵活扩展！<br>
                                            3，硬件费用可全费！<br>
                                            <span class="fon_24 red">8000</span>元/年
                                         </dd>
                                         <dd> <input type="button" value="立即购买" onclick="window.open('${BasePath}/i9he/product/usaTrustee.do')"></dd>
                                    </dl>
                            </div>
               						 </li>
            </ul>
            </div>
                    </li>
                </ul>
            </div>
            	<div class="M_box_L_2"><img src="${IncPath}/images/main/im_2.png"></div>
        </div>
         <div class="M_lian"><a href="http://idc.9he.com">【了解更多亚太精彩内容，请点击进入IDC频道！】</a></div>
    </div>
    
<!--   美超微-->
	<div class="L_box bac_red2">
    	<div class="M_box">
        	<ul class="Mm_hold">
            	<li class="H_t">
                	<span class="tit_1 fon_36 hui_f">至强美超微服务器</span>
                    <span class="tit_2 fon_20 hui_f">快如风 稳如山 全亚太机房标配</span>
                    <div class="tit_xian"></div>
                </li>
                <li class="H_wen hui_f">
                	九河互联亚太机房采用全新美超微SuperMicr®服务器，英特尔四核至强E3处理器，8GB DDR3内存，全新SSD极速固态硬盘，拥有更强大的数据处理能力，全新保障，<br>
                    存储数据安全方面也将得到全面提升。<a href="${BasePath}/i9he/mall/sys.do" class="lian_1">美超微SuperMicr®企业采购直达通道>>></a>
                </li>
                 <li class="H_pai">
                	<span class="pai_1"></span>
                    <span class="pai_2"></span>
                    <a href="${BasePath}/i9he/mall/dell.do"><span class="pai_3"></span></a>
                    <a href="${BasePath}/i9he/mall/ibm.do"><span class="pai_4"></span></a>
                </li>
                <li class="H_lian"><a href="#">更多品牌服务器整机，点击这里！>>></a></li>
            </ul>
        </div>
    </div>
    
    <div class="L_box">
    	<div class="M_box">
        
            <div class="M_box_R">
            	<ul class="M_box_R">
                	<li class="H_t">
                		<span class="tit_1 fon_36 hui_3">亚太杀手锏</span>
                    	<span class="tit_2 fon_20 hui_6" >CN2专线互通互联 极速与安全双重保障</span>
                    	<div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                		<span class="w_1">亚太集群专线服务，除了提供高性价比的极速专线网络以外，安全的内网环境下数据传输将得到更安全的保障。同时由此而衍生的多节点分布式数据迁移、备份服务，为用户提供了更加完美的灾备解决方案，让用户体验真实的有别于公网的众多独特优势。</span>
                 		<a href="http://idc.9he.com/link/index.shtml"><div>专线定制咨询与选购</div></a>
                	</li>

                </ul>
            </div>
            	<div class="M_box_L_2"><img src="${IncPath}/images/main/im_4.png"></div>
        </div>
         <div class="M_lian"><a href="http://idc.9he.com">【了解更多亚太精彩内容，请点击进入IDC频道！】</a></div>
    </div>
         <div class="L_box  bac_f3">
    	<div class="M_box">
         <div class="M_box_L_2"><img src="${IncPath}/images/main/im_5.png"></div>
          <ul class="M_box_R">
            	<li class="H_t">
                	<span class="tit_1 fon_36 hui_3">华为交换机</span>
                    <span class="tit_2 fon_20 hui_3">明星系列产品 品质保证 用实力说话</span>
                    <div class="tit_xian"></div>
                </li>
                <li class="H_wen">
                	<span class="w_1">华为是全球领先的电信解决方案供应商之一。其中交换机已成为九河互联海内外机房标配网络设备，其稳定的产品性能、优秀的产品品质深受用户青睐。产品覆盖中小型企业和数据中心级市场，九河互联电商平台所售华为交换机均由华为原厂提供，确保渠道优先，正品保证。</span>
                    <a href="#"><div>华为交换机企业采购直达通道</div></a>
                </li>                
            </ul>
           
        </div>
        <div class="M_lian"><a href="#">【更多网络设备特供，点击这里！】</a></div>
    </div>
    
     <div class="L_box  bac_f">
    	<div class="M_box">
          <ul class="M_box_R">
            	<li class="H_t">
                	<span class="tit_1 fon_36 hui_3">分布式防御</span>
                    <span class="tit_2 fon_20 hui_3">负载均衡+企业级CDN加速技术+亚太分布式防御</span>
                    <div class="tit_xian"></div>
                </li>
                <li class="H_wen">
                	<span class="w_1">九河互联的软件定义网络将网络与物理服务器剥离，实现网络编程化，有效控制网络分配机制，保证网络的高利用率。同时利用CDN系统实时地根据网络流量和各节点的连接、负载状况以及到用户的距离和响应时间等综合信息将用户的请求重新导向离用户最近的服务节点上。<br>
在此基础上九河互联自主研发的创新型防御产品分布式集群防御发挥了巨大的优势。拥有亚太多个防御节点，通过独有的分布式检测技术实现多节点智能防御，能够最大程度上阻击DDoS、CC等网络攻击。</span>
                
                     <a href="http://idc.9he.com/platform/ddos.shtml"><div>分布式防御产品咨询与选购多</div></a>
                </li>                
            </ul>
            <div class="M_box_L_2"><img src="${IncPath}/images/main/im_6.png"></div>
        </div>
        
    </div>
    
     <div class="L_box  bac_f3">
    	<div class="M_box">
         <div class="M_box_L_2"><img src="${IncPath}/images/main/im_7.jpg"></div>
          <ul class="M_box_R">
            	<li class="H_t">
                	<span class="tit_1 fon_36 hui_3">专业跳线</span>
                    <span class="tit_2 fon_20 hui_3">专业，从一针一线开始做起</span>
                    <div class="tit_xian"></div>
                </li>
                <li class="H_wen">
                	<span class="w_1">数据中心机房的网络畅通可谓生死攸关的关键环节，而众多的机房在运维过程当中因使用不符合标准质量低下的网线而导致网络中断的情况时有发生。专业级的数据中心网络保障，应该从细节之处得以体现，哪怕是一根小小的网线。<br>
九河互联数据中心级六类跳线凭借优良的做工、超快的传输速度及出色的稳定性使其具备长期稳定的在机房使用，定位为数据中心级专业跳线，是数据中心IDC建设的首选产品。</span>
                 
                     <a href="#"><div>9HE数据中心级专业跳线选购</div></a>
                </li>                
            </ul>
           
        </div>
        <div class="M_lian"><a href="http://idc.9he.com">【了解更多亚太精彩内容，请点击进入IDC频道！】</a></div>
    </div>

<#include "footer.ftl">

</body>

</html>