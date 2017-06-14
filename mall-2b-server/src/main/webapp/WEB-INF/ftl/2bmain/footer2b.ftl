<@include path="/widget/website/page-footer.do" />

<div class="jh-global-tips">
	<ul>
		<li>
			<a href="javascript:;" id="globalService"><img src="${BasePath}/images/service/kefu_btn.jpg" alt="" /></a>
			<div class="jh-tips jh-tips-text">
				在线客服咨询
			</div>
		</li>
		<li>
			<a href="javascript:;"><img src="${BasePath}/images/service/erweima_btn.jpg" alt="" /></a>
			<div class="jh-tips jh-tips-qrcode">
				<img src="${BasePath}/images/service/weixin_qrcode.png" alt="" />
			</div>
		</li>
		<li>
			<a href="javascript:;" id="globalOffer"><img src="${BasePath}/images/service/xuqiu_btn.jpg" alt="" /></a>
			<div class="jh-tips jh-tips-text">
				需求采购在线提交
			</div>
		</li>
		<li>
			<a href="javascript:;" id="gotop"><img src="${BasePath}/images/service/gotop_btn.jpg" alt="" /></a>
			<div class="jh-tips jh-tips-text">
				返回顶部
			</div>
		</li>
	</ul>
</div>
<script>
(function() {
	function openOfferDialog() {
		layer.open({
			type: 2,
			area: ["950px", "600px"],
			title: "在线提交需求",
	        shadeClose: true, 
	        resize: false,
			content: ["${BasePath}/purchase/offermodal.do", "no"]
		});
	}
	function initTips() {
		
	}
	
	function init() {
		initTips();
		$("#globalOffer").click(function(){
			openOfferDialog();
		});
		$("#globalService").click(function() {
			ysf.open();
		});
		$("#gotop").click(function() {
			$('html,body').animate({'scrollTop':0},500);
		});
	}
	if (window.require) {
		require(["layerEx"], function() {
			init();
		});
	} else {
		init();
	}
})();
</script>
<style type="text/css">
#YSF-BTN-HOLDER{display:none !important;}
.jh-global-tips {position:fixed; right: 0px; top: 50%; margin-top:-90px;}
.jh-global-tips li {position: relative; margin-bottom: 3px;}
.jh-tips {position: absolute; right: 60px; width: 165px;text-align: center; top: 0; line-height: 60px; display:none}
.jh-global-tips li:hover .jh-tips {display:block;}
.jh-tips-text {background-image:url("${BasePath}/images/service/kuang_1.png"); background-repeat:no-repeat; background-position: 100% 50%}
.jh-tips-qrcode {top: -52px;}
</style>
<!--
<script src="https://qiyukf.com/script/a2e861262a44337dc9b7529542c4e651.js" defer async></script>
-->
<script type="text/javascript">
	var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?4526c299966ebdd2f38c184c72ba097e";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<script>
(function () {
	var ysf = window.ysf = {};
	ysf.open = function () {
		$("[data-type=iconInvite]").click()
	}
	function initKF() {
		$(".fot_a").click(function(){
			$("#globalService").click();
		});
	}
	if(window.jQuery) {
		$(initKF);
	} else if (window.requirejs) {
		requirejs(['jquery'], initKF);
	}
})();
</script>
<script type="text/html" id="setLoginUserTemplate">
<span><a style="text-decoration:none" href="${BasePath}/controller/toUserCenter.do" target="_self">{username}，欢迎来到九河网&nbsp;&nbsp; </a></span>
<span><a style="text-decoration:none" href="${BasePath}/controller/logout.do" target="_self">退出</a></span>	
</script>
<script>
	function setLoginUser(user) {
		var html = $("#setLoginUserTemplate").html();
		html = html.replace("{username}", user.username);
		$(".nav_ti>.nav_center.nav_center3>.nav_left").html(html);
	}
</script>
<#if !user??>
<iframe src="${BasePath}/casLoginCheck.do" frameborder="0" style="display: none"></iframe>
</#if>

 