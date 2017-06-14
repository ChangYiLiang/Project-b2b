<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
	<style>
	.help-block{
		position: relative;
		left:90px;
	}
</style>
</#macro>

<#macro scripts>
	<script src="${BasePath}/scripts/custom/mydata.js"></script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>修改资料</strong>
	</div>
	<div class="widget-content">
							<!-- 编辑我的资料  -->
		<form action="" id="userform" class="form-horizontal" >
			<input type="hidden" name="id" value="${(user.id)!''}"/>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">用户名 </label>
					<div class="controls">
						<p class="form-control-static">${(user.username)!""}</p>
						<input type="hidden" name="username" value="${(user.username)!''}"/>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">性别</label>
					<div class="controls">
						<#if user.gender = 1>
							<label class="radio-inline">
								<input type="radio" name="gender"  value="1" checked="checked"/>男
							</label>
							<label class="radio-inline">
								<input type="radio" name="gender"  value="0"/>女
							</label>
						<#elseif user.gender = 0>	
							<label class="radio-inline">
								<input type="radio" name="gender" value="1" />男
							</label>
							<label class="radio-inline">
								<input type="radio" name="gender" value="0" checked="checked"/>女
								</label>
						</#if>
						<#if user.gender = 2>
							<label class="radio-inline">
								<input type="radio" name="gender" value="1" />男
							</label>
							<label class="radio-inline">
								<input type="radio" name="gender" value="0" />女
							</label>
						</#if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">昵称</label>
					<div class="controls">
						<input type="text" value="${(user.nickName)!''}" name="nickName" required data-required-message="输入昵称."/>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">邮箱</label>
					<div class="controls">
						<p class="form-control-static">${(user.email)!''}</p>
					</div>
				</div>
			</div>
			<#--
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">用户类型</label>
					<div class="controls">
						<p class="form-control-static">${(user.type)?string("个人用户","企业用户")!""}</p>
						<input type="hidden" name="type" value="${(user.type)?string('0','1')}"/>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">证件类型</label>
					<div class="controls">
						<p class="form-control-static">${(user.certificateType)?string("身份证","军官证")!""}</p>
						<input type="hidden" name="certificateType" value="${(user.certificateType)?string('0','1')}"/>
					</div>
				</div>
			</div>
			-->
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">手机号码 </label>
					<div class="controls">
						<input type="text" value="${(user.mobile)!''}" class="mobile" name="mobile" id="mobile" required data-required-message="输入手机号码."/>
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">语言</label>
					<div class="controls">
						<input type="text" value="${(user.locale)!''}" name="locale" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">QQ号码</label>
					<div class="controls">
						<input type="text" value="${(user.qq)!''}" name="qq" required data-required-message="输入QQ号码(5位以上)." data-number="true" data-minlength="5" data-minlength-message="输入至少5位QQ号码." />
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">微信号码</label>
					<div class="controls">
						<input type="text" value="${(user.wechat)!''}" name="wechat" />
					</div>
				</div>
			</div>
			<div class="row">
				
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">Facebook</label>
					<div class="controls">
						<input type="text" value="${(user.facebook)!''}" name="facebook" />
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">Google</label>
					<div class="controls">
						<input type="text" value="${(user.google)!''}" name="google" />
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">安全问题1</label>
					<div class="controls">
						<input type="text" value="${(user.scurityQusetion1)!''}"
							name="scurityQusetion1" />
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">安全问题1答案</label>
					<div class="controls">
						<input type="text" value="${(user.scurityAnswer1)!''}"
							name="scurityAnswer1" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">安全问题2</label>
					<div class="controls">
						<input type="text" value="${(user.scurityQusetion2)!''}"
							name="scurityQusetion2" />
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">安全问题2答案</label>
					<div class="controls">
						<input type="text" value="${(user.scurityAnswer2)!''}"
							name="scurityAnswer2" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">安全问题3</label>
					<div class="controls">
						<input type="text" value="${(user.scurityQusetion3)!''}"
							name="scurityQusetion3" />
					</div>
				</div>
				<div class="form-group col-md-5">
					<label class="control-label col-md-5">安全问题3答案</label>
					<div class="controls">
						<input type="text" value="${(user.scurityAnswer3)!''}"
							name="scurityAnswer3" />
					</div>
				</div>
			</div>


			<div class="row">
				<div class="form-group">
					<label class="control-label col-md-2"></label>
					<div class="col-md-4">
						<p id="submit" class="btn btn-primary"style="position:relative;left:-20px;" >保存</p>
						<a href="${BasePath}/controller/user/toMyData.do" class="btn btn-primary">返回</a>
					</div>
				</div>
			</div>
		</form>

		<!-- 编辑我的资料END  -->


	</div>

</@layout>