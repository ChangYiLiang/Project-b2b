var CommentHelper = function(){
	
	
	
	return{
		init:function(){
		},
		deleteComment:function(){
			var url = "deleteComment.do";
			var data = {
				"id" : $("#commentId").val()	
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("删除成功");
					window.location.href="list.do";
				} else {
					alert("删除失败");
					return ;			
				}
			});
		}
	}
}();
