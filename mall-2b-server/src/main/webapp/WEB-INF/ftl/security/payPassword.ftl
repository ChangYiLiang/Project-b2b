<#include "../layout.b2b.ftl">
<#assign active='u3'>

<#macro script>
requirejs(['user2b','jquery'],function(user2b){
	user2b.initValidatePayPassword();
});
</#macro>

<@layout>
<h2 class="bg-white">设置支付密码</h3>
<div class="bg-white other-body" style="min-height: 865px">
	<br/>
	<div class="text-center">
		<form action="" class="form-horizontal" id="payPassword_from" method="post">
		<input type="hidden" name="type" id="type" value="0">
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">请输入登录密码:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="password" id="password" required data-minlength="4" data-maxlength="16">
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">请输入支付密码:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="payPassword" id="payPassword" placeholder="支付密码为六位数字"  required data-number="true" data-minlength="6" data-maxlength="6" data-minlength-message="请输入6位支付密码">
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">请重新输入支付密码:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="confirmpayPassword" id="confirmpayPassword" required data-equal-to="#payPassword" data-number="true">
				</div>
			</div>
			<div class="row form-group">
				<span style="color: red" id="message"></span>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-md-5 col-md-offset-3">
						<button type="button" class="btn btn-primary" onclick="javascript:$('#payPassword_from').submit();">确认</button>
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
        	<h3 id="confirmContent"></h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div> -->

</@layout>
