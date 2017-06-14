<#include "../layout.b2b.ftl">
<#assign active='u3'>

<#macro script>
requirejs(['user2b','core'],function(user2b){
	user2b.initValidatePassword();
});

</#macro>

<@layout>

<h2 class="bg-white">修改登陆密码</h2>
<div class="bg-white other-body" style="min-height: 865px">
	<br/>
	<div class="text-center">
		<form action="" class="form-horizontal" id="modifyPassword_from" method="post">
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">原密码:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="oldpassword" id="oldpassword" required data-minlength="4" data-maxlength="16">
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">新密码:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="password" id="password" required data-minlength="6" data-maxlength="16">
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">重新输入新密码:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="confirmpassword" id="confirmpassword" required data-minlength="6" data-maxlength="16" data-equal-to="#password">
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-md-5 col-md-offset-3">
						<button type="button" class="btn btn-primary" onclick="javascript:$('#modifyPassword_from').submit();">修改</button>
						<button type="reset" id="resetPassword" class="btn btn-primary">重 置</button>
						<button type="button" class="btn btn-primary" onclick="window.location.href='${BasePath}/controller/user/security.do'">返回</button>
					</div>
				</div>
			</div>
		</form>	
	</div>
</div> 	
	
</div>
	<div class="clearfix"></div>
</div>
<#-- <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body" style="text-align: center;">
        	<h3>修改成功!</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div> -->
</@layout>
