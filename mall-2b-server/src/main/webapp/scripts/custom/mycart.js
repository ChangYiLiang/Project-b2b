
requirejs(["core"],function (){
	var cart = MyApp.namespace("cart");
	
	$("#checkAllBox").click(function(){
		if($("#checkAllBox").prop('checked')){
			$(".checkBox").each(function(){
				$(this).prop("checked",true);
				setTotalPrice();
				setCheckedCount();
			});
		}else{
			$(".checkBox").each(function(){
				$(this).prop("checked",false);
				setTotalPrice();
				setCheckedCount();
			});
		}
	});
	
	$(".checkBox").each(function(){
		$(this).change(function(){
			setTotalPrice();
			setCheckedCount();
		});
	});
	
	function setCheckedCount(){
		var count = 0;
		$(".checkBox").each(function(){
			if($(this).prop("checked")){
				count += 1;
			}
		});
		$("#checkedCount").html(count)
	}
	 
	 function setTotalPrice(){
		$("#cartAllPrice").html(function(){
			var price = 0;
			$(".checkBox").each(function(){
				if($(this).prop("checked")){
					price += Number($(this).parent().siblings(".checkedPrice").children().html());
				}
			})
			return price;
		});
	}
	
	function setAllPrice(){
		$(".allprice").each(function(){
			$(this).html(function(){
				var num = $(this).parent().prev().children("input").val();
				var price = $(this).parent().prev().prev().html();
				return Number(price)*parseInt(num);
			});
		});
	}
	
	$(".add").each(function(){
		$(this).click(function(){
			var num = $(this).prev().val();
			$(this).prev().val(parseInt(num)+1);
			setAllPrice();
			setTotalPrice();
			var data = {goodsNum: parseInt(num)+1,id: $(this).next().val()};
			$.ajax({url:"updatenum.do",data:data,dataType:"JSON",type:"POST",
			});
		});
	});
	
	$(".min").each(function(){
		$(this).click(function(){
			var num = $(this).next().val();
			if(parseInt(num) <= 1){
				return ;
			}
			$(this).next().val(parseInt(num)-1);
			setAllPrice();
			setTotalPrice();
			var data = {goodsNum: parseInt(num)-1,id: $(this).next().next().next().val()};
			$.ajax({url:"updatenum.do",data:data,dataType:"JSON",type:"POST",
			});
		});
	});
	
	
	cart.delete = function(data){
		var data = data.id;
		if(data == 0){
			var ids = "";
			$(".checkBox").each(function(){
				if($(this).prop("checked")){
					ids += $(this).val()+",";
				}
			});
			if(ids != ""){
				$("#tempData1").val(ids);
			}else{
				layer.alertEx({content: "请选择您要删除的商品！",icon: "info"});
				return;
			}
		}else{
			$("#tempData").val(data);
		}
		layer.confirmEx({content: "确定删除该商品！", icon: "question", yes: function () {
			var id = $("#tempData").val();
			if(id == ""||id == null){
				var data = {ids:$("#tempData1").val() };
			}else{
				var data = {id:$("#tempData").val() };
			}
			var url = "deletemycart.do";
			$.ajax({url:url,data:data,type:"POST",dataType:"JSON",
				success: function(result){
					if(result){
						layer.alertEx({content: "删除成功！", end: function () {
							window.location.href="mycart.do";
						}});
					}else{
						layer.alertEx({content: "删除失败！", end: function () {
							window.location.href="mycart.do";
						}});
					}
				}
			});
			
		}});	
	}
	
	cart.paycart = function(){
		var ids = "";
		$(".checkBox").each(function(){
			if($(this).prop("checked")){
				ids += $(this).val()+",";
			}
		})
		if(ids != ""){
			var data = {ids:ids};
			$.ajax({url:"updatecart.do",data:data,type:"POST",dataType:"JSON",
				success:function(result){
					if(result){
						window.location.href="paycart.do";
					}else{
						layer.alertEx({content: "提交失败!",icon: "info"});
					}
				}
			});
		}else{
			layer.alertEx({content: "请选择您要提交的商品！",icon: "info"});
		}
	}
	
});