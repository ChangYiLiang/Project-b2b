<#include "../layout.b2b.ftl">
<#assign active='o4'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/user/subscribe.do">我的订阅</a></li>
</#macro>
<#macro script>
requirejs(['subscribe']);
</#macro>

<@layout>
<link rel="stylesheet" href="${BasePath}/css/subscribe.css" />

<div class="subscribe-head">
	<div class="title">
		我的订阅
	</div>
	<#if subscribes??>
		<#list subscribes as subscribe>
			<div class="my-tag">
				<span>${subscribe.tagName!''}</span>
				<div class="operate"></div>
				<input class="tagId" type="hidden" value="${subscribe.tagId!''}" />
			</div>
		</#list>
	</#if>
	<div class="more-tag text-right">
		<a href="javascript:;" onclick="MyApp.subscribe.moreTag()">更多订阅>></a>
	</div>
</div>

<div class="subscribe-head-2">
	<span>添加更多订阅</span>
	<#list TagCategorys as TagCategory>
		<div class="tags clearfix">
			<div class="tag tag-category">
				<span>${TagCategory.name!''}</span>
			</div>
			<#list TagCategory.tags as tag>
				<div class="tag tag-tag">
					<span>${tag.name!''}</span>
					<input class="tagId" type="hidden" value="${tag.id!''}"/>
				</div>
			</#list>
		</div>
	</#list>
	<div>
		<div class="clearfix"></div>
	</div>
</div>

<div class="other-body">
	<div class="subscribe-box">
		<div class="box-title">
			<div class="left">您订阅的【戴尔服务器】参与双十一活动，原价6400.00元，活动价5999.00元，直降401.00元,活动已结束</div>
			<div class="right">11.12  24:00</div>
		</div>
		<br/><br/>
		<div class="box-img">
			<img src="#" />
		</div>
	</div>
	<br/>

</div>

<input id="BasePath" type="hidden" value="${BasePath}"/>	
</@layout>
