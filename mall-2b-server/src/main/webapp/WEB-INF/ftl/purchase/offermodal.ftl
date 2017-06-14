<#include "../layout.empty.ftl">

<#macro scripts>
<#if message??>
<script type="text/html" id="alertMessage">
<div>${message}</div>
</script>
<script>
	requirejs(['layerEx'], function() { 
		$("#alertMessage").alert({ end: function() {
			layer.closeAll();
			if (window.parent.layer) {
				window.parent.layer.closeAll();
			}
		}});
	 });
</script>
</#if>
</#macro>

<@layout>
	<link rel="stylesheet" href="${BasePath}/css/file-icon.css" />
	<div class="col-md-10 col-md-offset-1" style="width: 950px">
		<br />
		<#assign action='offermodal.do'>
		<#include 'requirement_panel.ftl'>
		<style>
			h4, hr{display:none}
		</style>
	</div>
</@layout>