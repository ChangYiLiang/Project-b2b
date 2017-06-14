<#import '../component.ftl' as com>
<form action="toMyBusiDetail.do" id="" class="form-horizontal" method="post">
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
			<label class="control-label col-md-6">机房名称</label>
			<div class="controls">
				<p class="form-control-static">${(datacenter.name)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">类型 </label>
			<div class="controls">
				<p class="form-control-static"><@com.type business.type/></p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">托管规格</label>
			<div class="controls">
				<p class="form-control-static">${(trusteeship.trustSize)!" "}</p>
			</div>
		</div>
	</div>
		<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">带宽 </label>
			<div class="controls">
				<p class="form-control-static">${(trusteeship.bandwidth)!" "} Mb</p>
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
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">机柜功率</label>
			<div class="controls">
				<p class="form-control-static">${(trusteeship.power)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">线路</label>
			<div class="controls">
				<p class="form-control-static">${(trusteeship.line)!" "}</p>
			</div>
		</div>
	</div>
		<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">公网地址个数</label>
			<div class="controls">
				<p class="form-control-static">${(trusteeship.ipCount)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">主IP</label>
			<div class="controls">
				<p class="form-control-static">${(trusteeship.mainIp)!" "}</p>
			</div>
		</div>
	</div>

	<#if business.state=1 && (pduState??)>
	<div class="row">
		<div class="form-group col-md-10">
			<label class="control-label col-md-3">智能电源控制</label>
			<div class="controls">
				<button id="open" type="button" class="btn btn-danger" name="pdu" idvalue=${business.id}>OFF</button>
				<button id="close" type="button" data-confirm="是否执行关机操作?" class="btn btn-success" name="pdu" idvalue=${business.id}>O N</button>
				<button id="restart" type="button" data-confirm="是否执行重启操作?" class="btn btn-primary" name="pdu" idvalue=${business.id}>重启</button>
				<#if pduState == -1>
					<span>PDU不在线</span>
				</#if>
			</div>
		</div>
	</div>
	</#if>
	
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


<script>
	;(function(){
		var state = ${pduState!-1};
		if (state == -1) {
			$("button[span=pdu]").addClass("hidden");
		} else if (state == 0) {
			$("#close").addClass("hidden");
		} else if (state == 1) {
			$("#open").addClass("hidden");
		}
	})();
	
	$("button[name='pdu']").click(function(){
		var msg = $(this).data("confirm");
		if(msg && !confirm(msg)) {
			return;
		}
		var action=$(this).attr("id");
		$.ajax({  
	       url : "pdu.do",  
	       data: {"id":${business.id},"action":action},
	       type:'post',  
	       success : function(data) {
		        alert("操作成功");
		        if(action=="open" || action =="restart") {
		        	$("#open").addClass("hidden");
		        	$("#close").removeClass("hidden");
		        } else {
		        	$("#close").addClass("hidden");
		        	$("#open").removeClass("hidden");
		        }
	       }
		  }); 
	});
    			
</script>