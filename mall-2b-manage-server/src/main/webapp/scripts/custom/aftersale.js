(function() {
	var afs = MyApp.namespace("AfterSale");
	var bs = MyApp.namespace("bootstrap");
	afs.process = function(ele) {
		var data = {};
		data["id"] = getUrlParam("id");
		bs.ajaxButton(ele, "process.do", data, function() {
			alert("业务已受理");
			location.reload();
		});
	}
	
	afs.refuse = function(ele) {
		if (!confirm("拒绝该业务之后用户无法再次申请该业务, 是否继续?")) {
			return;
		}
		var data = {};
		data["id"] = getUrlParam("id");
		bs.ajaxButton(ele, "refuse.do", data, function() {
			alert("该业务已拒绝");
			location.reload();
		});
	}
	
	afs.cancel = function(ele) {
		if (!confirm("是否取消该售后申请?")) {
			return;
		}
		var data = {};
		data["id"] = getUrlParam("id");
		bs.ajaxButton(ele, "cancel.do", data, function() {
			alert("该业务已取消");
			location.reload();
		});
	}
	
	afs.confirmMoney = function (ele) {
		var data = $("#refundInfo input").serializeObject();
		console.info(data)
		bs.ajaxButton(ele, "confirmMoney.do", data, function() {
			alert("已确认退款金额");
			location.reload();
		});
	}
	
})();