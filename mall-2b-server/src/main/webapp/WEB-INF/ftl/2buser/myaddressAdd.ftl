<#include "../layout.b2b.ftl">
<#assign active='u6'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/address/myaddress.do">收货地址</a></li>
</#macro>
<#macro script>
requirejs(['myaddress']);
</#macro>

<@layout>
<h2 class="bg-white">添加收货地址</h2>
<div class="bg-white other-body" style="min-height: 865px">
	<br/><br/>
	<form action="" class="form-horizontal" id="addAddress_from" method="post">
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">联系人：</label>
			<div class="col-md-3 control">
				<input class="form-control" name="consigneeName" id="consigneeName" required>
			</div>
		</div>
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">手机号码：</label>
			<div class="col-md-3 control">
				<input class="form-control mobile" name="mobile" id="mobile" required mobile>
			</div>
		</div>
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">收货地址：</label>
			<div class="col-md-8">
				<ul class="list-inline">
					<li>
						<select class="form-control" name="address1" id="address1" required data-required-message="请选择省份.">
							<option value="" >--加载中--</option>
						</select>
					</li>
					<li>
						<select class="form-control" name="address2"  id="address2" required data-required-message="请选择城市.">
							<option value="">--加载中--</option>
						</select>
					</li>
					<li>
						<select class="form-control" name="address3" id="address3" required data-required-message="请选择市区." >
							<option value="">--加载中--</option>
						</select>
					</li>
				</ul>
			</div>
		</div>
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">详细地址：</label>
			<div class="col-md-7 control">
				<input class="form-control" name="streetAddress" id="streetAddress" required data-required-message="请输入详细地址.">
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-md-5 col-md-offset-3">
					<button type="button" class="btn btn-primary" onclick="javascript:$('#addAddress_from').submit();">确认</button>
					<button type="reset" id="resetPassword" class="btn btn-primary">重 置</button>
					<button type="button" class="btn btn-primary" onclick="window.location.href='${BasePath}/address/myaddress.do'">返回</button>
				</div>
			</div>
		</div>
	</form>
</div> 	
	
<div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body" style="text-align: center;">
        	<h3 id="confirmContent"></h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div>
  </div>
</div>
</@layout>
