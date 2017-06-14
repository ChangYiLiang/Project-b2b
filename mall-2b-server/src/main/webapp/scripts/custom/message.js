requirejs([ 'jquery', 'core' ], function() {
	var msg = MyApp.namespace("message");
	msg.updateRead = function(messageId) {
		$.post('read.do', {
			messageId : messageId
		}, function(date) {
			location.reload();
		});
	}
	msg.del=function(id){
		$.post('delete.do',{id:id},function(data){
			if(data){
				location.reload();
			}
		},'json')
		
	}
	msg.delcfm = function() {
		$('#delcfmModel').modal();
	}
	msg.urlSubmit = function() {
		window.location.href = 'delete.do?receive=0';
	}
	msg.setMessagecfm = function() {
		$.post('findUserTypeIds.do', {}, function(data) {
			var idStr = data;
			for (i = 0; i < idStr.length; i++) {
				$("[name=typeIds]").each(function() {
					if ($(this).val() == idStr[i]) {
						$(this).attr("checked", true);
					}
				});
			}
		}, 'json');
		$('#setMessagecfmModel').modal();
	}
	msg.updateMessageType = function() {
		var data = $("[name=typeIds]:checked").serialize();
		$.post('updateTypeIds.do', data, function() {
		});
	}
})