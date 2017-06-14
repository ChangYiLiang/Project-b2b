<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/2bjs/jquery-1.9.1.min.js"></script>
	<script>
		$(function(){
			$(".Pikachu").click(function(){
				$(this).attr({"disabled":true});
				$(this).text("审核中...");
				var url="shenhe.do";
				var data={
						"id":$(this).attr("data")
					};
				$.ajax({url:url,data,success:function(data){
							if(data=="success"){
								alert("审核成功！！！");
								window.location.href="suggestlog.do";
							} else {
								alert("审核失败，请规范操作！！！");
								window.location.href="suggestlog.do";		
							}
				        }
					});
			});
		});
	</script>
</#macro>

<@layout title="投诉建议列表">
	<div class="portlet-body">
		<div class="table-container">
			<table class="table table-striped table-bordered table-hover" id="datatable_cl">
				<thead>
			    <tr class="flag-tr">
			      <th>编号</th>
			      <th>用户Id</th>
			      <th>类型</th>
			      <th>内容</th>
			      <th>审核</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<#list list as bo>
				    <tr class="flag2-tr">
				      <td>${bo.id}</td>
				      <td>${bo.userId}</td>
				      <td>${bo.type}</td>
				      <td>${bo.content}</td>
				      <td>
				     <#if bo.issubmit=1>
			      		<button data="${bo.id}" class="btn btn-primary Pikachu">通过</button>
			      	<#else>
			      		<button style="background-color:#ccc" class="btn btn-primary">已审核</button>
			      		</#if>
				      </td>
							
				    </tr>
			    </#list>
			  </tbody>
			</table>
		</div>
	</div>
</@layout>