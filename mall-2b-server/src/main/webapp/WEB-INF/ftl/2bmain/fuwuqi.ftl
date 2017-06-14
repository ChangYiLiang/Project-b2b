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

<#include "fuwuqiCha.ftl" >

<#include "header2b.ftl" >
<div class="r230_dinggou" style="width:100%">
		<div style="width:1200px;margin:0px auto;">
        <div class="dinggou_tit" style="height:0px">当前位置><a href="#" target="_blank">${parName!""}></a><a href="#" target="_blank">${catname}></a><a href="javascript:;" class="R20">${goods.goodsName}</a></div>
        <#if goods.ifonly=1>
        	<#include "fuwuqiOne.ftl">   
        <#elseif goods.ifonly=2>
            <#include "fuwuqiTwo.ftl">
        <#elseif goods.ifonly=3>
        	<#include "fuwuqiThree.ftl">
        <#else>
        	<#include "fuwuqiFour.ftl">	
        </#if>    
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
                    <dd><a href="${BasePath}/mall/${gtt.id}.html" class="lijigoum">立即购买</a></dd>
                </dl>
                </#list> 
            </div>
            <div class="rexiao_r">
                <dl>
                    <dt>活动促销</dt>
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
