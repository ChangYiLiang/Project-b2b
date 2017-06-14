<style>
	.modal {
		width: 700px;
		height: 400px;
	}
</style>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">回复评论</h4>
</div>
<div class="modal-body">
	<div class="row">
						<div class="form-group col-md-6">
							<label class="control-label col-md-4">商品名称:</label>
							<div class="col-md-8">
								<span class="form-control-static">${good.goodsName!''}</span>
							</div>
						</div>
					</div>
					<form action="replyComment.do" id="replyComment_from" class="form-horizontal" method="post">
					<input type="hidden" name="page" value="${page!''}">
					<input type="hidden" name="id" value="${id!''}">
					<h4>回复:</h4>
					<div id="show"></div>
					<div class="row">
						<div class="form-group">
							<div class="col-md-10">
								<textarea id="replyContent" name="replyContent" class="form-control" style="height:100px;margin-left:10px" placeholder="回复买家的评论"></textarea>
							</div>
						</div>
					</div>
					<div class="form-controls">
							<div class="col-md-offset-1">
								<div class="row">
									<div class="form-group col-md-5">
										<input type="submit" class="btn btn-success btn-block" value="提交">
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-5">
										<a href="${BasePath}/controller/comment/list.do?pageNo=${page}" class="btn btn-success btn-block">返回</a>
									</div>
								</div>
							</div>
						</div>
						</form>		
</div>






