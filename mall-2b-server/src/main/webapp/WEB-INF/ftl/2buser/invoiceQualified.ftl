<#include "../layout.b2b.ftl">
<#assign active='u5'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/user/invoicequalified.do">增票资质</a></li>
</#macro>
<#macro script>
requirejs(['user2b'],function(user2b){
	user2b.initValidateInvoice();
});
</#macro>

<@layout>
<h2 class="bg-white">增票资质</h2>

<div class="bg-warning other-body">
	<div class="from-control col-md-offset-1" style="padding: 20px">
		<p>我们会在一个工作日内完成审核工作。</p>
		<p>1）注意有效增值税发票开票资质仅为一个。</p>
		<p>2）发票常见问题查看增票资质帮助。</p>
	</div>
</div>

<div class="bg-white other-body" style="min-height: 600px">
	</br></br>
	<form action="" class="form-horizontal" id="invoice_from" method="post">
		<div class="from-group col-md-offset-2">
			<div class="from-group col-md-offset-1">
				<p>填写增票资质信息<span style="color: red">(所有信息均为必填)</span></p><br/>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">单位名称：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control"  name="organization" placeholder="请填写工商局注册的全称" required data-minlength="4" data-maxlength="40">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">纳税人识别码：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="userIdcode" placeholder="请填写数字" required data-minlength="15" data-maxlength="20">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">注册地址：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="registAddress" placeholder="请填写中文地址" required>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">注册电话：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="registPhone" placeholder="请填写注册电话号码" required number>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">开户银行：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="bank" placeholder="请填写开户银行" required>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">银行账户：</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="bankAccount" placeholder="请填写开户银行账户" required number>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="form-group">
					<div class="col-md-6 col-md-offset-2">
						&nbsp
						<button type="button" class="btn btn-primary" onclick="javascript:$('#invoice_from').submit();">提交</button>
						&nbsp&nbsp&nbsp&nbsp
						<button type="reset" id="reset" class="btn btn-primary">重 置</button>
					</div>
				</div>
			</div>
		</div>	
	</form>
</div>
<br/><br/> 
<div class="bg-white other-body" style="min-height: 250px">
	<br/>
	<h4>&nbsp&nbsp&nbsp增值税专票所需资质:</h4>
	<div class="col-md-7">
	<div class="col-md-offset-1">
		<p>1、营业执照副本；</p>
		<p>2、税务登记证（地址要与营业执照上一致；</p>
		<p>3、一般纳税人证明；</p>
		<p>4、开户许可证；</p>
		<p>5、开票资料（账号和开户银行需要与开户许可证上一致；</p>
		<p>以上五种资质扫描件，必须清晰，加盖公司公章。</p>
	</div>
	</div>
</div>	
	
</div>
	<div class="clearfix"></div>
</div>

<#---弹窗模板-->
<div class="modal fade" id="confirm">  
  <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-body"> 
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>   
      	<input id="tempData" type="hidden" value="">
        <h3 id="confirmContent"></h3>  
      </div>  
      <div class="modal-footer">  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <button id="onclickButton" onclick="" class="btn btn-primary" data-dismiss="modal">确定</button>  
      </div>  
    </div>
  </div>
</div> 
</@layout>
