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
<h2 class="bg-white">修改收货地址</h2>
<div class="bg-white other-body" style="min-height: 865px">
	<br/><br/>
	<form action="" class="form-horizontal" id="editAddress_from" method="post">
		<input type="hidden" id="id" name="id" value="${address.id!''}" />
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">联系人：</label>
			<div class="col-md-3 control">
				<input class="form-control" id="consigneeName" name="consigneeName" value="${address.consigneeName!''}" required>
			</div>
		</div>
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">手机号码：</label>
			<div class="col-md-3 control">
				<input class="form-control mobile" id="mobile" name="mobile" value="${address.mobile!''}" required mobile>
			</div>
		</div>
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">收货地址：</label>
			<div class="col-md-8">
				<input id="editaddressOption1" type="hidden" value="${addressModel.province!''}" />
				<input id="editaddressOption2" type="hidden" value="${addressModel.city!''}" />
				<input id="editaddressOption3" type="hidden" value="${addressModel.county!''}" />
				<ul class="list-inline">
					<li>
						<select class="form-control" name="editaddress1" id="editaddress1" required data-required-message="请选择省份.">
							<option value="" >--请选择--</option>
						</select>
					</li>
					<li>
						<select class="form-control" name="editaddress2"  id="editaddress2" required data-required-message="请选择城市.">
							<option value="" >--请选择--</option>
						</select>
					</li>
					<li>
						<select class="form-control" name="editaddress3" id="editaddress3" required data-required-message="请选择市区." >
							<option value="" >--请选择--</option>
						</select>
					</li>
				</ul>
			</div>
		</div>
		<div class="row form-group">
			<label class="control-label col-md-2 col-md-offset-1">详细地址：</label>
			<div class="col-md-7 control">
				<input class="form-control" id="streetAddress" name="streetAddress" value="${address.streetAddress!''}" required data-required-message="请输入详细地址.">
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-md-5 col-md-offset-3">
					<button type="button" class="btn btn-primary" onclick="javascript:$('#editAddress_from').submit();">确认</button>
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
