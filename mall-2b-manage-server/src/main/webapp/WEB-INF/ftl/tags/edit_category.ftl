<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">修改标签分类</h4>
</div>

<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN FORM-->
			<form action="edit_category.do" id="form_cl" class="form-horizontal" method="POST">
				<input type="hidden" name="id" value="${category.id}" />
				<div class="form-body">
					<div class="form-group">
						<label for="name" class="col-md-4 control-label">标签/关键字名称</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="name" name="name" value="${category.name!''}" required />
						</div>
					</div>
					
					<div class="form-group">
						<label for="sortNo" class="col-md-4 control-label">序号</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="sortNo" name="sortNo" value="${category.sortNo!1}" 
								required 
								data-integer="true" data-integer-message="只能输入整数" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="remark" class="col-md-4 control-label">备注</label>
						<div class="col-md-7">
							<textarea name="remark" id="remark" class="form-control">${category.remark!''}</textarea>
						</div>
					</div>
					
				</div>
			</form>
			<!-- END FORM-->
		</div>
	</div>
</div>

<div class="modal-footer">
	<button type="button" class="btn default" data-dismiss="modal">关闭</button>
	<button id="saveButton" type="button" class="btn blue" onclick="javascript:$('#form_cl').submit();" data-loading-text="正在保存">保存</button>
</div>

<script>
	$(function(){
		var submitHandler = function() {
			var data = $("#form_cl").serializeObject();
			var bs = MyApp.namespace("bootstrap");
			var url = $("#form_cl").attr("action")
			bs.ajaxButton("#saveButton", url, data, function(data) {
				App.alert({message: "修改成功"});
				Cl.hideModalWindow(Cl.modalName);
				$("table").dataTable().fnDraw();
			}, {type: "JSON"});
		}
		$("#form_cl").i9heValidate({submitHandler: submitHandler});
	})
</script>