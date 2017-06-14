<style>
	.modal {
		width: 850px;
	}
</style>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">企业详情</h4>
</div>
<#if authentication??>
<div class="modal-body" style="margin-left:50px;">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN FORM-->
			<form action="#" id="logistics_c1" class="form-horizontal" method="post">
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="currRate">企业全称</label>
					<div class="col-md-8">
						<input type="text" class="form-control"  value="${authentication.name ! ''}"/>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="varchar">营业执照代码</label>
					<div class="col-md-8">
						<input type="text" class="form-control"  value="${authentication.licenceNo ! ''}"/>
					</div>
				</div>
				<div class="clearfix"></div>
				
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="sendDate">身份证号码</label>
					<div class="col-md-8">
						<input type="text" class="form-control"  value="${authentication.idCard!""}"/>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="sendDate">身份证有效期</label>
					<div class="col-md-8">
						<input type="text" class="form-control"  value="${(authentication.exceed?string('yyyy-MM-dd'))!""}" />
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="signDate">填写人身份</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${authentication.authenticator!""}" />
					</div>
				</div>	
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="sendDate">联系电话</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${authentication.phone!""}" />
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="sendDate">身份证正面</label>
					<div class="col-md-8">
						<img style="width:100px;height:100px;border:1px solid DarkSlateGray" src="${authentication.cardPhoto1!""}"  />
					</div>
				</div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="signDate">身份证反面</label>
					<div class="col-md-8">
						<img style="width:100px;height:100px;border:1px solid DarkSlateGray" src="${authentication.cardPhoto2!""}" />
					</div>
				</div>	
				<div class="clearfix"></div>
				<div class="form-group col-md-6">
					<label class="control-label col-md-4" for="varchar">营业执照副本</label>
					<div class="col-md-8">
						<img style="width:100px;height:100px;border:1px solid DarkSlateGray" src="${authentication.licencePhoto}" >
					</div>
				</div>
				
				<div class="clearfix"></div>
				
				
					<div class="text-right">
					         <input type="hidden" id="state" value="${authentication.status}"/>
							 <input type="hidden" id="examineId1"  value="${authentication.id}">
							 <button id="examine11"  onclick="save(1)" class="btn btn-success" data-dismiss="modal">审核通过</button> 
					         <button id="examine22"  onclick="save(2)" class="btn btn-success" data-dismiss="modal">审核失败</button>  
					         <button type="button" class="btn btn-default" data-dismiss="modal">返回</button> 
				    </div>
			</form>
			<!-- END FORM-->
		</div>
	</div>
</div>
<#else>
<div class="modal-body">
<h4 class="modal-title">有没这个用户的信息</h4>
				<div class="clearfix"></div>
				<hr />
				<div class="text-right">
					<button type="button" class="btn blue" data-dismiss="modal">关闭</button>
					&nbsp;
				</div>
				
			<!-- END FORM-->
		</div>
	</div>
</div>

</#if>

<script>
$(function(){
		var state = $("#state").val();
		init(state);
		
})
function init(state){
		if(state!=0){
				$("#examine11").attr("disabled",true);
				$("#examine22").attr("disabled",true);
			}else{
				$("#examine11").attr("disabled",false);
				$("#examine22").attr("disabled",false);
			}
	}
	function save(state){
    var id = $("#examineId1").val();
 	$.post("save.do",{status:state,id:id},function(data){
 	if(data>0){
	 	 window.location.href="list.do"
	 	}else{
	 		alert("请求发生异常");
	 	}
 	},'json')
 }
</script>