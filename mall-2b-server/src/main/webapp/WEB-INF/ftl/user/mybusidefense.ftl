<#import '../component.ftl' as com>
	<h4>订单信息</h4>
	<hr />
	<@com.businessinfo business />

	<h4>业务信息</h4>
	<hr />
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">业务编号 </label>
			<div class="controls">
				<p class="form-control-static">${business.id}</p>
				<input type="hidden" name="business.id" value="${business.id}" />
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">业务类型 </label>
			<div class="controls">
				<p class="form-control-static"><@com.type business.type/></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">机房名称</label>
			<div class="controls">
				<p class="form-control-static">${(datacenter.name)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">防御峰值</label>
			<div class="controls">
				<p class="form-control-static">${(server.maxDefense)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">带宽 </label>
			<div class="controls">
				<p class="form-control-static">${(server.bandwidth)!" "} Mb</p>
				<input type="hidden" name="business.id" value="${business.id}" />
			</div>
							
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">操作系统</label>
			<div class="controls">
				<p class="form-control-static">${(os.name)!" "}</p>
			</div>
		</div>
	</div>
	<@com.serverinfo assServer />
	
	<#if business.state=1>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-2"></label>
			<div class="controls">
			<#if assServer ??>
			<#if assServer.kvmSupport == 1>
				<a target="_blank" class="btn btn-primary" href="${BasePath}/controller/busi/toServerKVM.do?busiId=${business.id}" >kvm控制</a>
			</#if>
			<#if assServer.ipmiSupport == 1>
				<button   class="btn btn-primary" onclick="javascript:User.on(${business.id})">开机</button>
				<button   class="btn btn-primary" onclick="javascript:User.off(${business.id})">关机</button>
				<button   class="btn btn-primary" onclick="javascript:User.reset(${business.id})">重启</button>
			</#if>
			</#if>
		<#-- <a target="_blank" href="../busi/upbandwidth.do?id=${business.id}" class="btn btn-primary">带宽变更</a> -->
			</div>
			
		</div>
	</div>
	</#if>
<form action="toMyBusiDetail.do" id="" class="form-horizontal" method="post">
	<hr />
	<div class="row">
		<div class="form-group">
			<label class="control-label col-md-2">客户备注</label>
			<input type="hidden" name="id" value="${business.id}" />
			<div class="col-md-8">
				<textarea class="form-control"
					name="remark">${business.clientRemark!""}</textarea>
			</div>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="form-group">
			<label class="control-label col-md-2"></label>
			<div class="col-md-4">
				<input type="submit" value="保存" class="btn btn-primary" />
				<a href="${BasePath}/controller/busi/toMyBusiness.do" class="btn btn-primary">返回</a>
			</div>
		</div>
	</div>
</form>

