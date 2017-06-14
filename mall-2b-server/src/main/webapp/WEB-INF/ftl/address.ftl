<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
		<h4 class="modal-title">添加收货地址+</h4>
      </div>  
      <div class="modal-body"> 
        <style>
        	.DD{width:405px}
        	.HH{width:150px;height:32px;position:relative;left:7px}
        	.JJ{left:30px}
        </style>
        <br/>
        <br/>	 
      	<form action="" class="form-horizontal" id="addAddress_from" method="post">
			<div class="row form-group">
				<label class="control-label col-md-2 col-md-offset-1">联系人：</label>
				<div class="col-md-3 control">
					<input class="DD form-control" name="consigneeName" id="consigneeName" required>
				</div>
			</div>
			<div class="row form-group">
				<label class="control-label col-md-2 col-md-offset-1">手机号码：</label>
				<div class="col-md-3 control">
					<input class="DD form-control mobile" name="mobile" id="mobile" required mobile>
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
					<input class="DD form-control" name="streetAddress" id="streetAddress" required data-required-message="请输入详细地址.">
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-md-5 col-md-offset-3">
						<button type="button" class="HH btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="HH JJ btn btn-primary" onclick="javascript:$('#addAddress_from').submit();">确认提交</button>
					</div>
				</div>
			</div>
	</form>
         <br/>
         <br/> 
      </div>  
    </div>
  </div>
</div>



