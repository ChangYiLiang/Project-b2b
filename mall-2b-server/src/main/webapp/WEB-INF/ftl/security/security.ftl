<#include "../layout.b2b.ftl">
<#assign active='u3'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/user/security.do">安全设置</a></li>
</#macro>
<#macro script>
requirejs(['']);
</#macro>

<@layout>
<h2 class="bg-white">安全设置</h2>
<div class="bg-white other-body" style="min-height: 865px">
	<br/>
	<div class="row">
		<div class="col-md-12" style="padding: 20px 20px;">
			<div class="col-md-3">
				<img src="${BasePath}/images/2buser/u140true.png" >&nbsp&nbsp
				<span style="font-size: 18px">登陆密码</span>
			</div>
			
			<div class="col-md-6" style="margin-top: 10px">
				<span style="color: #F96">互联网账号存在被盗风险，建议您定期更改密码以保护账户安全。</span>
			</div>
			<div class="col-md-2 text-right" style="margin-top: 10px">
				<a href="${BasePath}/controller/user/cpassword.do">修改</a>
			</div>
		</div>
	</div>
	<#if user.email ??>
		<#if user.isValidatedEmail>
			<hr/>
			<div class="row">
				<div class="col-md-12" style="padding: 20px 20px;">
					<div class="col-md-3">
						<img src="${BasePath}/images/2buser/u140true.png" >&nbsp&nbsp
						<span style="font-size: 18px">邮箱验证</span>
					</div>
					
					<div class="col-md-6" style="margin-top: 10px">
						<span>您的邮箱已验证。</span>
					</div>
				</div>
			</div>
		<#else>
			<hr/>
			<div class="row">
				<div class="col-md-12" style="padding: 20px 20px;">
					<div class="col-md-3">
						<img src="${BasePath}/images/2buser/u230fail.png" >&nbsp&nbsp
						<span style="font-size: 18px">邮箱验证</span>
					</div>
					
					<div class="col-md-6" style="margin-top: 10px">
						<span>验证后，可用于快速找回登录密码，接收账户余额变动提醒。</span>
					</div>
					<div class="col-md-2 text-right" style="margin-top: 10px">
						<button class="btn btn-defoult" onclick="window.location.href='${BasePath}/controller/user/validateemail.do'">立即验证</button>
					</div>
				</div>
			</div>
		</#if>
	</#if>
	<#if user.mobile ??>
		<#if user.isValidatedMobile>
			<hr/>
			<div class="row">
				<div class="col-md-12" style="padding: 20px 20px;">
					<div class="col-md-3">
						<img src="${BasePath}/images/2buser/u140true.png" >&nbsp&nbsp
						<span style="font-size: 18px">手机验证</span>
					</div>
					
					<div class="col-md-6" style="margin-top: 10px">
						<span>您验证的手机: <#if user.mobile?length == 11>${user.mobile[0..2]}****${user.mobile[8..]}<#else>手机号码错误</#if> </span><span style="color: #F96">若已丢失或停用，请立即更换，避免账户被盗</span>
					</div>
					<div class="col-md-2 text-right" style="margin-top: 10px">
						<a href="#" onclick="alert('暂不支持修改已验证的手机号码'); return false;">修改</a>
					</div>
				</div>
			</div>
		<#else>
			<hr/>
			<div class="row">
				<div class="col-md-12" style="padding: 20px 20px;">
					<div class="col-md-3">
						<img src="${BasePath}/images/2buser/u230fail.png" >&nbsp&nbsp
						<span style="font-size: 18px">手机验证</span>
					</div>
					
					<div class="col-md-6" style="margin-top: 10px">
						<span>您验证的手机: <#if user.mobile?length == 11>${user.mobile[0..2]}****${user.mobile[8..]}<#else>手机号码错误</#if> </span><span style="color: #F96">若已丢失或停用，请立即更换，避免账户被盗</span>
					</div>
					<div class="col-md-2 text-right" style="margin-top: 10px">
						<button class="btn btn-defoult" onclick="window.location.href='${BasePath}/controller/user/validatemobile.do'">立即验证</button>
					</div>
				</div>
			</div>		
		</#if>
	</#if>
	<#if isPayPassword == 'false'>
	<hr/>
	<div class="row">
		<div class="col-md-12" style="padding: 20px 20px;">
			<div class="col-md-3">
				<img src="${BasePath}/images/2buser/u230fail.png" >&nbsp&nbsp
				<span style="font-size: 18px">支付密码</span>
			</div>
			
			<div class="col-md-6" style="margin-top: 10px">
				<span style="color: #F96">建议您定期更换新的支付密码，提高安全性。</span>
			</div>
			<div class="col-md-2 text-right" style="margin-top: 10px">
				<button class="btn btn-defoult" onclick="window.location.href='${BasePath}/controller/user/paypassword.do'">立即设置</button>
			</div>
		</div>
	</div>
	<#elseif isPayPassword == 'true'>
		<hr/>
		<div class="row">
		<div class="col-md-12" style="padding: 20px 20px;">
			<div class="col-md-3">
				<img src="${BasePath}/images/2buser/u140true.png" >&nbsp&nbsp
				<span style="font-size: 18px">支付密码</span>
			</div>
			<div class="col-md-6" style="margin-top: 10px">
				<span style="color: #F96">建议您定期更换新的支付密码，提高安全性。</span>
			</div>
			<div class="col-md-2 text-right" style="margin-top: 10px">
				<a href="${BasePath}/controller/user/editpaypassword.do">修改</a>
			</div>
		</div>
	</div>
	</#if>
	
	<#-- <hr/>
	<div class="row">
		<div class="col-md-12" style="padding: 20px 20px;">
			<div class="col-md-3">
				<img src="${BasePath}/images/2buser/u230fail.png" >&nbsp&nbsp
				<span style="font-size: 18px">实名认证</span>
			</div>
			
			<div class="col-md-2 text-right" style="margin-top: 10px">
				<a href="#">查看</a>
			</div>
		</div> 
	</div> -->
</div> 	
	
</div>
	<div class="clearfix"></div>
</div>

</@layout>
