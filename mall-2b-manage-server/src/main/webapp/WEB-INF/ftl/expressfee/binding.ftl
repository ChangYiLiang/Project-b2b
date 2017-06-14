<#include "../layout.ftl">

<#macro scripts>
<script>
  var bindExpress = function(id){
  	var goodsId = $("#goodsId").val();  
  	var data ={goodsId:goodsId,templateId:id};
  	$.ajax({data:data,url:"tobindexpressfee.do",type:"post",dataType:"json",success:function(result){
  		if(result){
  			alert("绑定成功!");
  			window.location.href="goods.do";
  		}else{
  			alert("绑定失败! 请重新绑定.");
  			window.location.href="goods.do";
  		}
  	}});
  }
</script>
</#macro>

<@layout title="绑定运费模板">
<div class="text-right" id="searchForm">
	<form class="form-inline" role="form" >
		<div class="form-group">
			<select name="expressType" id="expressType" class="form-control">
				<option value="">--- 发件方式 ---</option>
				<option value="0">不包邮</option>
				<option value="1">部分地区包邮</option>
				<option value="2">全国包邮</option>
			</select>
		</div>
		<div class="form-group">
			<select name="expressName" id="expressName" class="form-control">
				<option value="">--- 快递公司 ---</option>
				<#list expressList as express>
					<option value="${express!''}">${express!''}</option>
				</#list>
			</select>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
		</div>
	  	<button type="submit" class="btn btn-primary">查找</button>
	</form>
</div>
<table class="table table-striped table-bordered table-hover" data-table-ajax-source="bindexpressfee.do" data-table-search-form="#searchForm">
	<tr class="columns" style="display: none">
		<th data-title="模板编号" data-prop="id" data-default="1" />
		<th data-title="模板名称" data-prop="name" />
		<th data-title="快递公司" data-prop="expressName" />
		<th data-title="发货地" data-prop="senderProvince" />
		<th data-title="发件方式">
		{{ expressType == 0 ? "不包邮" : "" }} 
		{{ expressType == 1 ? "部分地区包邮" : "" }}
		{{ expressType == 2 ? "全国包邮" : "" }}
		</th>
		<th data-title="创建时间" data-prop="createTime" />
		<th data-title="操作" data-width="100px">
			<a class="btn btn-info" href="javascript:void(0)" onclick="bindExpress({{id}})">绑定该模板</a>
		</th>
	</tr>
</table>
<input type="hidden" id="goodsId" value="${goodsId}"/>
</@layout>			
