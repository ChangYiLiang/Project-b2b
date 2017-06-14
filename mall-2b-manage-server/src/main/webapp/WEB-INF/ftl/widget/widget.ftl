<#macro defaultScripts></#macro>
<#macro definewidget name, scripts=defaultScripts>
	<div id="wrap">
		<#nested />
	</div>
	<@scripts />
	<script>
		window.addEventListener('message', function(e){
			if (e.data.type=="init-widget") {
				var element = e.data.element;
				var data = {element: element, type: 'widget',name: '${name}' , html: document.body.firstChild.innerHTML};
				window.parent.postMessage(data, '*');
				window.widgetElement = element;
				window.widgetName = '${name}'
			}
		});
		window.parent.postMessage({type: 'init-widget'}, '*');
	</script>
</#macro>

<#macro widget path, element=''>
	<script>
		;(function() { var element = '${element}';
			if(!element) {
				element = ('widget_' + Math.random()).replace('0.');
			}
			if (!window.hasWidgetAddMessageEvent) {	// 防止多次添加
				window.addEventListener('message', function(e){
					if(e.data && e.data.type=="widget") {
						var html = e.data.html;
						if (window.jQuery) {
							$("#" + e.data.element).html(html);
						} else {
							document.getElementById(e.data.element).innerHTML = html;
						}
					}
				});
				window.hasWidgetAddMessageEvent = true;
			}
			document.write('<div id="' + element + '"></div>');
			window.addEventListener('load', function(){
				var iframe = document.createElement('iframe');
				iframe.style.display = "none";
				iframe.onload = function() {
					this.contentWindow.postMessage({type:'init-widget', element: element}, '*')
				};
				document.body.appendChild(iframe);
				iframe.src = '${path}';
			})
			// document.write('<iframe src="${path}" frameborder="0" style="display:none" onload="this.contentWindow.postMessage({type:\'init-widget\', element: \'' + element + '\'}, \'*\')"></iframe>')
		})();
	</script>
</#macro>
