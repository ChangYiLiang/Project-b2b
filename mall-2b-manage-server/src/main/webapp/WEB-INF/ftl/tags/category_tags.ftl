
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">标签分类详情</h4>
</div>

<div class="modal-body">
	<div id="alert-info"></div>
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN FORM-->
			<form action="save_category_tags.do" id="form_cl" class="form-horizontal" method="POST">
				<input type="hidden" name="categoryId" value="${category.id}" />
				
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				  <li role="presentation" class="active"><a href="#tags" role="tab" data-toggle="tab">Tags</a></li>
				  <li role="presentation"><a href="#keyword" role="tab" data-toggle="tab">关键字</a></li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content">
				  	<div role="tabpanel" class="tab-pane active" id="tags">
						<#list allTags as tag>
							<#if tag.type==0>
							<div class="checkbox col-md-3 col-lg-2">
							    <label>
							    	
							    	<input ${tags?seq_contains(tag.id)?string('checked','')} type="checkbox" value="${tag.id}" name="tagId"> ${tag.name!''}
							    </label>
						  	</div>
						  	</#if>
						</#list>
					</div>
				  	<div role="tabpanel" class="tab-pane" id="keyword">
				  		<#list allTags as tag>
							<#if tag.type==1>
							<div class="checkbox col-md-3 col-lg-2">
							    <label>
							    	<input ${tags?seq_contains(tag.id)?string('checked','')} type="checkbox" value="${tag.id}" name="tagId"> ${tag.name!''}
							    </label>
						  	</div>
						  	</#if>
						</#list>
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

<style>

.modal {
	width: 800px;
}

.modal-body {
	min-height: 350px;
}
@media (min-width: 1360px) {
	.modal {
		width: 1000px;
	}
}
</style>
<script>
	$(function(){
		
		var submitHandler = function() {
			var data = $("#form_cl").serialize();
			var bs = MyApp.namespace("bootstrap");
			var url = $("#form_cl").attr("action")
			bs.ajaxButton("#saveButton", url, data, function(data) {
				App.alert({message: "修改成功", container: "#alert-info"});
				
			}, {type: "JSON"});
		}
		$("#form_cl").i9heValidate({submitHandler: submitHandler});
	})
</script>