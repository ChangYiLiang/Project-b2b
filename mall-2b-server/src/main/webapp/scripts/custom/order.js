define( function(){
requirejs(['jquery', 'core'],function() {
	$(function(){
		$(".goodsTable").each(function(index){
			var height1 =$(this).height();
			var height2= $(this).next().children().children().height();
			var s = (height1-height2)/2;
			$(this).next().children().children().css({"margin-top":s});
		});
	});
	var order = MyApp.namespace("order");
	
/*	order.returnGoods = function(orderId){
		if(confirm('确认退款吗?')){
			$.post("returnGoods.do",{orderId:orderId},function(data){
				if(data){
					layer.alertEx({content: "退货成功!"});
				}else{
					layer.alertEx({content: "退货失败！"});
				}
			},'json')
		}
	}*/
	order.contactService = function(){
		$("#globalService").click();
	}
	
	order.topay = function(data){
		var BasePath  = $("#BasePath").val();
		var orderId = data.id;
		
		$.post("isMain.do",{},function(data){
			if(data){
				window.location.href = BasePath+"/cart/topay.do?orderId="+orderId;
			}else{
				layer.alertEx({content: "请先设置收货地址!",icon: "info",yes:function(index){
					window.open(BasePath+"/address/myaddress.do");
					layer.close(index);
				}});
			}
		},'json');
	}
	
	order.logisticsquery = function(data){
		var url = "logisticsdetails.do";
		var data = 	data;
		$.ajax({url: url,type: "POST",dataType: "JSON",data: data,
			success: function(data){
				if(data.result){
					var Logistics = data.logistics;
					var logisticStateMap = data.logisticStateMap;
					$("#LogisticCode").html(data.expNo);
					$("#expCompany").html(data.expCompany);
					$("#logisticStatus").html(logisticStateMap[Logistics.state]);
					$("#estimatedDeliveryTime").html(Logistics.estimatedDeliveryTime);
					var html="";
					$(Logistics.logisticsDetails).each(function(){
						html += this.acceptStation+"</br>"+"<span class='green'>"+this.acceptTime+"</span></br></br>"
					});
					$("#Logistics").html(html);
					$('#logisticsQuery').modal();
				}else{
					$("#logisticsError").html("无物流信息");
					$('#logisticsQuery').modal();
				}
			}
		});
	},
	
	order.deleteOrder = function(data){
		var data = data.id;
		layer.confirmEx({content: "是否取消该订单?", icon: "question", yes: function () {
			var url = "deleteOrder.do";
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
						layer.alertEx({content: "订单取消成功", end: function () {
							window.location.href="tomyorder.do?state=0";
						}});
						
					} else {
						layer.alertEx({content: "订单取消失败", end: function() {
							window.location.href="tomyorder.do?state=0";
						}});
					}
				}
			});
        }});
	},
	
	order.received = function(data){
		var data = data.id;
		layer.confirmEx({content: "确定您已收到该商品！", icon: "question", yes: function () {
			var url = "received.do";
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
						layer.alertEx({content: "确认收货成功！", end: function () {
							window.location.href="tomyorder.do?state=6";
						}});
						
					} else {
						layer.alertEx({content: "确认收货失败！", end: function() {
							window.location.href="tomyorder.do?state=6";
						}});
					}
				}
			});
        }});
	}
	
});
	var logisticsquery = function(){
		requirejs(['core'], function(){
			var state = $("#shippingStatus").val();
			if(state != 0){
				var data = {orderId:$("#ordId").val()}
				$.ajax({url:"logisticsdetails.do",data:data,dataType:"JSON",type:"POST",
					success:function(data){
						var Logistics = data.logistics;
						var logisticStateMap = data.logisticStateMap;
						$("#expCompany").html(data.expCompany);
						$("#expNo").html(+data.expNo);
						$("#state").html(logisticStateMap[Logistics.state]);
						$("#estimatedDeliveryTime").html(Logistics.estimatedDeliveryTime);
						var html="";
						$(Logistics.logisticsDetails).each(function(){
							html += "<span>o&nbsp&nbsp--&nbsp&nbsp"+this.acceptTime+"&nbsp"+this.acceptStation+"</span></br></br>"
						});
						$("#Logistics").html(html);
						$("#Logistics").children("span").last().css("color","red");
					}
				});
			}
		});
	}
	
	return{
		getlogisticsquery:logisticsquery
	}

});
