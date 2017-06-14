<#include "../layout.b2b.ftl">
<#assign active='u3'>

<#macro script>
requirejs(['user2b']);
</#macro>

<@layout>
<h2 class="bg-white">验证邮箱</h2>
<div class="bg-white other-body" style="min-height: 865px">
	<br/>
	<div class="text-center">
		<form action="" class="form-horizontal" id="validateEmail_from" method="post">
			<div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">您的邮箱:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="email" value="${user.email!''}" disabled="disabled">
				</div>
				<div class="col-md-1">
					<input type="hidden" id="email" name="email" value="${user.email!''}" /> 
					<input class="btn btn-primary" id="btnSendCode" type="button" value="发送验证码" onclick="MyApp.user.sendMessage()" />
				</div>
			</div>
			<br/>
			<#-- <div class="form-group">
				<label for="goodsName" class="col-md-2 col-md-offset-2 control-label">验证码:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="validcode" name="validcode" placeholder="输入验证码" required>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-md-5 col-md-offset-3">
						<button type="button" class="btn btn-primary" onclick="javascript:$('#validateEmail_from').submit();">验证</button>
						<button type="button" class="btn btn-primary" onclick="window.location.href='${BasePath}/controller/user/security.do'">返回</button>
					</div>
				</div>
			</div> -->
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
