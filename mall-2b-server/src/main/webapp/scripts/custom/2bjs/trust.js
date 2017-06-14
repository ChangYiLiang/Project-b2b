	/*载入操作*/
	$(function(){
		$(".big-left").ready(function(){
			var l = $(".ul-left").children("li").length;
			var ul_left = "ul-left";
			for(a=0;a<l;a++)
			{
				ul_left = "ul-left" + a;
				$("."+ul_left).children("li:eq(0)").children("button").click();
			}
			//$("#ip-leftcut").click();
			$(".ul-time").children("li:eq(0)").click();
		})
	})
	/*上面操作*/
	$(function(){
		var l = $(".ul-left").children("li").length;
		var ul_left = "ul-left";
		for(a=0;a<l;a++)
		{
			ul_left = "ul-left" + a;
			$("."+ul_left).children("li").children("button").click(function()
			{
				/*i获取左边当前索引与右边配置栏索引一致*/
				var i = $(this).parent().parent().parent().index();
				/*当前所在索引的值*/
				var ii= $(this).parent().index();
				var p = $(this).parent().parent().prev(".left-p").text();
				var t = $(this).text();
				var v = $(this).val();
				var d = $(this).attr("id");
				/*dom操作*/
				$(".right-ul").children("li:eq("+i+")").text(p+t);
				$(".P_price").children("li:eq("+i+")").text(v);
				$(".P_id").children("li:eq("+i+")").text(d);
				/*css操作*/
				$(this).parent().parent().children("li:eq("+ii+")").children("button").addClass("btn-success22").removeClass("btn-default");
				$(this).parent().parent().children("li:gt("+ii+")").children("button").removeClass("btn-success22").addClass("btn-default");
				$(this).parent().parent().children("li:lt("+ii+")").children("button").removeClass("btn-success22").addClass("btn-default");
				getAll();
				
			})
		}
	})
	/*下面操作*/
	$(function(){
		$("#ip-leftcut").click(function(){
			var n = $(".ip").val();
			var p = $(this).parent().parent().prev().text();
			var d = $(".ip").attr("id");
			$(".P_price2").children("li:eq(0)").text(n);
			$(".right-ul2").children("li:eq(0)").text(p+n);
			$("#ipnum").attr("value",n);
			$(".P_id2").children("li:eq(0)").text(d);
			getAll();
		})
		$("#ip-rightadd").click(function(){
			var n = $(".ip").val();
			var p = $(this).parent().parent().prev().text();
			var d = $(".ip").attr("id");
			$(".P_price2").children("li:eq(0)").text(n);
			$(".right-ul2").children("li:eq(0)").text(p+n);
			$("#ipnum").attr("value",n);
			$(".P_id2").children("li:eq(0)").text(d);
			getAll();
		})
		$(".ul-time li").click(function(){
			var ii= $(this).index();
			var t = $(this).children("button").text();
			var p = $(this).parent().prev().text();
			var v = $(this).children("button")[0].value;
			
			$(this).parent().children("li:eq("+ii+")").children("button").addClass("btn-success22").removeClass("btn-default");
			$(this).parent().children("li:gt("+ii+")").children("button").removeClass("btn-success22").addClass("btn-default");
			$(this).parent().children("li:lt("+ii+")").children("button").removeClass("btn-success22").addClass("btn-default");
			
			$(".P_price2").children("li:eq(1)").text(v);
			$(".right-ul2").children("li:eq(1)").text(p+t);
			$("#orderCycle").attr("value",v);
			getAll();
		})
		$("#left-cut").click(function(){
			var n = $("#number").val();
			var p = $(this).parent().parent().prev().text();
			$(".P_price2").children("li:eq(2)").text(n);
			$(".right-ul2").children("li:eq(2)").text(p+n);
			$("#number").attr("value",n);
			getAll();
		})
		$("#right-add").click(function(){
			var n = $("#number").val();
			var p = $(this).parent().parent().prev().text();
			$(".P_price2").children("li:eq(2)").text(n);
			$(".right-ul2").children("li:eq(2)").text(p+n);
			$("#number").attr("value",n);
			getAll();
		})
	})
	
	/*公共方法*/
	function getAll()
	{
		$(function()
		{
			var ping  = '';
			var price = 0;
			var l = $(".right-ul").children("li").length;
			var id= $(".P_id2").children("li:eq(0)").text()+";"; 
			for(b=0;b<l;b++)
			{
				ping  += $(".right-ul").children("li:eq("+b+")").text()+";";
				price += parseFloat($(".P_price li:eq("+b+")").text());
				id    += $(".P_id").children("li:eq("+b+")").text()+";";
			}
			/*拼接配置 与 计算价格*/
			ping += $(".right-ul2").children("li:eq(0)").text() +";"+$(".right-ul2").children("li:eq(1)").text()+";"+$(".right-ul2").children("li:eq(2)").text();
			/*乘以ip每个配置的价格*/
			var c = $(".P_id2").children("li:eq(0)").attr("data");
			var ipcut = parseFloat($(".P_price2").children("li:eq(0)").text()) - 1;
			var ipsum = parseFloat(c)*parseFloat(ipcut);
			price = parseFloat(price) + parseFloat(ipsum);
			var time = parseFloat($(".P_price2").children("li:eq(1)").text());
			/*基本价格与time不打勾,只能用之前设定好的价格到时候后台计算的是这个数据库对应的价格*/
			/*
			if(time == 1){
				
				var price2 = $(".P_base").children("li:eq(0)").text();
	        
			}
			else if(time == 2){
				
				var price2 = $(".P_base").children("li:eq(1)").text();
				
			}
			else if(time == 3){
				
				var price2 = $(".P_base").children("li:eq(1)").text();
				
			}
			else if(time == 6){
				
				var price2 = $(".P_base").children("li:eq(2)").text();
				
			}
			else if(time == 12){
				
				var price2 = $(".P_base").children("li:eq(3)").text();
				
			}
			else if(time == 24){
				
				var price2 = $(".P_base").children("li:eq(4)").text();
				
			}
			*/
			
			var price2 = $("#price").val();
			
			var num  = parseFloat($(".P_price2").children("li:eq(2)").text());
			var bb   = parseFloat(time)*parseFloat(num);
			var end  = parseFloat(bb)*parseFloat(price);
			
			var base = parseFloat(num)*parseFloat(price2)*parseFloat(time);
			var allprice = parseFloat(base) + parseFloat(end);
			
			/*赋值操作*/
			$("#config").attr("value",ping);
			$("#pay").attr("value",allprice.toFixed(2));
			$(".price-sty").text(end.toFixed(2));
			
			$(".base-price").text(base.toFixed(2));
			$(".all-price").text(allprice.toFixed(2));
			
			$(".M_pay").text(allprice.toFixed(2));
			$("#allprice").text(allprice.toFixed(2));
			
			$("#idlink").attr({"value":id});
			
			/*特殊操作，只针对硬件捆绑托管业务NC!!!!*/
			$("#willpay").text((parseFloat(allprice)+parseFloat($("#youku").text())).toFixed(2));
			
		})
	}
	
	
	function goods_cut()
	{  
		var num_val=document.getElementById('number');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		if(Num>1)Num=Num-1;  num_val.value=Num;  
	}
	
	function goods_add()
	{  
		var num_val=document.getElementById('number');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		Num=Num+1;  num_val.value=Num;  
	}
	
	function ip_cut(min)
	{  
		/*
		var num_val=document.getElementById('ip');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		if(Num> min )Num=Num-1;  num_val.value=Num;
		*/
		$(function(){
			var v = $(".ip").val();
			var v = parseFloat(v) - 1;
			if(v < min)
			{
				return false;
			}
			$(".ip").attr({"value":v});
		})
		
	}
	
	function ip_add(max)
	{  
		/*
		var num_val=document.getElementById('ip');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);
		if(Num < max)
		Num=Num+1;  num_val.value=Num;
		*/
		$(function(){
			var v = $(".ip").val();
			var v = parseFloat(v) + 1;
			if(v > max)
			{
				return false;
			}
			$(".ip").attr({"value":v});
		})
		
	}