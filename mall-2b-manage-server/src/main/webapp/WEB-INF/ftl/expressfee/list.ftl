<#include "../layout.ftl">

<#macro scripts>
<script src="${BasePath}/scripts/custom/expressfee.js"></script>
</#macro>

<@layout title="运费模板列表">
<style>
.nav-title li a{color: #1B9D97}
.nav-title li.active{background-color: #EEE}
.express-title {border:1px solid #CCCCCC;background-color: #F8F8F8;height:62px;}
.express-title-left{background-color: #F8F8F8;height:60px;}
.add-express{background-color:#1B9D97;height:60px; cursor: pointer;}
.template-top{background-color: #74D2D4;height:64px}
.template-title{background-color:#F8F8F8;}
.btn-user{background-color:#1B9D97;}
.btn-stop{background-color:#F35B6B;}
.template-top img{width: 92px;height: 50px;}
.template-top-left{margin-top: 7px;}
</style>
<input type="hidden" id="basePath" value="${BasePath}">
<div>
	<ul class="nav nav-pills nav-title">
		<li <#if type == 3>class="active"</#if>><a href="${BasePath}/controller/expressfee/list.do">全部</a></li>
		<li <#if type == 0>class="active"</#if>><a href="${BasePath}/controller/expressfee/list.do?expressType=0">不包邮</a></li>
		<li <#if type == 2>class="active"</#if>><a href="${BasePath}/controller/expressfee/list.do?expressType=2">全国包邮</a></li>
		<li <#if type == 1>class="active"</#if>><a href="${BasePath}/controller/expressfee/list.do?expressType=1">部分地区包邮</a></li>
		<li class="col-sm-5"></li>
		<li class="keyword">
			<input type="text" class="form-control" id="keyword" placeholder="关键字" value="${keyword!''}">
		</li>
		<li><button class="btn btn-primary" onclick="seachTemplate()">查找</button></li>
	</ul>
	<div class="express-title">
		<div class="express-title-left col-sm-10 text-left">
			<br/>
			<span>全国包邮模板列表</span>
		</div>
		<div class="add-express col-sm-2 text-center" onclick="window.location.href='${BasePath}/controller/expressfee/addtemplate.do'">
			<br/>
			<span>+新增运费模板</span>
		</div>
	</div>
	<br/><br/>
	<#if (templates ??) && (templates?size>0)>
		<#list templates as template>
			<div class="template">
				<div class="from-group template-top">
					<div class="col-sm-6 template-top-left">
						<img src="${BasePath}/image/u61.png"/>&nbsp&nbsp&nbsp&nbsp&nbsp
						<span>
						${template.name!''}
						&nbsp&nbsp&nbsp
						发货地：${template.senderProvince!''}
						</span>
					</div>
					<div class="col-sm-3" style="line-height: 64px;">
						<#if template.updateTime ??>
							<span>最后编辑时间：${template.updateTime?datetime}</span>
						<#else>
							<span>最后编辑时间：${template.createTime?datetime}</span>	
						</#if>
					</div>
					<div class="col-sm-2 col-sm-offset-1 text-right" style="line-height: 64px;">
						<span>
							<a href="${BasePath}/controller/expressfee/modify.do?templateId=${template.id}" style="color:#E9330C;text-decoration:none">修改</a>
							<a href="#" onclick="deleteTemplate(${template.id})" style="margin-left:50px;color:#E9330C;text-decoration:none">删除</a>
						</span>
					</div>
				</div>
				<div class="from-group template-table">
					<table class="table table-bordered table-hover text-center">
						<thead>
							<tr>
								<th width="10%">运送方式</th>
								<th width="10%">运送费</th>
								<th width="68%">到达地</th>
								<th width="12%">每新增一件费用</th>
							</tr>
						</thead>
						<tbody>
							<#if template.expressfeeTypes ??>
							<#list template.expressfeeTypes as expressfeeType>
								<tr>
									<td>${template.expressName!''}</td>
									<td>${expressfeeType.firstFee!''}</td>
									<td>${expressfeeType.expressAddress.provinceName!''}</td>
									<td>${expressfeeType.addFee!''}</td>
								</tr>
							</#list>	
								<tr>
									<td colspan="4">
										<div class="col-sm-3" style="line-height: 35px">
											<span>运费说明：${template.remark!''}</span>
										</div>
										<div class="col-sm-2 col-sm-offset-7">
											<#if template.isUsed == 0>
												<button onclick="enableTemplate(${template.id})" class="btn btn-user">使用此模板</button>
											<#else>
												<button onclick="disableTemplate(${template.id})" class="btn btn-danger">停用此模板</button>	
											</#if>
										</div>
									</td>
								</tr>
							</#if>
						</tbody>
					</table>
				</div>
			</div>
			</br></br>
		</#list>
		<#--分页-->
		<nav>
	 	  <ul class="pagination order-page">
	 	  	<li><a href="${BasePath}/controller/expressfee/list.do?pageNo=1${page.url!''}">首页</a></li>
		  	<#if page.pageNo != 1>
		  		<li><a href="${BasePath}/controller/expressfee/list.do?pageNo=${page.pageNo -1}${page.url!''}">&laquo;</a></li>
		  	<#else>
		  		<li class="disabled"><a>&laquo;</a></li>
		  	</#if>	
		    <#list 1..page.pageCount as i>
		   		<#if page.pageNo == i>
		   	 		<li class="active"><a >${i}</a></li>
		   	 	<#else>
		   	 	<#if ((i>page.pageNo-3) || (i<3)) && ((i<page.pageNo+3) || (i>page.pageCount-2))>
		   	 		<li><a href="${BasePath}/controller/expressfee/list.do?pageNo=${i}${page.url!''}">${i}</a></li>
		   	 	</#if>
		   		</#if>	
		    </#list>
		    <#if page.pageNo != page.pageCount>
		    	<li><a href="${BasePath}/controller/expressfee/list.do?pageNo=${page.pageNo +1}${page.url!''}">&raquo;</a></li>
		    <#else>
		    	<li class="disabled"><a>&raquo;</a></li>
		    </#if>
		    <li><a href="${BasePath}/controller/expressfee/list.do?pageNo=${page.pageCount}${page.url!''}">尾页</a></li>
		    <li><span>共${page.pageCount!''}页</span></li>
		  </ul>
		</nav>	
	<#else>
		<p class="text-center" style="font-size:18px;color:#999999">还未设置任何运费模板。</p>	
	</#if>	
</div>
</@layout>			
