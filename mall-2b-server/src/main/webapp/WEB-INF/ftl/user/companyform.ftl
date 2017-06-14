<#import '../component.ftl' as com>

<form action="" id="userdata" class="form-horizontal" method="post">
	<h4>我的资料</h4>
	<hr />
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label">用户名 </label>
			<div class="controls">
				<p class="form-control-static">${(user.username)!" "}</p>
			</div>
		</div>
		<div class="span6">
			<label class="control-label">性别</label>
			<div class="controls">
				<p class="form-control-static" name="user.gender"><@com.gender user.gender/></p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">真实姓名</label>
			<div class="controls">
				<p class="form-control-static" name="user.firstName">${(user.firstName)!" "}**</p>
			</div>
		</div>
		<div class="span6">
			<label class="control-label col-md-4">用户类型</label>
			<div class="controls">
				<p class="form-control-static">${(user.category)?string("电商客户", "第三方客户")}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">证件类型</label>
			<div class="controls">
				<p class="form-control-static">${(user.certificateType)?string("身份证", "军官证")}</p>
			</div>
		</div>
		<div class="span6">
			<label class="control-label col-md-4">证件号码</label>
			<div class="controls">
				<p class="form-control-static">${(user.certificateNo)!""}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">手机号码 </label>
			<div class="controls">
				<p class="form-control-static">${(user.mobile)!" "}</p>
			</div>
		</div>

		<div class="span6">
			<label class="control-label col-md-4">QQ号码</label>
			<div class="controls">
				<p class="form-control-static">${(user.qq)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">微信号码</label>
			<div class="controls">
				<p class="form-control-static">${(user.wechat)!" "}</p>
			</div>
		</div>
		<div class="span6">
			<label class="control-label col-md-4">Facebook</label>
			<div class="controls">
				<p class="form-control-static">${(user.facebook)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">Google</label>
			<div class="controls">
				<p class="form-control-static">${(user.google)!" "}</p>
			</div>
		</div>
		<div class="span6">
			<label class="control-label col-md-4">邮箱</label>
			<div class="controls">
				<p class="form-control-static">${(user.email)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">语言</label>
			<div class="controls">
				<p class="form-control-static">${(user.locale)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">安全问题1</label>
			<div class="controls">
				<p class="form-control-static">${(user.Scurity_qusetion1)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">安全问题1答案</label>
			<div class="controls">
				<p class="form-control-static">${(user.Scurity_answer1)!" "}</p>
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">安全问题2</label>
			<div class="controls">
				<p class="form-control-static">${(user.Scurity_qusetion2)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">安全问题2答案</label>
			<div class="controls">
				<p class="form-control-static">${(user.Scurity_answer2)!" "}</p>
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">安全问题3</label>
			<div class="controls">
				<p class="form-control-static">${(user.Scurity_qusetion3)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<label class="control-label col-md-4">安全问题3答案</label>
			<div class="controls">
				<p class="form-control-static">${(user.Scurity_answer3)!" "}</p>
			</div>
		</div>
	</div>
	
	
	<div class="row-fluid">
		<div class="form-group">
			<label class="control-label col-md-2"></label>
			<div class="col-md-4">
				<#--<input type="submit" value="保存" class="btn btn-primary btn-lg" />-->
				<a href="javascript:history.go(-1)" class="btn btn-primary">修改</a> 
			</div>
		</div>
	</div>
</form>

