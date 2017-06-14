<#macro pagination url searchModel>

<nav aria-label="Page navigation">
	<ul class="pagination">
		<#if ((searchModel.pageNo!1) == 1)>
		<li class="disabled">
			<span>
				<span aria-hidden="true">«</span>
			</span>
		</li>
		<#else>
		<li>
			<a href="${url?replace('{pageNo}',1)}" aria-label="Previous"><span aria-hidden="true">«</span></a>
		</li>
		</#if>
		
		<#list 1..searchModel.maxPage as p>
		<li class="${(p == (searchModel.pageNo!1))?string('active', '')}">
			<a href="${url?replace('{pageNo}', p)}">${p}</a>
		</li>
		</#list>
		
		<#if ((searchModel.pageNo!1) == searchModel.maxPage)>
		<li class="disabled">
			<span>
				<span aria-hidden="true">»</span>
			</span>
		</li>
		<#else>
		<li>
			<a href="${url?replace('{pageNo}', searchModel.maxPage)}" aria-label="Next"><span aria-hidden="true">»</span></a>
		</li>
		</#if>
		<li>
			<span>
				<span aria-hidden="true">共${searchModel.maxPage}页</span>
			</span>
		</li>
	</ul>
</nav>
</#macro>