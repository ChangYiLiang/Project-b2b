function cancelOrder(data){
	
	layer.confirmEx({content: "是否取消该订单?", icon: "question", yes: function () {
		var url = "../controller/order/cancelOrder.do";
		var data1 = {
			"id" : data
		};
		$.ajax({
			url: url,
			type: "POST",
			dataType: "JSON",
			data: data1,
			success: function(data){
				if(data=="success"){
					layer.alertEx({content: "取消订单成功", end: function () {
						location.reload();
					}});
				} else {
					layer.alertEx({content: "取消订单失败", end: function() {
					}});
				}
			}
		});
    }});
	
	
	/*if(confirm("是否取消该订单?")){
		$.post("../controller/order/cancelOrder.do",{id:data},function(data){
			if(data=='success'){
				alert("取消订单成功")
				location.reload();
			}else{
				alert("取消订单失败")
			}
		},'json')
	}*/
}
function returnGoods(data){
	layer.confirmEx({content: "是否申请退货?", icon: "question", yes: function () {
		var url = "../controller/order/returnGoods.do";
		var data1 = {
			"orderId" : data
		};
		$.ajax({
			url: url,
			type: "POST",
			dataType: "JSON",
			data: data1,
			success: function(data){
				if(data){
					layer.alertEx({content: "退货成功", end: function () {
						location.reload();
					}});
				} else {
					layer.alertEx({content: "退货失败", end: function() {
					}});
				}
			}
		});
    }});
	
	/*if(confirm("是否申请退货?")){
		$.post("../controller/order/returnGoods.do",{orderId:data},function(data){
			if(data){
				alert("退货成功")
				location.reload();
			}else{
				alert("退货失败")
			}
		},'json')
	}*/
}