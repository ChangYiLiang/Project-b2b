<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/tags.js"></script>
	<script>
		$("#myTab").on("shown.bs.tab", function(e) {
			$($(e.target).attr("href")).find("table").dataTable().fnDraw();
		})
	</script>
</#macro>

<@layout title="${tag.name!''} - 商品映射">
	<div class="col-md-2">
		<!-- Nav tabs -->
		<ul class="nav nav-pills nav-stacked" role="tablist" id="myTab">
		  <li role="presentation" class="active"><a href="#goodsList" role="tab" data-toggle="tab">商品列表</a></li>
		  <li role="presentation"><a href="#addGoods" role="tab" data-toggle="tab">添加商品</a></li>
		  <#if tag.type==0>
		  <li role="presentation"><a href="#articleList" role="tab" data-toggle="tab">文章列表</a></li>
		  <li role="presentation"><a href="#addArticle" role="tab" data-toggle="tab">添加文章</a></li>
		  </#if>
		</ul>
	</div>
	<div class="col-md-9">
		<!-- Tab panes -->
		<div class="tab-content">
		  <div role="tabpanel" class="tab-pane active" id="goodsList">
		  		<div class="text-right">
					<form class="form-inline" role="form">
						<!--
						<input type="hidden" name="type" value="0" />
						-->
						<input type="hidden" name="tagId" value="${tag.id}" />
						<div class="form-group">
							<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
						</div>
					  	<button type="submit" class="btn btn-primary">查找</button>
					</form>
				</div>
		  		<table class="table table-striped table-bordered table-hover" data-table-ajax-source="mappings.do" data-table-search-form="#goodsList form">
					<tr class="columns" style="display: none">
						<th data-width="80px">
							<span data-table-title="true">
								<label><input type='checkbox' onclick='MyApp.Tags.Mappings.updateCheckBoxs("#goodsList [name=id]", this.checked)' /></label>
								<a onclick="return MyApp.Tags.Mappings.batchRemove(this, '#goodsList')" href="del_mapping.do?tagId=${tag.id}">移除</a>
							</span>
							<input name="id" type="checkbox" value="{{id}}"  />
						</th>
						<th data-title="商品标识" data-prop="targetId"/>
						<th data-title="商品名称" data-prop="goodsName" />
						<th data-title="商品价格" data-prop="goodsPrice" />
						<th data-title="创建时间" data-template="createTime" />
						<th data-title="操作" data-width="200px">
							<a onclick="return MyApp.Tags.Mappings.remove(this)" href="del_mapping.do?tagId=${tag.id}&id={{id}}">移除</a>
						</th>
					</tr>
				</table>
		  </div>
		  
		  <div role="tabpanel" class="tab-pane" id="addGoods">
		  		<div class="text-right" id="addGoodsForm">
					<form class="form-inline" role="form">
						<input type="hidden" name="ifIdc" value="0" />
						<div class="form-group">
							<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
						</div>
					  	<button type="submit" class="btn btn-primary">查找</button>
					</form>
				</div>
				<table class="table table-striped table-bordered table-hover" data-table-ajax-source="../goods/goodslist.do" data-table-search-form="#addGoods form">
					<tr class="columns" style="display: none">
						<th data-width="80px">
							<span data-table-title="true">
								<label><input type='checkbox' onclick='MyApp.Tags.Mappings.updateCheckBoxs("#addGoods [name=targetId]", this.checked)' /> </label>
								<a href="create_mapping.do?tagId=${tag.id}&type=0" onclick="return MyApp.Tags.Mappings.batchCreate(this, '#addGoods')">添加</a>
							</span>
							<input type="checkbox" value="{{id}}" name="targetId" />
						</th>
						<th data-title="商品标识" data-prop="id"/>
						<th data-title="商品名称" data-prop="goodsName" />
						<th data-title="商品价格" data-prop="goodsPrice" />
						<th data-title="操作" data-width="200px">
							<a onclick="return MyApp.Tags.Mappings.create(this)" href="create_mapping.do?tagId=${tag.id}&type=0&targetId={{id}}">添加</a>
						</th>
					</tr>
				</table>
		  </div>
		  
		  <#if tag.type==0>
		  <div role="tabpanel" class="tab-pane" id="articleList">
		  		<div class="text-right">
					<form class="form-inline" role="form">
						<input type="hidden" name="type" value="1" />
						<input type="hidden" name="tagId" value="${tag.id}" />
						<div class="form-group">
							<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
						</div>
					  	<button type="submit" class="btn btn-primary">查找</button>
					</form>
				</div>
		  		<table class="table table-striped table-bordered table-hover" data-table-ajax-source="mappings.do" data-table-search-form="#articleList form">
					<tr class="columns" style="display: none">
						<th data-width="80px">
							<span data-table-title="true">
								<label><input type='checkbox' onclick='MyApp.Tags.Mappings.updateCheckBoxs("#articleList [name=targetId]", this.checked)' /> 全选</label>
							</span>
							<input name="targetId" type="checkbox" value="{{targetId}}"  />
						</th>
						<th data-title="文章标识" data-prop="targetId"/>
						<th data-title="文章标题" data-prop="name" data-default="1" />
						<th data-title="创建时间" data-template="createTime" />
						<th data-title="操作" data-width="200px">
							<a href="#">添加</a>
						</th>
					</tr>
				</table>
		  </div>
		  
		  <div role="tabpanel" class="tab-pane" id="addArticle">
		  		<div class="text-right">
					<form class="form-inline" role="form">
						<div class="form-group">
							<input type="text" class="form-control" id="keyword" name="keyword" placeholder="关键字">
						</div>
					  	<button type="submit" class="btn btn-primary">查找</button>
					</form>
				</div>
		  </div>
		  </#if>
		</div>
	</div>
</@layout>