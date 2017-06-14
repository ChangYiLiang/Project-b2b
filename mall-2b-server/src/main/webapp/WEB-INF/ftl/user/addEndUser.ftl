<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
</#macro>

<#macro scripts>
<script src="${BasePath}/scripts/custom/enduser.js"></script>
<script>
    	jQuery(document).ready(function() {       
    		FormCl.init();
    	});
</script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>添加终端用户</strong>
	</div>
			<div class="tab-pane" id="2">
				<form action="#" id="form_cl" name="form_cl">
				<div class="form-group other-group" style="height:50px">
					<input style="width: 290px;"  class="form-control" type="text" required placeholder="输入用户名" name="username" id="username"  />
				</div>
				<div class="form-group other-group" style="height:50px">
					<input  style="width: 290px;"  class="form-control" type="password" required placeholder="输入密码" id="password" name="password" />	
				</div>
				<div class="form-group other-group" style="height:50px">
					<input  style="width: 290px;"  class="form-control" type="password" required placeholder="确认密码" name="rpassword" id="rpassword"  />	
				</div>
				<div class="form-group other-group" style="height:50px">
					<input style="width: 290px;" class="form-control" type="text" placeholder="输入邮箱" required name="email" id="email" />
				</div>
				<div class="form-group other-group" style="height:30px">
					<input style="width: 150px;" class="form-control" type="text" placeholder="输入验证码" required name="validcode" id="validcode" />
				</div>
				<div style="position: relative;top:-13px;left: -20px;">
						<img src="${BasePath}/i9he/validcode.do" alt="" onclick="this.src='${BasePath}/i9he/validcode.do?_t=' + Math.random()" style="height:34px;position:relative; left: 200px;top:-32px;" />
				</div>
				<div class="form-group other-group" style="height:45px">
					<input type="submit" class="btn btn-primary" value="添加用户" name="Submit" />
<!-- 					<input id="reset" type="reset" value="重 置" style="display:none"/>  -->
				</div>
				</form>
			</div>	
	
</@layout>