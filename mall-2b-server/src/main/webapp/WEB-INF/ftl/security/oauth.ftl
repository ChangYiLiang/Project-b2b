<#include "../layout.b2b.ftl">
<#assign active='u2'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/user/oauth.do">帐号绑定</a></li>
</#macro>

<@layout>
<h2 class="bg-white">帐号绑定</h2>
<div class="bg-white other-body">
	<br /><br /><br />
	<div class="col-md-4">
		<div class="col-md-6">
			<img src="${BasePath}/images/user/oauth_qq.png" alt="" />
		</div>
		<div class="col-md-6" style="line-height: 3em;">
			<h4>QQ</h4>
			<#if loginTypes.qqauth20??>
			<div>
				<img src="${BasePath}/images/user/oauth_1.png" alt="" /> 已绑定 <br />
				<button data-layer-open="#unbind_qqauth20" data-url="unbindoauth.do?type=qqauth20" class="btn btn-sm btn-jh-default">解除绑定</button>
			</div>
			<#else>
			<div>
				<img src="${BasePath}/images/user/oauth_0.png" alt="" /> 未绑定 <br />
				<a href="${casUrl}/login?service=${BasePath}/controller/user/qqCheck.do&type=qqauth20" class="btn btn-sm btn-jh-default">添加绑定</a>
			</div>
			</#if>
		</div>
	</div>
	<div class="col-md-4">
		<div class="col-md-6">
			<img src="${BasePath}/images/user/oauth_weixin.png" alt="" />
		</div>
		<div class="col-md-6" style="line-height: 3em;">
			<h4>微信</h4>
			<#if loginTypes.weixinauth20??>
			<div>
				<img src="${BasePath}/images/user/oauth_1.png" alt="" /> 已绑定 <br />
				<button data-layer-open="#unbind_weixin" data-url="unbindoauth.do?type=weixinauth20" class="btn btn-sm btn-jh-default">解除绑定</button>
			</div>
			<#else>
			<div>
				<img src="${BasePath}/images/user/oauth_0.png" alt="" /> 未绑定 <br />
				<a href="${casUrl}/login?service=${BasePath}/controller/user/oauth.do&type=weixinauth20" class="btn btn-sm btn-jh-default">添加绑定</a>
			</div>
			</#if>
		</div>
	</div>
	<div class="col-md-4">
		<div class="col-md-6">
			<img src="${BasePath}/images/user/oauth_weibo.png" alt="" />
		</div>
		<div class="col-md-6" style="line-height: 3em;">
			<h4>新浪微博</h4>
			<#if loginTypes.weiboauth20??>
			<div>
				<img src="${BasePath}/images/user/oauth_1.png" alt="" /> 已绑定 <br />
				<button data-layer-open="#unbind_sinaweibo" data-url="unbindoauth.do?type=weiboauth20" class="btn btn-sm btn-jh-default">解除绑定</button>
			</div>
			<#else>
			<div>
				<img src="${BasePath}/images/user/oauth_0.png" alt="" /> 未绑定 <br />
				<a href="${casUrl}/login?service=${BasePath}/controller/user/oauth.do&type=weiboauth20" class="btn btn-sm btn-jh-default">添加绑定</a>
			</div>
			</#if>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<script type="text/html" id="unbind_qqauth20" data-area="600px" data-title="解除QQ绑定" data-btn='["解除绑定","返回"]'>
	<br /><br />
	<img src="${BasePath}/images/user/oauth_qq.png" alt="" />
	<br /><br />
	<p>即将解除QQ帐号的绑定</p>
	<p>解绑后将无法继续使用此QQ快速登录九河网网站。</p>
</script>

<script type="text/html" id="unbind_weixin" data-area="600px" data-title="解除微信绑定" data-btn='["解除绑定","返回"]'>
	<br /><br />
	<img src="${BasePath}/images/user/oauth_weixin.png" alt="" />
	<br /><br />
	<p>即将解除微信帐号的绑定</p>
	<p>解绑后将无法继续使用此微信快速登录九河网网站。</p>
</script>

<script type="text/html" id="unbind_sinaweibo" data-area="600px" data-title="解除新浪微博绑定" data-btn='["解除绑定","返回"]'>
	<br /><br />
	<img src="${BasePath}/images/user/oauth_weibo.png" alt="" />
	<br /><br />
	<p>即将解除新浪微博帐号的绑定</p>
	<p>解绑后将无法继续使用此新浪微博快速登录九河网网站。</p>
</script>
</@layout>

<#macro script>
requirejs(['layerEx'], function() {
	$("[data-layer-open]").click(function() {
		var url = $(this).data("url");
		var $layer = $($(this).attr("data-layer-open"));
		$layer.open({yes: function() {
			$.post(url, function() {
				layer.closeAll();
				layer.alertEx({content: '第三方登录帐号已解除!', btn: "确定", end: function() {
					location.reload();
				}});
			});
		}});
	});
});
</#macro>