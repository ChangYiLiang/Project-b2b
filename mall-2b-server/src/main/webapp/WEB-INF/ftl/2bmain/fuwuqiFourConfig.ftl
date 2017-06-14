<style>
.r230_dinggou{min-height: 720px !important}
.ban-fuwuqi img {
    width: 100%;
    height: 100%;
}
.left-p {
	float:left;font-size:12px;
	color:#666 !important;
	width:80px;
	text-align:right;
	margin-right:10px;
}
.left-p2 {
	width:400px;
	text-align:left;
	color:#dd143c !important;
	font-size:20px !important;
	margin-top:12px;
}
.ul-left{float:left;width:600px;height:auto;margin-bottom:10px !important}
.ul-left > li{float:left;width:600px;}
.ul-left > li > ul{width:500px;float:left;height:auto}
.ul-left > li > ul > li{float:left;}
.btn {
	background-color:white;
	margin-right:10px;
	padding-left:10px;
	padding-right:10px;
	height:32px;
	margin-bottom:10px;
	border:1px solid #666;
	margin-top:10px;	
}

.btn-click {
	color:white;
	border:1px solid #1c9d98;
	background-color:#1c9d98;
}

.btn-click2 {
	color:#1c9d98!important;
	background-color:white !important;
	border-color:#1c9d98!important;
	background:url(${BasePath}/images/2bmain/right.jpg) no-repeat right bottom;
}

.gw_num{border: 1px solid #666;width: 110px;line-height: 26px;overflow: hidden;position:relative;top:12px}
.gw_num em{display: block;height: 26px;width: 26px;float: left;color: #7A7979;border-right: 1px solid #666;text-align: center;cursor: pointer;}
.gw_num .num{display: block;float: left;text-align: center;width: 52px;font-style: normal;font-size: 14px;line-height: 24px;border: 0;}
.gw_num em.add{float: right;border-right: 0;border-left: 1px solid #666;}

.buy-way{font-size:12px;}

</style>

<script>

	$(function(){
		$(".ul-fuwuqi").ready(function(){
			var l = $(".ul-left").children("li").length;
			var ul_left = "ul-left";
			for(a=0;a<l;a++)
			{
				ul_left = "ul-left" + a;
				$("."+ul_left).children("li:eq(0)").children("button").click();
			}
		})
	})

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
				var t = $(this).text();
				var v = $(this).val();
				var d = $(this).attr("id");
				/*dom操作*/
				$(".P_price").children("li:eq("+i+")").text(v);
				$(".P_id").children("li:eq("+i+")").text(d);
				/*css操作*/
				if(i!=2){
					$(this).parent().parent().children("li:eq("+ii+")").children("button").addClass("btn-click");
					$(this).parent().parent().children("li:gt("+ii+")").children("button").removeClass("btn-click");
					$(this).parent().parent().children("li:lt("+ii+")").children("button").removeClass("btn-click");
				}else{
					$(this).parent().parent().children("li:eq("+ii+")").children("button").addClass("btn-click2");
					$(this).parent().parent().children("li:gt("+ii+")").children("button").removeClass("btn-click2");
					$(this).parent().parent().children("li:lt("+ii+")").children("button").removeClass("btn-click2");
				}
				getAll();
			})
		}
	})


	function getAll()
	{
		$(function()
		{
			var price = 0;
			var l  = $(".ul-left").children("li").length;
			var id = '';
			var num= $("#number").val();
			for(b=0;b<l;b++)
			{
				price += parseFloat($(".P_price li:eq("+b+")").text());
				id    += $(".P_id").children("li:eq("+b+")").text()+";";
			}
			/*拼接配置 与 计算价格*/
			var end  = (parseFloat(price)+parseFloat($("#price").val()))*num;
			/*赋值操作*/
			$("#pay").attr("value",end);
			$("#allprice").text(end.toFixed(2));
			$("#id").attr("value",id);
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
	
</script>