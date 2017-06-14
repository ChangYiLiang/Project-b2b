<#include "../layout.b2b.ftl">
<#assign active='o2'>

<#macro script>

</#macro>

<@layout>
<link rel="stylesheet" href="${BasePath}/css/file-icon.css" />
<h2 class="bg-white">采购详情</h2>
<div class="bg-white other-body" style="min-height: 400px">
	<div class="col-md-12">
		<h3 class="green">${states[requirement.state?string]!''}</h3>
		<br />
		<h4>采购需求信息</h4>
		<p>采购需求编号: ${requirement.id}</p>
		<p>提交时间: ${requirement.createTime?datetime}</p>
		<p>上传的文档: </p>
		<p>需求标题: ${requirement.title!''}</p>
		<p>需求类型: ${types[requirement.type?string]!''}</p>
		<#list goods as g>
		<p>需求产品名称: ${g.goodsName!''}</p>
		<p>所需数量: ${g.qty!0}</p>
		<p>预算金额: ${g.bedget!0}</p>
		</#list>
		<p>补充说明: ${requirement.description!''}</p>
		<p>联系人: ${requirement.contact!''}</p>
		<p>联系电话: ${requirement.phone!''}</p>
		<p>邮箱: ${requirement.email!''}</p>
		<p>QQ: ${requirement.qq!''}</p>
		<p>微信: ${requirement.weixin!''}</p>
		<br /><br /><br />
	</div>
	<div class="clearfix"></div>
	<hr />
	
	<#if !(offer??)>
		<div class="col-md-12">
			<button class="btn btn-default">咨询线上专员</button>
		</div>
	</#if>
	
	<#if offer??>
	<div class="col-md-12">
		<br />
		<h4>九河方案详情</h4>
		<p>回复时间: ${offer.createTime?datetime}</p>
		
		<p>推荐产品: ${offer.goodsName} &nbsp;&nbsp;
			<#if (offer.goodsUrl!'') != ''>
			<a target="_blank" href="${offer.goodsUrl}">查看</a>
			</#if>
		</p>
		<p>推荐产品: ${offer.reason}</p>
		<p>推荐产品: ${offer.goodsValue}</p>
		<p>方案参考总金额: ${offer.price!0} 元</p>
		<p>方案专员: ${offer.service} (${offer.phone})</p>
		<br /><br />
		<p><button class="btn btn-default">还有疑问点击联系方案专员</button></p>
		
	</div>
	</#if>
	<div class="clearfix"></div>
	<br />
	<hr />
</div>
</@layout>
