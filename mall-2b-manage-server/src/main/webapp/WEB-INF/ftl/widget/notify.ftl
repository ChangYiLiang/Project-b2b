<#include 'widget.ftl'>
<#macro scripts>
	<script>
		function showMessage() {
			var data = {element: window.widgetElement, type: 'widget' , html: document.body.firstChild.innerHTML};
			window.parent.postMessage(data, '*');
		}
		
		function reload() {
			location.reload();
		}
		
		setInterval(showMessage, 1000)
		// setTimeout(reload, 5000);
	</script>
</#macro>
<@definewidget 'notify', scripts>
	<script>
		if(window.jQuery && !jQuery.notify) {
			(function() {
				var script = document.createElement("script");
				script.src = "${BasePath}/scripts/custom/notify.js";
				document.body.appendChild(script)
			})();
		}
		if (window.jQuery && jQuery.notify) {
			var getNotifyStyle = getNotifyStyle || function(id){
				var bootstrap = jQuery.notify.getStyle('bootstrap')
				var html = '<div><div class="notify" data-ticket-id="' + id + '" id="notify_' + id + '">'
						 + '工单: <a target="_blank" href="${BasePath}/controller/ticket/details.do?id=' + id + '"><span data-notify-text></span></a>'
						 + '</div></div>';
				var style = $.extend({}, bootstrap, {html: html})
				return style
			}
			
			var getNotifyLinkStyle = getNotifyLinkStyle || function(link){
				var bootstrap = jQuery.notify.getStyle('bootstrap')
				var html = '<div><div class="">'
						 + '<a target="_blank" href="' + link + '"><span data-notify-text></span></a>'
						 + '</div></div>';
				var style = $.extend({}, bootstrap, {html: html})
				return style
			}
			
			// 隐藏已处理的消息
			;(function(){
				var ticketList = ${ticketsJson!'[]'};
				for(var i=0; i<ticketList.length; i++) {
					$(".notify").each(function(){
						var id = $(this).data("ticket-id");
						if(typeof(id)=="number" && ticketList.indexOf(id)==-1) {
							$(this).trigger("notify-hide")
						}
					})
				}
			})();
			
			// 显示未处理的消息
			;(function(){
				var tickets = {}
				<#list list as ticket>
				tickets[${ticket.id}] = '${ticket.title}'
				</#list>
				for(var id in tickets) {
					if($("#notify_" + id).length) {
						continue;
					}
					var list = window.NofityHideList || {}
					if (list[id]) {
						continue;
					}
					$.notify.addStyle('notify_' + id, getNotifyStyle(id));
					$.notify( tickets[id], { 
					  style: 'notify_' + id,
					  autoHide: false,
					  clickToHide: false,
					  globalPosition: "top center"
					});
				}
				var totalTicket = window.notifyTotalTicket || (window.notifyTotalTicket = ${totalTicket})
				if(totalTicket > 0) {
					$.notify.addStyle('linkStyle', getNotifyLinkStyle('${BasePath}/controller/ticket/mylist.do'));
					$.notify( "你有 " + totalTicket + " 条未完成的工单", { 
					  style: 'linkStyle',
					  autoHide: false,
					  clickToHide: true,
					  globalPosition: "bottom right",
					  className: 'info'
					});
					window.notifyTotalTicket = -1;
				}
				
			})();
			$(".notify a").unbind().click(function(){
				var list = window.NofityHideList || (window.NofityHideList = {})
				list[$(this).parents(".notify").data("ticket-id")] = true;
				$(this).trigger("notify-hide")
			})
			
		}
	</script>
	<style>
		.notifyjs-corner {
			z-index: 10000;
		}
	</style>
</@definewidget>