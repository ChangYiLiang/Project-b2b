<div id="requirementPanel">
	<p>请准确填写您的预约信息，我们将快速安排工程师上门服务。</p>
	<hr />
	<h4>上传文档</h4>
	<br />
	<div class="text-center">
		<iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
		<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
			<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
			<input type="file" name="file" id="uploadfile" multiple onchange="document.getElementById('uploadform').submit()" />
		</form>
		<button class="btn btn-primary btn-lg" onclick="document.getElementById('uploadfile').click()">
			<i class="glyphicon glyphicon-open"></i> &nbsp;&nbsp;&nbsp;上传我的文档
		</button>
		<br /><br />
		<p>你知道吗?按住CTRL键可多份文档同时上传哦!</p>
		<br />
		<p>文档支持类型: 
			<span class="ico ico-50 ico-docx" title="doc, docx"></span>
			<span class="ico ico-50 ico-pptx" title="ppt, pptx"></span>
			<span class="ico ico-50 ico-pdf" title="pdf"></span>
			<span class="ico ico-50 ico-xlsx" title="xls, xlsx"></span>
			<span class="ico ico-50 ico-txt" title="txt"></span>
		</p>
	</div>
	<p>温馨提示：</p>
	<p>1、您上传的文档内容劲量丰富，并留下您的联系方式（电话、QQ或邮箱），方便我们尽快与您取得联系，您的个人信息我们会严格保密。</p>
	<p>2、您的文档上传成功后，我们将会在一个工作日内联系您，请耐心等待。</p>
	<hr />
	
	<h4>在线提交需求</h4>
	<form method="post" action="${action!'requirement.do'}" class="form-horizontal" role="form" id="requirementForm">
  		<div class="form-group">
			<label for="title" class="col-sm-2 control-label">标题</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="title" name="requirement.title">
			</div>
		</div>
		
		<div class="form-group">
			<label for="" class="col-sm-2 control-label">需求类型</label>
			<div class="col-sm-9">
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-default active">
						<input type="radio" name="requirement.type" value="0" id="option1" autocomplete="off" checked> 询产品
					</label>
					<label class="btn btn-default">
						<input type="radio" name="requirement.type" value="1" id="option2" autocomplete="off"> 询方案
					</label>
					<label class="btn btn-default">
						<input type="radio" name="requirement.type" value="2" id="option3" autocomplete="off"> 其他
					</label>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<label for="goodsName" class="col-sm-2 control-label">采购产品名称</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="goods.goodsName" id="goodsName" placeholder="请输入采购产品名称" required>
			</div>
		</div>
		
		<div class="form-group">
			<label for="qty" class="col-sm-2 control-label">所需数量</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="goods.qty" id="qty" placeholder="请输入所需数量" 
					required data-digits="true" data-number-message="请输入正确的数量" data-min="1" data-min-message="请输入正确的数量">
			</div>
		</div>
		
		<div class="form-group">
			<label for="budget" class="col-sm-2 control-label">预算价格</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="goods.budget" id="budget" placeholder="请输入预算价格" 
					required data-number="true" data-number-message="请输入正确的价格">
			</div>
		</div>
		
		<div class="form-group">
			<label for="description" class="col-sm-2 control-label">补充说明</label>
			<div class="col-sm-9">
				<textarea name="requirement.description" id="description" rows="6" class="form-control"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="contact" class="col-sm-2 control-label">联系人</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="requirement.contact" id="contact" placeholder="请输入联系人" required>
			</div>
		</div>
		
		<div class="form-group">
			<label for="phone" class="col-sm-2 control-label">联系电话</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="requirement.phone" id="phone" placeholder="请输入联系电话" required>
			</div>
		</div>
		
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">邮箱</label>
			<div class="col-sm-5">
				<input type="email" class="form-control" name="requirement.email" id="email">
			</div>
		</div>
		
		<div class="form-group">
			<label for="qq" class="col-sm-2 control-label">QQ</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="requirement.qq" id="qq">
			</div>
		</div>
		
		<div class="form-group">
			<label for="weixin" class="col-sm-2 control-label">微信</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="requirement.weixin" id="weixin">
			</div>
		</div>
		
		<div class="form-group" id="filelist">
			
		</div>
		
		<div class="form-group">
			<div class="col-sm-2 col-sm-offset-2">
				<input type="submit" value="确认提交" class="btn btn-primary btn-block" id="submit" disabled />
			</div>
		</div>
	</form>
	<script> requirejs(['purchase', 'jquery'], function(purchase){ $("#submit").prop("disabled", false); purchase.initValidateForm()});</script>
	<script>
		window.fileupload_callback = window["fileupload_callback"] || function(data) {
			alert('您的文件已上传!')
			data = eval(data)
			for(var i=0; i<data.length; i++) {
				var file = data[i];
				$('<input type="hidden" name="file" />').val(file).appendTo("#filelist")
			}
		}
	</script>
</div>