	/*载入操作*/
	$(function(){
		$(".bog-left").ready(function(){
			var l = $(".ul-left").children("li").length;
			var ul_left = "ul-left";
			for(a=0;a<l;a++)
			{
				ul_left = "ul-left" + a;
				$("."+ul_left).children("li:eq(0)").click();
			}
			$(".ul-win").children("li:eq(0)").click();
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
			$("."+ul_left).children("li").click(function()
			{
				/*i获取左边当前索引与右边配置栏索引一致*/
				var i = $(this).parent().parent().index();
				/*当前所在索引的值*/
				var ii= $(this).index();
				var p = $(this).parent().prev(".left-p").text();
				var t = $(this).children("button").text();
				var v = $(this).children("button")[0].value;
				/*dom操作*/
				$(".right-ul").children("li:eq("+i+")").text(p+t);
				$(".P_price").children("li:eq("+i+")").text(v);
				/*css操作*/
				$(this).parent().children("li:eq("+ii+")").children("button").addClass("btn-success");
				$(this).parent().children("li:gt("+ii+")").children("button").removeClass("btn-success");
				$(this).parent().children("li:lt("+ii+")").children("button").removeClass("btn-success");
				getAll();
			})
		}
	})
	/*下面操作*/
	$(function(){
		$(".ul-win li").click(function(){
			var t = $(this).children("select").find("option:selected").text();
			var p = $(this).parent().prev().text();
			var v = $(this).children("select").find("option:selected").val();
			$(".P_price2").children("li:eq(0)").text(v);
			$(".right-ul2").children("li:eq(0)").text(p+t);
			getAll();
		})
		$(".ul-time li").click(function(){
			var ii= $(this).index();
			var t = $(this).children("button").text();
			var p = $(this).parent().prev().text();
			var v = $(this).children("button")[0].value;
			
			$(this).parent().children("li:eq("+ii+")").children("button").addClass("btn-success");
			$(this).parent().children("li:gt("+ii+")").children("button").removeClass("btn-success");
			$(this).parent().children("li:lt("+ii+")").children("button").removeClass("btn-success");
			
			$("#orderCycle").attr("value",v);
			$(".P_price2").children("li:eq(1)").text(v);
			$(".right-ul2").children("li:eq(1)").text(p+t);
			getAll();
		})
		$("#left-cut").click(function(){
			var n = $("#number").val();
			var p = $(this).parent().parent().prev().text();
			$(".P_price2").children("li:eq(2)").text(n);
			$(".right-ul2").children("li:eq(2)").text(p+n);
			getAll();
		})
		$("#right-add").click(function(){
			var n = $("#number").val();
			var p = $(this).parent().parent().prev().text();
			$(".P_price2").children("li:eq(2)").text(n);
			$(".right-ul2").children("li:eq(2)").text(p+n);
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
			for(b=0;b<l;b++)
			{
				ping  += $(".right-ul").children("li:eq("+b+")").text()+";";
				price += parseFloat($(".P_price li:eq("+b+")").text());
			}
			/*拼接配置 与 计算价格*/
			ping += $(".right-ul2").children("li:eq(0)").text() +";"+$(".right-ul2").children("li:eq(1)").text()+";"+$(".right-ul2").children("li:eq(2)").text();
			price = parseFloat(price) + parseFloat($(".P_price2").children("li:eq(0)").text());
			var time = parseFloat($(".P_price2").children("li:eq(1)").text());
			var num  = parseFloat($(".P_price2").children("li:eq(2)").text());
			var bb   = parseFloat(time)*parseFloat(num);
			var end  = parseFloat(bb)*parseFloat(price);
			/*赋值操作*/
			$("#config").attr("value",ping);
			$("#pay").attr("value",end);
			$(".price-sty").text(end.toFixed(2));
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
		if(Num<100)Num=Num+1;  num_val.value=Num;  
	}