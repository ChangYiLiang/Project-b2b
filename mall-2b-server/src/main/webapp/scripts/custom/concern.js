function cancelConcern(){
	var pageNo = $("#pageNo").val();
	var concernId = $("#concernId").val();
	/*$.post("cancelConcern.do",{pageNo:pageNo,concernId:concernId},function(){})*/
	window.href.location="cancelConcern.do?pageNo="+pageNo+"&concern="+concern;
}