<#include "../layout.ftl">

<#macro scripts>
<script>
	function confirmInvoice(data){
		$("#tempData").val(data);
		$("#confirm").modal();
	} 
	function putInvoice(){
		var data = $("#tempData").val();
		$.ajax({url:"confirminvoice.do",data:{invoiceId:data},type:"POST",dataType:"JSON",
		success:function(result){
			if(result){
				alert("确定成功");
				window.location.href="listinvo.do";
			}else{
				alert("确定失败");
				window.location.href="listinvo.do";
			}
		} 
	});
	}
</script>
</#macro>

<@layout title="发票记录">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form" >
			<div class="form-group">
				<select name="type" id="type" class="form-control">
					<option value="">--- 类型 ---</option>
					<option value="0">普通发票</option>
					<option value="1">增值税发票</option>
				</select>
			</div>
			<div class="form-group">
				<select name="state" id="state" class="form-control">
					<option value="">--- 状态 ---</option>
					<option value="0">未开</option>
					<option value="1">已开</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" data-table-ajax-source="listinvo.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="发票单号" data-prop="id" data-default="1" />
			<th data-title="所属用户" data-prop="userName" />
			<th data-title="订单id" data-prop="orderId" />
			<th data-title="类型">
			{{ type == 0 ? "普通发票" : "" }} 
			{{ type == 1 ? "增值税发票" : "" }}
			</th>
			<th data-title="状态">
			{{ state == 0 ? "未开" : "" }} 
			{{ state == 1 ? "已开" : "" }}
			</th>
			<th data-title="时间" data-prop="createdTime" />
			<th data-title="操作" data-width="100px">
				<a href="${BasePath}/controller/invoice/detailinvo.do?invoiceId={{id}} ">查看详情</a>&nbsp
				<a href="javascript:;" onclick="confirmInvoice({{id}})">开具发票</a>
			</th>
		</tr>
	</table>
	
<div class="modal-dialog modal fade"  id="confirm">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
       
      </div>  
      <div class="modal-body"> 
      	 <h3 class="modal-title">确定开具该发票？</h3>   
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="tempData"/>  
         <button type="button" onclick="putInvoice()" class="btn btn-default" data-dismiss="modal">确定</button>   
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
      </div>  
    </div>
  </div>
</@layout>