<!doctype html>
<html>
<head>
<meta charset="utf-8">
<#include "../keyword.ftl" >
<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
<link rel="stylesheet" href="${BasePath}/css/jr.css">
<link rel="stylesheet" href="${BasePath}/css/animate.min.css">
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/wow.min.js"></script>
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
    new WOW().init();
};
</script>


<style>
.jr_banner{
	height: 600px;
	background:url(${BasePath}/images/jr/jr_bannner.jpg) no-repeat center center;
}
.jr_jieshao .jr_tu1{
	height: 290px;
	background: url(${BasePath}/images/jr/jr_tu1.png) no-repeat center center;
}
.jr_sida li{
	width: 234px;
	height: 320px;
	border-radius: 5px;
	box-shadow: 2px 2px 2px #e5e5e5;
	background: url(${BasePath}/images/jr/jr_tu2.png) no-repeat center center;
	float:left;
	margin:70px 30px 0;
}
.jr_liucheng li{
	background: url(${BasePath}/images/jr/jr_tu3.png) no-repeat;
	text-align: center;
	width: 200px;
	padding:50px 0 50px 0;
	float:left;
	
}
.jr_shenqing{
	background:url(${BasePath}/images/jr/jr_bj.jpg) no-repeat center center;
}
</style>
</head>
<#include "../2bmain/header2b.ftl" >
	<!--#include file="../includes/head.html" -->
	<!--banner-->
		<div class="jr_banner"></div>
	<!--endbanner-->
	<!--介绍-->
		<div class="jr_jieshao">
			<div class="jr_center">
				<h2 class=" fadeInUp wow">什么是河马赊账</h2>
				<p class=" fadeInUp wow" data-wow-delay="0.5s">用户在九河网平台采购产品当遇资金不足时，可选择申请注册河马信赊，提交简单的主体信息，经快速审核后给予相应的授信额度，<br>用户即可在线赊购，先采购后还款，缓解资金压力，解决采购支付难题。</p>
				<div class="jr_tu1 fadeInUp wow" data-wow-delay="1s" ></div>
			</div>
			
		</div>
	<!--end介绍-->
	<!--四大优势-->
	<div class="jr_jieshao jr_color">
		<div class="jr_center">
			<h2 class=" fadeInUp wow">河马信赊四大优势</h2>
			<p class=" fadeInUp wow">
				<#if user??>
				<a href="${BasePath}/gssy/register.do">立即申请>>></a>
					<#else>
					<a href="${BasePath}/gssy/list.do">立即申请>>></a>
				</#if>
			</p>
			<ul class="jr_sida clearfix">
				<li class=" fadeInUp wow">
					<span class="jr_sp1">放款快</span>
					<span class="jr_sp2">无抵押，手续简单 <br>24小时完成授信额审批放款</span>
				</li>
				<li class=" fadeInUp wow" data-wow-delay="0.5s">
					<span class="jr_sp1">额度高</span>
					<span class="jr_sp2">大额交易无压力 <br>单笔最高授信额度50万</span>
				</li>
				<li class=" fadeInUp wow" data-wow-delay="1s">
					<span class="jr_sp1">利息低</span>
					<span class="jr_sp2">赊账利息低 <br>在线一键还款，轻松快捷</span>
				</li>
				<li class=" fadeInUp wow" data-wow-delay="1.5s">
					<span class="jr_sp1">可循环</span>
					<span class="jr_sp2">因为信用，所以简单 <br>按时还款，授信额度可循环使用</span>
				</li>												
			</ul>
		</div>
	</div>
	<!--end四大优势-->
	<!--流程-->
	<div class="jr_jieshao">
	  <div class="jr_center">
			<h2 class=" fadeInUp wow">河马信赊开通流程</h2>
			<p class=" fadeInUp wow">
				<#if user??>
				<a href="${BasePath}/gssy/register.do">立即申请>>></a>
					<#else>
					<a href="${BasePath}/gssy/list.do">立即申请>>></a>
				</#if>
			</p>
			<ul class="jr_liucheng clearfix">
				<li class="wow fadeInLeft">
					<h3>在线申请</h3>
					<p>主体信息，交易记录</p>
				</li>
				<li  class="wow fadeInLeft" data-wow-delay="0.5s">
					<h3>在线审批</h3>
					<p>24小时完成授信额审批</p>
				</li>
				<li class="wow fadeInLeft" data-wow-delay="1s">
					<h3>在线支付</h3>
					<p>最快1小时内完成审批及放款</p>
				</li>
				<li class="wow fadeInLeft" data-wow-delay="1.5s">
					<h3>还款</h3>
					<p>一键还款，方便快捷</p>
				</li>
				<li class="wow fadeInLeft" data-wow-delay="2s">
					<h3>循环使用</h3>
					<p>主体信息，交易记录</p>
				</li>																
			</ul>
			<div class="jr_zhuyi">
				<dl>
					<dt>注册须知</dt>
					<dd>
						*注册需要提交简单的企业资料，建议提前做好证件准备。
						<ul>
							<li>1.所需企业证件包括：营业执照、税务登记证、组织机构代码、开户银行许可证、法人身份证复印件</li>
							<li>
								2.注册时企业类型分为五证、三证、个体，选择的企业类型不同，需要以图片形式上传的资料也不同。
							</li>
						</ul>
						*需要以图片形式上传的资料：
						<ul>
							<li>1.五证企业：需上传五个证件及企业授权书的复印件并全要加盖公章</li>
							<li>
								2.三证企业：需上传营业执照（三证合一）、开户行许可证、法人身份证三个证件及企业授权书的复印件并加盖公章
							</li>
							<li>
								3.个体企业：需上传营业执照和法人身份证两个证件及企业授权书的复印件并加盖公章
							</li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>温馨提示</dt>
					<dd>授权书需要企业自行下载（ <a href="${BasePath}/images/jr/warrant.doc">授权书模版.doc</a> ）,信息填写完整后加盖公章，以图片形式上传。</dd>
					<dd>需上传的相关资料复印件，一定要加盖公章，不然将会影响企业的审核授信。</dd>
				</dl>
			</div>
		</div>
	</div>
	<!--end流程-->
	<!--申请条件-->
	<div class="jr_jieshao jr_shenqing">
		<div class="jr_center clearfix">
			<div class="jr_tit">申请条件</div>
			<div class="jr_con">
				<p>
					1、具备成熟业务的合法公司 <br>
					2、在金融机构无不良信用记录 <br>
					3、按平台要求提供相关材料 <br>
					4、在九河网平台注册会员，且在平台无不良信用记录；
				</p>
				<#if user??>
				    <button><a href="${BasePath}/gssy/register.do" style="color:White">立即申请</a></button>
					<#else>
					<button><a href="${BasePath}/gssy/list.do" style="color:White">立即申请</a></button>
				</#if>
			</div>
			
		</div>
	</div>
	<!--end申请条件-->
	<!--#include file="../includes/footer.html" -->
	<#include "../2bmain/footer2b.ftl" >
<body style="background-color:White">
</body>
</html>