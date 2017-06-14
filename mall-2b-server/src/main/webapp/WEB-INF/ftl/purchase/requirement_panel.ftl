<div id="requirementPanel">

	<iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
	<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
		<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
		<input type="file" name="file" id="uploadfile" multiple onchange="document.getElementById('uploadform').submit()" />
	</form>
	<!--
	<p>请准确填写您的预约信息，我们将快速安排工程师上门服务。</p>
	-->
	<h4>在线提交需求</h4>
	<form method="post" action="${action!'requirement.do'}" class="form-horizontal" role="form" id="requirementForm">
		<input type="hidden" name="requirement.type" value="2" />
		<div class="form-group col-sm-6">
			<label for="contact" class="col-sm-4 control-label">您的称呼</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="requirement.contact" id="contact" placeholder="请输入联系人" required data-error-container="#none">
				<span class="help-inline">*</span>
			</div>
		</div>
		<div class="form-group col-sm-6">
			<label for="email" class="col-sm-4 control-label">联系邮箱</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="requirement.email" id="email" placeholder="请输入联系邮箱" required data-error-container="#none">
				<span class="help-inline">*</span>
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="company" class="col-sm-4 control-label">公司名称</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="requirement.company" id="company">
			</div>
		</div>
		
		<div class="form-group col-sm-6">
			<label for="phone" class="col-sm-4 control-label">联系电话</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="requirement.phone" id="phone" placeholder="请输入联系电话" required data-error-container="#none">
				<span class="help-inline">*</span>
			</div>
		</div>
		
		<div class="form-group">
			<label for="description" class="col-sm-2 control-label">需求描述</label>
			<div class="col-sm-9">
				<textarea name="requirement.description" id="description" rows="3" class="form-control"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="" class="col-sm-2 control-label">&nbsp;</label>
			<div class="col-sm-9">
				<input type="button" class="btn jh-button" onclick="document.getElementById('uploadfile').click()" value="添加附件" />
				<span class="help-inline">上传附件支持jpg、png、txt、doc、xls、pdf格式</span>
			</div>
		</div>
		
		<div class="col-sm-9 col-sm-offset-2 jh-fileinfo">
			<div class="jh-title">温馨提示: </div>
			<div>•您也可直接发送需求至邮箱：require@9he.com;</div>
			<div>•您上传的文档内容尽量丰富，上传成功后，我们将会在一个工作日内联系您，请耐心等待。</div>
		</div>
		
		
		<div class="form-group" id="filelist">
			
		</div>
		
		<div class="form-group">
			<div class="col-sm-2 col-sm-offset-2">
				<input type="submit" value="确认提交" class="btn btn-primary jh-button" id="submit" disabled />
			</div>
		</div>
	</form>
	<br /><br /><br />
	<script> requirejs(['purchase', 'jquery'], function(purchase){ $("#submit").prop("disabled", false); purchase.initValidateForm()});</script>
	<script>
		window.fileupload_callback = window["fileupload_callback"] || function(data) {
			layer.alertEx({content: "您的文件已上传!", time: 3000});
			data = eval(data)
			for(var i=0; i<data.length; i++) {
				var file = data[i];
				$('<input type="hidden" name="file" />').val(file).appendTo("#filelist")
			}
		}
	</script>
	<script type="text/html" id="requireAlert" data-icon="info">
		<div style="font-size: 20px;">* 号标记为必填内容</div>
		<br />
		<div style="font-size: 12px; color:#999">请填写必填内容再提交~</div>
	</script>
	<!-- 
		调用方式:   $("#requireAlert").alert()
	-->
</div>