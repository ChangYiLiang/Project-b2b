function submit1(){
	layer.confirmEx({content: "确认信息填写正确?", icon: "question", yes: function (index) {
		$("#qyfm").submit();
		layer.close(index);
	}})
}
function submit2(){
	layer.confirmEx({content: "确认信息填写正确?", icon: "question", yes: function (index) {
		$("#grfm").submit();
		layer.close(index);
	}})
}