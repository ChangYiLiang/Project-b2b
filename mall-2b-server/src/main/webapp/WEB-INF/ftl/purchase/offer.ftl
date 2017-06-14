<#include "../layout.common.ftl">

<#macro scripts>
<#if message??>
<script type="text/html" id="alertMessage">
<div>${message}</div>
</script>
<script>
	requirejs(['layerEx'], function() { $("#alertMessage").alert(); });
</script>
</#if>
</#macro>
<@layout>
	<link rel="stylesheet" href="${BasePath}/css/file-icon.css" />
	<div class="col-md-10 col-md-offset-1" style="width: 950px">
		<#assign action='offer.do'>
		<#include 'requirement_panel.ftl'>
	</div>
</@layout>