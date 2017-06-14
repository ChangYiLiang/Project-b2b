requirejs(["core"],function (){
	var subscribe = MyApp.namespace("subscribe");
	
	var BasePath = $("#BasePath").val();
	
	subscribe.moreTag = function(){
		var state = $(".subscribe-head-2").css("display");
		if(state == "none"){
			$(".subscribe-head-2").css("display","block");
			$(".more-tag a").html("收起");
		}else{
			$(".subscribe-head-2").css("display","none");
			$(".more-tag a").html("更多订阅>>");
		}
	}
	
	var myTag = $(".subscribe-head").children("div.my-tag");
	myTag.each(function(){
		var myData = $(this).children("input").val();
		$(".tag-tag").each(function(){
			if(myData == $(this).children("input").val()){
				$(this).css({"background-image":"url("+BasePath+"/images/2buser/select.png)","border":"0px"});
			}
		});
	});
	
	$(".tag-tag").each(function(){
		$(this).click(function(){
			var state = $(this).css("background-image");
			//选择
			if(state == "none"){
				var myTag = $(".subscribe-head").children("div.my-tag");
				if(myTag.length<1){
					var div = $(".subscribe-head").children("div.title");
				}
				else{
					var div = $(".subscribe-head").children("div.my-tag").last();
				}
				if(myTag.length>=5){
					layer.alertEx({content: "最多能订阅五个标签", icon: "info"});
				  	return;
				}
				var tagName = $(this).children("span").html();
				var tagId = $(this).children("input").val();
				$.ajax({url:"addsubscribe.do",type:"POST",dataType:"JSON",data:{tagId:tagId},success:function(result){
					if(!result){
						layer.alertEx({content: "添加订阅失败", icon: "info"});
					}
				}});
				div.after("<div class='my-tag'><span>"+tagName+"</span><div class='operate'></div><input class='tagId' type='hidden' value='"+tagId+"'/></div>");
				$(this).css({"background-image":"url("+BasePath+"/images/2buser/select.png)","border":"0px"});
				//删除图标显示
				$(".my-tag").mouseenter(function(){
					$(this).children(".operate").css("display","block")
				});
				$(".my-tag").mouseleave(function(){
					$(this).children(".operate").css("display","none")
				});
				//删除标签
				$(".operate").each(function(){
					$(this).click(function(){
						var deleteTag = $(this).next("input").val();
						$(".tag-tag").each(function(){
							if(deleteTag == $(this).children("input").val()){
								$.ajax({url:"delsubscribe.do",type:"POST",dataType:"JSON",data:{tagId:deleteTag},success:function(result){
									if(!result){
										layer.alertEx({content: "删除订阅失败", icon: "info"});
									}
								}});
								$(this).css({"background-image":"none","border":"1px solid #999"});
							}
						});
						$(this).parent().remove();
					});
				});
			//取消	
			}else{
				var myTag = $(".subscribe-head").children("div.my-tag");
				var chooseTag = $(this).children("input").val();
				myTag.each(function(){
					var myData = $(this).children("input").val();
					if(myData == chooseTag){
						$(this).remove();
					}
				});
				$.ajax({url:"delsubscribe.do",type:"POST",dataType:"JSON",data:{tagId:chooseTag},success:function(result){
					if(!result){
						layer.alertEx({content: "删除订阅失败", icon: "info"});
					}
				}});
				$(this).css({"background-image":"none","border":"1px solid #999"});
			}
		});
	});
	
	$(".my-tag").each(function(){
		$(this).mouseenter(function(){
			$(this).children(".operate").css("display","block")
		});
		$(this).mouseleave(function(){
			$(this).children(".operate").css("display","none")
		});
	});
	//删除标签
	$(".operate").each(function(){
		$(this).click(function(){
			var deleteTag = $(this).next("input").val();
			$(".tag-tag").each(function(){
				if(deleteTag == $(this).children("input").val()){
					$.ajax({url:"delsubscribe.do",type:"POST",dataType:"JSON",data:{tagId:deleteTag},success:function(result){
						if(!result){
							layer.alertEx({content: "删除订阅失败", icon: "info"});
						}
					}});
					$(this).css({"background-image":"none","border":"1px solid #999"});
				}
			});
			$(this).parent().remove();
		});
	});
});
