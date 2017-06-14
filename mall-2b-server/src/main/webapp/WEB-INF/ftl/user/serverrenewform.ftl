

	<h4>订单信息</h4>
	<hr />
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订单编号 </label>
			<div class="controls">
				<p class="form-control-static">${(business.orderId)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">下单时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.stratDate?date)!'-'}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">开始时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.deliverDate?date)!}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">到期时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.endDate?date)!}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订购金额 </label>
			<div class="controls">
				<p class="form-control-static">${(business.orderAmount)!' '}</p>
			</div>
		</div>

		<div class="form-group col-md-5">
			<label class="control-label col-md-6">状态</label>
			<div class="controls">
				<p class="form-control-static"><@com.state business.state/></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">销售人员</label>
			<div class="controls">
				<p class="form-control-static">${(business.salesPersion)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">客服人员</label>
			<div class="controls">
				<p class="form-control-static">${(business.servicePersion)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">续费金额</label>
			<div class="controls">
				<p class="form-control-static">${(business.renewAmount)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订购周期</label>
			<div class="controls">
				<p class="form-control-static">${(orderCycle)!" "}</p>
				<p class="hidden">${(business.cycle)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6"></label>
			<div class="controls">
				<a href="../product/addRenew.do?id=${business.id}" class="btn btn-primary default btn-editable" style="position:relative;left:-20px;">
					</i>确认续费</a>
				<a href="${BasePath}/controller/busi/toMyBusiness.do" class="btn btn-primary">返回</a>
			</div>
			<div class="controls">
			<input type="hidden"  name="id" id="id" value="${business.id}"/>
			<button class="btn btn-primary"  style="position: relative;top:-34px;" onclick="javascript:User.addCart(${business.id});"> 加入购物车</button>
			</div>
		</div>
	</div>
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
				<p class="form-control-static">${(server.dataCenterId)!" "}</p>
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
				<p class="form-control-static">${(server.osId)!" "}</p>
			</div>
		</div>
	</div>



	