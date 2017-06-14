<#include "../layout.ftl">

<#macro scripts>
<script>
	function getInvoice(data){
		$.ajax({url:"getinvoice.do",data:{id:data},type:"POST",dataType:"JSON",
			success:function(data){
				$("#invoiceId").val(data.invoiceQua.id);
				$("#organization").html(data.invoiceQua.organization);
				$("#userIdcode").html(data.invoiceQua.userIdcode);
				$("#registAddress").html(data.invoiceQua.registAddress);
				$("#registPhone").html(data.invoiceQua.registPhone);
				$("#bank").html(data.invoiceQua.bank);
				$("#bankAccount").html(data.invoiceQua.bankAccount);
				$("#invoicedialog").modal();
				if(data.invoiceQua.isReview){
					$("#pass,#fail").hide();
				}
			}
		});
	} 
	function review(reviewResult){
		var id = $("#invoiceId").val();
		$.ajax({url:"review.do",data:{id:id,reviewResult:reviewResult},type:"POST",dataType:"JSON",
			success:function(result){
				if(result){
					window.location.href="list.do";
				}
			}
		});
	}	
</script>
</#macro>

<@layout title="增票资质审核">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form" >
			<div class="form-group">
				<select name="isReview" id="isReview" class="form-control">
					<option value="">--- 状态 ---</option>
					<option value="0">未审核</option>
					<option value="1">已审核</option>
				</select>
			</div>
			<div class="form-group">
				<select name="reviewResult" id="reviewResult" class="form-control">
					<option value="">--- 审核结果 ---</option>
					<option value="1">通过</option>
					<option value="0">未通过</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="用户名">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="申请单号" data-prop="id" data-default="1" />
			<th data-title="所属用户" data-prop="userId" />
			<th data-title="单位名称" data-prop="organization" />
			<th data-title="状态">
			{{ isReview == 0 ? "未审核" : "" }} 
			{{ isReview == 1 ? "已审核" : "" }}
			</th>
			<th data-title="审核结果">
			{{ reviewResult == 0 ? "未通过" : "" }}
			{{ reviewResult == 1 ? "通过" : "" }}
			</th>
			<th data-title="提交时间" data-prop="createdTime" />
			<th data-title="审核时间" data-prop="reviewTime" />
			<th data-title="操作" data-width="100px">
				<a href="#" onclick="getInvoice({{id}})">查看</a>
			</th>
		</tr>
	</table>
	 <div class="modal-dialog modal fade"  id="invoicedialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">增票资质申请详情</h4>  
      </div>  
      <div class="modal-body">  
        <div class="text-center">
        	<form class="form-horizontal">
        	<div class="form-group">
				<label class="control-label col-md-4 col-md-offset-2">所在单位：</label>
				<div class="col-md-4 control">
					<p class="form-control-static" id="organization"></p>
				</div>
			</div>
        	<div class="form-group">
				<label class="control-label col-md-4 col-md-offset-2">纳税人识别码：</label>
				<div class="col-md-4 control">
					<p class="form-control-static" id="userIdcode"></p>
				</div>
			</div>
        	<div class="form-group">
				<label class="control-label col-md-4 col-md-offset-2">注册地址：</label>
				<div class="col-md-4 control">
					<p class="form-control-static" id="registAddress"></p>
				</div>
			</div>
        	<div class="form-group">
				<label class="control-label col-md-4 col-md-offset-2">注册电话：</label>
				<div class="col-md-4 control">
					<p class="form-control-static" id="registPhone"></p>
				</div>
			</div>
        	<div class="form-group">
				<label class="control-label col-md-4 col-md-offset-2">开户银行 ：</label>
				<div class="col-md-4 control">
					<p class="form-control-static" id="bank"></p>
				</div>
			</div>
        	<div class="form-group">
				<label class="control-label col-md-4 col-md-offset-2">银行账户 ：</label>
				<div class="col-md-4 control">
					<p class="form-control-static" id="bankAccount"></p>
				</div>
			</div>
			</form>
        </div>
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="invoiceId"/>  
         <button id="pass" onClick="review(1)" class="btn btn-success" data-dismiss="modal">审核通过</button> 
         <button id="fail" onClick="review(0)" class="btn btn-danger" data-dismiss="modal">审核失败</button>  
         <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>   
      </div>  
    </div>
  </div>
</@layout>