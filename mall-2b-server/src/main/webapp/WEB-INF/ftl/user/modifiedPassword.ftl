<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${IncPath}/assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
<style>
	.modal {
		width: 500px;
	}
	.help-block{
		padding-left:125px
	}
</style>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">修改用户密码</h4>
</div>




<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN FORM-->
			<form action="#" method="post" id="cpassword_form" class="form-horizontal">
					<input type="hidden" name="id" id="id" value="${id}"/>
					<div class="form-group other-group" style="height:50px">
						<label class="control-label col-md-3">密码</label>
						<input style="width: 290px;"  class="form-control" type="password" required placeholder="输入新密码" name="password" id="password"  required data-required-message="请输入新密码." minlength="6" maxlength="16"/>
					</div>
					<div class="form-group other-group" style="height:50px">
						<label class="control-label col-md-3">再次</label>
						<input style="width: 290px;"  class="form-control" type="password" required placeholder="再次输入新密码" name="newpassword" id="newpassword"  required data-required-message="请再次输入新密码." equalTo="#password"  minlength="6" maxlength="16"/>
					</div>
			</form>
			<!-- END FORM-->
		</div>
	</div>
</div>

<div class="modal-footer">
	<button type="button" class="btn red" id="cpassword_button">确定</button>
	<button type="button" class="btn btn-default" data-dismiss="modal" id="resetbutton">关闭</button>
</div>

<script>
jQuery(document).ready(function() {       
	passwordForm.init();
});
</script>


