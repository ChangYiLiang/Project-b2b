	
	$(function(){
		$(".P_box0 li").ready(function(){
			var l = $(".P_box0 li").length;
			for(i=0;i<l;i++)
			{
				$(".P_box0 li:eq("+i+")").click();
			}
		})
		$(".P_control li").ready(function(){
			$(".P_control li:eq(0)").click();
		})
	})

	$(function(){
		var a= 0;
		var P_box= "P_box"+a;
		$("."+P_box).children("li").click(function()
		{
			var i = $(this).index();
			var s = $(this).children("span").text();
			var t = $(this).children("select").find("option:selected").text();
			var v = $(this).children("select").find("option:selected").val();
			var d = $(this).children("select").find("option:selected").attr("id");
			$(".P_link li:eq("+i+")").text(s+t);
			$(".P_price li:eq("+i+")").text(v);
			$(".P_id li:eq("+i+")").text(d);
			getAll();
		})
		
		$("#left-cut").click(function(){
			var n = $("#num").val();
			$("#number").attr("value",n);
			getAll();
		
		})
		$("#right-add").click(function(){
			var n = $("#num").val();
			$("#number").attr("value",n);
			getAll();
		})
	})

	function getAll()
	{
		$(function()
		{
			var gp    = $("#price").val();
			var ping  = $("#P_other").text()+";";
			var price = 0;
			var id    = '';
			var l = $(".P_box0 li").length;
			for(b=0;b<l;b++)
			{
				ping  += $(".P_link li:eq("+b+")").text()+";";
				price += parseFloat($(".P_price li:eq("+b+")").text());
				id    += $(".P_id li:eq("+b+")").text()+";";
			}	
			var sum = (parseFloat(gp)+parseFloat(price))*parseFloat($("#number").val());
			//$(".M_pay").text(price.toFixed(2));
			$(".M_pay").text(sum.toFixed(2));
			$("#config").attr("value",ping);
			$("#pay").attr("value",sum);
			$("#id").attr("value",id);
			$("#allprice").text(parseFloat($("#pay").val()).toFixed(2));
		})
	}
	
	function goods_cut()
	{  
		var num_val=document.getElementById('num');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		if(Num>1)Num=Num-1;  num_val.value=Num;  
	}
	
	function goods_add()
	{  
		var num_val=document.getElementById('num');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		Num=Num+1;  num_val.value=Num;  
	}
	
	function goodscut()
	{  
		var num_val=document.getElementById('number');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		if(Num>1)Num=Num-1;  num_val.value=Num;
		
		$(function(){
			var g = $(".C").text();
			var s = parseFloat(g)*parseFloat(Num);
			$("#ChaCha").text(s);
			$("#pay").val(s);
		})
		
	}
	
	function goodsadd()
	{  
		var num_val=document.getElementById('number');  
		var new_num=num_val.value;  
		var Num = parseInt(new_num);  
		Num=Num+1;  num_val.value=Num;
		
		$(function(){
			var g = $(".C").text();
			var s = parseFloat(g)*parseFloat(Num);
			$("#ChaCha").text(s);
			$("#pay").val(s);
		})
		
	}
	
	$(function(){
        breathLoop7(5000);
        $('.nb_jieshao').show();
        $('.s_rb').show();
       $('.zuobtn').click(function(){
           $('.saituul').animate({left:"-220px"});
       })
       $('.youbtn').click(function(){
           $('.saituul').animate({left:"0px"});
       })
       $('.huifu').click(function(){
           $(this).siblings('.kuangj').show();
       })
       $('.daohul li').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
           $('.nb_ce').children("div").eq($(this).index()).show().siblings().hide();
       })
       $('.s_rt span').eq(0).click(function(){
           $(this).addClass('current').siblings().removeClass('current');
           $('.s_rb').show().siblings('.s_rb2').hide();
       })
       $('.s_rt span').eq(1).click(function(){
           $(this).addClass('current').siblings().removeClass('current');
           $('.s_rb2').show().siblings('.s_rb').hide();
       })
       $('.s_rb2 input,.s_rb input').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
       })
       $('.baoz_r div').hover(function(){
           $('.tuihuang7 div').eq($(this).index()).show().siblings().hide();
       },function(){
           $('.tuihuang7 div').hide();
       });
       $('.diqu_r input').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
       })
       $('.xinghao input').click(function(){
           $(this).addClass('current').siblings().removeClass('current');
       })
    })
	
