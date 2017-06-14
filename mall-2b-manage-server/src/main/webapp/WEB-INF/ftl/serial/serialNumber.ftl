<#include "../layout.ftl">
<@layout title="商品序列号">
<style>
</style>
	<div class="row">
		<div class="col-md-6">
				<div class="text-left">
					  <button type="button" onclick="openAdd()"  class="btn btn-primary">添加序列号</button>
				</div>
		 </div>
		 <div class="col-md-6">
				<div class="text-right" id="searchForm">
					<form class="form-inline" role="form">
						<div class="form-group">
						    <input type="text" class="form-control" id="b2bSerial" name="b2bSerial" placeholder="平台序列号">
							<input type="text" class="form-control" id="manufacturerSerial" name="manufacturerSerial" placeholder="厂商序列号">
						</div>
					  	<button type="submit" class="btn btn-primary">查找</button>
					</form>
				</div>
		</div>
 </div>
	<table class="table table-striped table-bordered table-hover" id="serialTable" data-table-ajax-source="list.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="商品编号" data-prop="goodsid" data-default="1" />
			<th data-title="平台序列号" data-prop="b2bSerial" />
			<th data-title="厂商序列号" data-prop="manufacturerSerial" />
			<th data-title="创建人" data-prop="createMan" />
        	<th data-title="创建时间" data-prop="createTime" />
        	<th data-title="修改人" data-prop="updateMan" />
        	<th data-title="操作" data-width="100px">
				<a  onclick="openUpdate({{id}})" >修改</a>
			</th>
		</tr>
	</table>
	
	
	 <div class="modal-dialog modal fade"  id="addSerial">  
    <div class="modal-content ">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">编辑序列号</h4>  
      </div>  
      <form class="form-horizontal" role="form">
         <div class="modal-body"> 
					  <div class=" form-group">
						    <label for="firstname" class="col-sm-3 control-label">商品编号</label>
							     <div class="col-sm-5">
							     	 <input type="text" class="form-control" id="goodsid" name="goodsid" />
								 </div>
								 <div class="col-sm-3">
							     	 <button class="btn blue" type="button" onclick="getGoods()" style="margin-left:7px;">查看商品</button>
								 </div>
					 </div>
					 <div class="form-group">
						    <label for="goodsBrand" class="col-sm-3 control-label">商品类别</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="goodsBrand" disabled>
						    </div>
					  </div>
					  <div class="form-group">
						    <label for="goodsName" class="col-sm-3 control-label">商品名称</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="goodsName" disabled>
						    </div>
					  </div>
					 <div class="form-group">
						    <label for="firstname" class="col-sm-3 control-label">平台序列号</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="b2bSerial1" name="b2bSerial1">
						    </div>
					  </div>
					  <div class="form-group">
						    <label for="firstname" class="col-sm-3 control-label">厂商序列号</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="manufacturerSerial1" name="manufacturerSerial1">
						    </div>
					  </div>
			 	
        </div>  
      <div class="modal-footer">  
         <input type="hidden" id="id" />  
         
         <button onClick="save()" class="btn btn-success" data-dismiss="modal">保存</button> 
         <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>   
      </div>  
      
   </form>
    </div>
  </div>
	<script>
			function getGoods(){
				var goodsid = $("#goodsid").val();
				if(!goodsid ||　goodsid==""){
					alert("商品ID不能为空!");
					return;
				}
				if(!isNaN(goodsid) && $.trim(goodsid)){
					$.post("getGoods.do",{id:goodsid},function(data){
						if(data){
							$("#goodsBrand").val(data.type);
							$("#goodsName").val(data.name);
						}else{
							alert("没有该商品!");
						}
					},'json')
				}else{
					alert("你不能这么做!");
				}
			}
	
			function openAdd(){
					$("#goodsid").val("");
					$("#b2bSerial1").val("");
					$("#manufacturerSerial1").val("");
					$("#goodsBrand").val("");
					$("#goodsName").val("");
					$("#addSerial").modal();
					$("#id").val("");
				}
			function openUpdate(id){
					
					$.post("findById.do",{id:id},function(data){
						 if(data){
						 	$("#goodsid").val(data.goodsid);
							$("#b2bSerial1").val(data.b2bSerial);
							$("#manufacturerSerial1").val(data.manufacturerSerial);
							getGoods();
						 }
					},'json')
					$("#addSerial").modal();
					$("#id").val(id);
			}
				
		   function save(){
		   		var id= $("#id").val();
		   		var b2bSerial = $("#b2bSerial1").val();
		   		var manufacturerSerial = $("#manufacturerSerial1").val();
		   		var goodsid = $("#goodsid").val();
		   		   $.post("save.do",{id:id,b2bSerial:b2bSerial,manufacturerSerial:manufacturerSerial,goodsid:goodsid},function(data){
								if(data){
									$("#serialTable").dataTable().fnDraw();
								}else{
									alert("没有这个订单号!");
								}   		   	
		   		   },'json')
		   }
	</script>
</@layout>