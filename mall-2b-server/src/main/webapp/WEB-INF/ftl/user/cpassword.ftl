<#include '../layout.ftl'>
<#macro myheader>
	<style>
	.help-block{color: #ff0000;} 
	</style>
</#macro>

<#macro scripts>
	<script>
    	jQuery(document).ready(function() {       
       		Cl.initModifyPassword();
    	});
	</script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>修改密码</strong>
	</div>
			<div class="tab-pane" id="2">
				<form id="form_cl_mp" class="form-horizontal" autocomplete="off">
					<fieldset>
						<div class="control-group">
							<label class="control-label" for="accountusername">旧密码</label>
							<div class="controls">
								<input type="password" id="oldpassword" name="oldpassword" class="input-large"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="accountusername">新密码</label>
							<div class="controls">
								<input type="password" name="password" id="password" class="input-large"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"  for="accountusername">确认密码</label>
							<div class="controls">
								<input type="password" name="confirmpassword" id="confirmpassword" class="input-large"/>
							</div>
						</div>
						<br/>
						<div class="control-group">
							<div class="controls">
								<button type="button" class="btn btn-primary" onclick="javascript:$('#form_cl_mp').submit();">修改</button>
								<input id="reset" type="reset" value="重 置" style="display:none"/> 
							</div>
						</div>
					</fieldset>
				</form>
			</div>	
</@layout>