<#include "../layout.ftl">

<#macro scripts>
	
</#macro>

<@layout title="预约上门列表">
	<div class="portlet-body">
		<div class="table-container">
			<table class="table table-striped table-bordered table-hover" id="datatable_cl">
				<thead>
			    <tr class="flag-tr">
			      <th>编号</th>
			      <th>联系人</th>
			      <th>联系电话</th>
			      <th>提交日期</th>
			      <th>预约日期</th>
			      <th>内容</th>
			      <th>对接工程师</th>
			      <th>预约费用</th>
			      <th>操作</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<#list list as bo>
				    <tr class="flag2-tr">
				      <td>${bo.id}</td>
				      <td>${bo.person!""}</td>
				      <td>${bo.mobile!""}</td>
				      <td>${bo.submitDate?datetime}</td>
				      <td>${bo.bespokeDate?datetime}</td>
					  <td>${bo.pokedesc!""}</td>
					  <td>${bo.tecperson!""}</td>
					  <td>${bo.pay!""}</td>
					  <td>
				     <#if bo.submitFlag=1>
			      		<a href="upbespoke.do?id=${bo.id}" data="${bo.id}" class="btn btn-primary Pikachu">未完成</a>
			      	<#elseif bo.submitFlag=3>
			      		<button style="background-color:#ccc" class="btn btn-primary">已取消预约</button>
			      	<#else>
			      		<button style="background-color:#ccc" class="btn btn-primary">已预约完成</button>
			      		</#if>
				      </td>
					  		
				    </tr>
			    </#list>
			  </tbody>
			</table>
		</div>
	</div>
</@layout>