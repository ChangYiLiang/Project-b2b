requirejs(["core"],function (){
	var cart = MyApp.namespace("comment");
	
	var BasePath = $("#BasePath").val();
	
	$(".star-1").each(function(){
		$(this).click(function(){
			$(this).attr("src",BasePath+"/images/comment/u176.png");
			$(this).parent().children(":eq(1),:eq(2),:eq(3),:eq(4)").attr("src",BasePath+"/images/comment/u174.png");
			$(this).parent().next().val(1);
		});
	});
	$(".star-2").each(function(){
		$(this).click(function(){
			$(this).parent().children(":eq(0),:eq(1)").attr("src",BasePath+"/images/comment/u176.png");
			$(this).parent().children(":eq(2),:eq(3),:eq(4)").attr("src",BasePath+"/images/comment/u174.png");
			$(this).parent().next().val(2);
		});
	});
	$(".star-3").each(function(){
		$(this).click(function(){
			$(this).parent().children(":eq(0),:eq(1),:eq(2)").attr("src",BasePath+"/images/comment/u176.png");
			$(this).parent().children(":eq(3),:eq(4)").attr("src",BasePath+"/images/comment/u174.png");
			$(this).parent().next().val(3);
		});
	});
	$(".star-4").each(function(){
		$(this).click(function(){
			$(this).parent().children(":eq(0),:eq(1),:eq(2),:eq(3)").attr("src",BasePath+"/images/comment/u176.png");
			$(this).parent().children(":eq(4)").attr("src",BasePath+"/images/comment/u174.png");
			$(this).parent().next().val(4);
		});
	});
	$(".star-5").each(function(){
		$(this).click(function(){
			$(this).parent().children().attr("src",BasePath+"/images/comment/u176.png");
			$(this).parent().next().val(5);
		});
	});
	
	$(".overallComment-1").each(function(){
		$(this).click(function(){
			$(this).css({"background-image":"url("+BasePath+"/images/comment/overallComment.png)","border":"0px"});
			$(this).parent().children(":eq(1),:eq(2)").css({"background-image":"none","border":"1px solid #999"});
			$(this).siblings().last().val(2);
		});
	});
	$(".overallComment-2").each(function(){
		$(this).click(function(){
			$(this).css({"background-image":"url("+BasePath+"/images/comment/overallComment.png)","border":"0px"});
			$(this).parent().children(":eq(0),:eq(2)").css({"background-image":"none","border":"1px solid #999"});
			$(this).siblings().last().val(1);
		});
	});
	$(".overallComment-3").each(function(){
		$(this).click(function(){
			$(this).css({"background-image":"url("+BasePath+"/images/comment/overallComment.png)","border":"0px"});
			$(this).parent().children(":eq(0),:eq(1)").css({"background-image":"none","border":"1px solid #999"});
			$(this).siblings().last().val(0);
		});
	});
	$(".upload-button").each(function(){
		$(this).click(function(){
			$(this).next().val("1");//设置上传状态"1"为正在上传
			var div = $(this);
			$("#uploadfile").click();
			$("#uploadfile").unbind().change(function(){
				change(this,div);
			});
			});
		});
	
			function del(p){
				$(p).closest('.ppt').prev().remove();
				$(p).closest('.ppt').remove();
				var count = 0;
				$(this).parent().siblings().each(function(){count++});
				var count1 = 6-count;
				$("#pht").html('共'+count+'张，还能上传'+count1+'张');
				
			}
			
			function modify(p){
				$(p).closest('.ppt').prev().remove();
				$(p).closest('.ppt').remove();
				document.getElementById('uploadfile').click();
				var count = 0;
				$(".showPhoto").each(function(){count++});
				var count1 = 5-count;
				$("#pht").html('共'+count+'张，还能上传'+count1+'张');
			} 
			function change(file,div){
//				 <#--已经上传图片-->
				 var pcount = div.siblings("div").filter(".ppt").length;;
//				 <#--选择图片-->
				 var fileCount=0;
				 if (file.files && file.files[0]) {
				    fileCount = file.files.length;
				  }
//				  <#--剩余可传图片-->
				  var padd = 5-pcount;
				  if(fileCount>padd){
				    if(padd>0){
				    	layer.alertEx({content: '你最多还能选择'+padd+'张图片!',icon: "info"});
				    }else{
				    	layer.alertEx({content: '你不能上传图片了',icon: "info"});
				    }
				    div.next().val("0");
				  	return;
				  }
				  $("#uploadform").submit();
			}
		
	
	
	$(".comment-submit-btn").each(function(){
		$(this).click(function(){
			$(this).prop("disabled",true);
			var from = $(this).closest('form');
			var data = from.serializeJson();
			$.ajax({url:"comment.do",data:{comment:data},type:"POST",
				success:function(result){
					if(result){
						layer.alertEx({content: '评价成功！',end:function(){
							window.location.href="uncommentlist.do";
						}});
					}else{
						layer.alertEx({content: '评价失败！', icon: "info",end:function(){
							window.location.reload();
						}});
					}
				}
			});
			
		});
	});
	
	//赠送节操币显示
	$(".commentList-imgbox").each(function(){
		$(this).closest($(".commont-div")).find(".add-bonus span").html("+10");
	});
	
	//js获取BasePath
//	function getBasePath() {
//		var location = (window.location+'').split('/');
//		var basePath = location[0]+'//'+location[2]+'/'+location[3];
//		return basePath;
//	}
	
	//json序列化
	(function($){
        $.fn.serializeJson = function(){
            var jsonData1 = {};
            var serializeArray = this.serializeArray();
            // 先转换成{"id": ["12","14"], "name": ["aaa","bbb"], "pwd":["pwd1","pwd2"]}这种形式
            $(serializeArray).each(function () {
                if (jsonData1[this.name]) {
                    if ($.isArray(jsonData1[this.name])) {
                        jsonData1[this.name].push(this.value);
                    } else {
                        jsonData1[this.name] = [jsonData1[this.name], this.value];
                    }
                } else {
                    jsonData1[this.name] = this.value;
                }
            });
            // 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name": "bb", "pwd":"pwd2"}]的形式
            var vCount = 0;
            // 计算json内部的数组最大长度
            for(var item in jsonData1){
                var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length : 1;
                vCount = (tmp > vCount) ? tmp : vCount;
            }

            if(vCount > 1) {
                var jsonData2 = new Array();
                for(var i = 0; i < vCount; i++){
                    var jsonObj = {};
                    for(var item in jsonData1) {
                        jsonObj[item] = jsonData1[item][i];
                    }
                    jsonData2.push(jsonObj);
                }
                return JSON.stringify(jsonData2);
            }else{
                return "[" + JSON.stringify(jsonData1) + "]";
            }
        };
    })(jQuery);
});
