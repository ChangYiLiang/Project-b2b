<#include "../layout.ftl">

<#macro scripts>
<script>
   function  delMessage(id){
 	$("#messageId").val(id);
 	$('#delcfmModel').modal();
   }
   function submit(){
    var messageId = $("#messageId") .val();
   	$.post("deleteMessage.do",{messageId:messageId},function(data){  		
   			$("#messageTable").dataTable().fnDraw();
   	})
   }
  
</script>

</#macro>

<@layout title="消息管理">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户id">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="messageTable" data-table-ajax-source="messageList.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="编号" data-prop="id" data-default="1" />
			<th data-title="消息标题" data-prop="content" />
			<th data-title="相关用户" data-prop="userId" />
			<th data-title="创建时间" data-prop="createTime" />
        	<th data-title="操作" data-width="200px">
				<a href="#" onClick="delMessage({{id}})">删除</a>
			</th>
		</tr>
	</table>
    <div class="modal-dialog modal fade"  id="delcfmModel">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">提示信息</h4>  
      </div>  
      <div class="modal-body">  
        <p>您确认要删除这条消息吗？</p>  
      </div>  
      <div class="modal-footer">  
         <input type="hidden" id="messageId"/>  
         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
         <button  onClick="submit()" class="btn btn-success" data-dismiss="modal">确定</button>  
      </div>  
    </div>
  </div>
</@layout>