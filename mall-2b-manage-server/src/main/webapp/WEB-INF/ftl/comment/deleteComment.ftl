<style>
	.modal {
		left:800px;
		width: 300px;
		height: 200px;
	}
</style>

<div class="modal-header">
	<input type="hidden" id="commentId" value="${id}">
	<h4 class="modal-title" style="text-align: center;">确定删除该评论！</h4>
</div>
<div class="modal-body">
	</br>
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<button class="btn btn-primary" onclick="CommentHelper.deleteComment();">确定</button>
		</div>
		<div class="col-md-4">
			<#-- <button class="btn btn-primary" onclick="history.go(-1);">取消</button> -->
			<a class="btn btn-primary" href="${BasePath}/controller/comment/list.do?pageNo=1">取消</a>
		</div>
	</div>
	

</div>






