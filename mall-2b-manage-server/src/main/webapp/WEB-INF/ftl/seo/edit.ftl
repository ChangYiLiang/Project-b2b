<style>
.modal {width: 800px}
</style>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">新增SEO优化</h4>
</div>

<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN FORM-->
			<form action="edit.do" id="form_cl" class="form-horizontal" method="POST">
				<input type="hidden" name="id" value="${seo.id!''}" />
				<div class="form-body">
					<div class="form-group">
						<label for="name" class="col-md-2 control-label">URL路径</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="url" name="url" value="${seo.url!''}" required />
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2 control-label">名称</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="name" name="name" value="${seo.name!''}" required />
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-2 control-label">分类</label>
						<div class="col-md-9">
							<div class="form-control-static">
								<label>
									<input type="radio" name="category" value="url" ${(seo.category=="url")?string('checked', '')} />
									URL
								</label>
								&nbsp;
								<label>
									<input type="radio" name="category" value="product" ${(seo.category=="route")?string('checked', '')} />
									路由规则
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="remark" class="col-md-2 control-label">标题</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="title" name="title" value="${seo.title!''}" required />
						</div>
					</div>
					
					<div class="form-group">
						<label for="remark" class="col-md-2 control-label">关键字</label>
						<div class="col-md-9">
							<textarea name="keyword" id="keyword" class="form-control" rows="4">${seo.keyword!''}</textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label for="remark" class="col-md-2 control-label">描述</label>
						<div class="col-md-9">
							<textarea name="description" id="description" class="form-control" rows="4">${seo.description!''}</textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">说明</label>
						<div class="col-md-9 form-control-static">
							<p><strong>{title}</strong> 系统默认标题</p>
							<p><strong>{keyword}</strong> 系统默认关键字</p>
							<p><strong>{description}</strong> 系统默认描述</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">示例</label>
						<div class="col-md-9 form-control-static">
							<p class="text-info">{title} - x3550 M5 5463i01</p>
							<p>将生成</p>
							<p class="text-info">九河网_数据中心全产业链电商平台 - x3550 M5 5463i01</p>
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
			});
		}
		$("#form_cl").i9heValidate({submitHandler: submitHandler});
	})
</script>