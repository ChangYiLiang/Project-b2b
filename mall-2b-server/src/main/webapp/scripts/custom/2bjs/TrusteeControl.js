
	
/*联动操作*/
	$(function(){
		$(".ul-left0").children("li").click(function(){
			var i = $(this).index();
			var n = i - 1;
			var m = i + 1;
			var s = i - 2;
			var p = $(this).parent().prev().text();
			if(i==0)
			{
				$(".ul-left1,.ul-left2,.ul-left3").children("li").children("button").attr({"disabled":false}).removeClass("btn-disabled");
				
				min =1;
				max = 999;
				$(".ip").attr("value",1);
				$("#ipnum").val(1);
				var h = 1;
				var p = $("#ip-leftcut").parent().parent().prev().text();
				$(".P_price2").children("li:eq(0)").text(h);
				$(".right-ul2").children("li:eq(0)").text(p+h);
				
				$(".ul-left1").children("li:gt("+i+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				$(".ul-left1").children("li:eq("+i+")").children("button").click();
				
				$(".ul-left2").children("li:gt("+m+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				$(".ul-left2").children("li:eq("+i+")").children("button").click();
				
				/*
				$(".ip").attr("value",1);
				var h = 1;
				min =1;
				max = h + 999;
				$("#ip-leftcut").click();
				*/
		
			}
			else if(i==1)
			{
				$(".ul-left1,.ul-left2,.ul-left3,.ul-left4,.ul-left5,.ul-left6").children("li").children("button").attr({"disabled":false}).removeClass("btn-disabled");
				
				min =1;
				max = 999;
				$(".ip").attr("value",1);
				$("#ipnum").val(1);
				var h = 1;
				var p = $("#ip-leftcut").parent().parent().prev().text();
				$(".P_price2").children("li:eq(0)").text(h);
				$(".right-ul2").children("li:eq(0)").text(p+h);
				
				$(".ul-left1").children("li:gt("+n+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				$(".ul-left1").children("li:eq("+n+")").children("button").click();
				
				$(".ul-left2").children("li:lt("+m+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				$(".ul-left2").children("li:eq("+m+")").children("button").click();
				
				/*
				$(".ip").attr("value",1);
				var h = 1;
				min =1;
				max = h + 999;
				$("#ip-leftcut").click();
				*/
			}
			else if(i==2)
			{
				$(".ul-left1,.ul-left2,.ul-left3,.ul-left4,.ul-left5,.ul-left6").children("li").children("button").attr({"disabled":false}).removeClass("btn-disabled");
				
				min =1;
				max = 999;
				$(".ip").attr("value",1);
				$("#ipnum").val(1);
				var h = 1;
				var p = $("#ip-leftcut").parent().parent().prev().text();
				$(".P_price2").children("li:eq(0)").text(h);
				$(".right-ul2").children("li:eq(0)").text(p+h);
				
				$(".ul-left1").children("li:gt("+s+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				$(".ul-left1").children("li:eq("+s+")").children("button").click();
				
				
				/*
				$(".ip").attr("value",1);
				var h = 1;
				min =1;
				max = h + 999;
				$("#ip-leftcut").click();
				*/
				
			}
			else if(i==3)
			{
				$(".ul-left1,.ul-left2,.ul-left3,.ul-left4,.ul-left5,.ul-left6").children("li").children("button").attr({"disabled":false}).removeClass("btn-disabled");
				
				min =1;
				max = 999;
				$(".ip").attr("value",5);
				$("#ipnum").val(5);
				var h = 5;
				var p = $("#ip-leftcut").parent().parent().prev().text();
				$(".P_price2").children("li:eq(0)").text(h);
				$(".right-ul2").children("li:eq(0)").text(p+h);
				
				$(".ul-left1").children("li:gt("+s+")").children("button").click();
				$(".ul-left1").children("li:eq("+s+")").children("button").click();
				$(".ul-left1").children("li:lt("+s+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				
				//var h = 5;
				//max = h + 999;
				//$("#ip-leftcut").click();
				//$("#right-add").click();
						
			}
			else if(i==4)
			{
				$(".ul-left1,.ul-left2,.ul-left3,.ul-left4,.ul-left5,.ul-left6").children("li").children("button").attr({"disabled":false}).removeClass("btn-disabled");
				
				
				min =1;
				max = 999;
				$(".ip").attr("value",13);
				$("#ipnum").val(13);
				var h = 13;
				var p = $("#ip-leftcut").parent().parent().prev().text();
				$(".P_price2").children("li:eq(0)").text(h);
				$(".right-ul2").children("li:eq(0)").text(p+h);
				
				$(".ul-left1").children("li:gt("+s+")").children("button").click();
				$(".ul-left1").children("li:eq("+s+")").children("button").click();
				$(".ul-left1").children("li:lt("+s+")").children("button").attr({"disabled":true}).addClass("btn-disabled");
				
				/*
				$(".ip").attr("value",13);
				var h = 13;
				min = 1;
				max = h + 999;
				$("#ip-leftcut").click();
				*/
			}
		})
	})
	
	