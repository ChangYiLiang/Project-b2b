<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
</#macro>

<#macro scripts>


</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>个人资料</strong>
	</div>
		<form action="editUser.do" id="userdata" class="form-horizontal"
			method="post">
			<input type="hidden" name="id" value=${user.id}>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">用户名 </label>
					<div class="controls">
						<p class="form-control-static" name="username">${(user.username)!""}</p>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">性别</label>
					<div class="controls">
						<p class="form-control-static" name="gender"><@com.gender
							user.gender/></p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">昵称</label>
					<div class="controls">
						<p class="form-control-static" name="firstName">${(user.nickName)!""}</p>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">邮箱</label>
					<div class="controls">
						<p class="form-control-static" style="position:relative; width:500px;"  name="email">${(user.email)!" "}
						<#if user.email ??>
							<#if user.isValidatedEmail==true >
								&nbsp;&nbsp;<span style="color: #ff0000">邮箱已验证.(可使用邮箱登录)</span>
							<#else>
								&nbsp;&nbsp;<span style="color: #ff0000">邮箱未进行验证。<a href="${BasePath}/controller/user/toverification.do">去验证</a> </span>
							</#if>
						</#if>
						</p>
					</div>
				</div>
			</div>
			<#--
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">用户类型</label>
					<div class="controls">
						<p class="form-control-static">${(user.type)?string("个人用户","企业用户")}</p>
						<input type="hidden" name="type" value="${user.type}"/>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">证件类型</label>
					<div class="controls">
						<p class="form-control-static">${(user.certificateType)?string("身份证","军官证")}</p>
						<input type="hidden" name="certificateType" value="${user.certificateType}"/>
					</div>
				</div>
			</div>
			-->
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">手机号码 </label>
					<div class="controls">
						<p class="form-control-static" name="mobile">${(user.mobile)!""}</p>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">语言</label>
					<div class="controls">
						<p class="form-control-static" name="locale">${(user.locale)!""}</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">QQ号码</label>
					<div class="controls">
						<p class="form-control-static" name="qq">${(user.qq)!""}</p>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">微信号码</label>
					<div class="controls">
						<p class="form-control-static" name="wechat">${(user.wechat)!""}</p>
					</div>
				</div>
			</div>
			<div class="row">
				
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">Facebook</label>
					<div class="controls">
						<p class="form-control-static" name="facebook">${(user.facebook)!""}</p>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">Google</label>
					<div class="controls">
						<p class="form-control-static" name="google">${(user.google)!""}</p>
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="form-group">
					<label class="control-label col-md-2"></label>
					<div class="col-md-4">
						<#--<input type="submit" value="保存" class="btn btn-primary btn-lg" />--> 
						<input type="submit" id="useredit" class="btn btn-primary" value="编辑" style="position:relative;left:-20px;" />
					</div>
				</div>
			</div>
		</form>


</@layout>