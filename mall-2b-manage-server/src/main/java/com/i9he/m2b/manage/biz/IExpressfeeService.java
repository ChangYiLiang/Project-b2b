package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.manage.model.TemplatePageModel;
import com.i9he.m2b.model.ExpressfeeTemplate;
import com.i9he.m2b.model.ExpressfeeTemplateEX;
import com.i9he.m2b.model.search.ExpressfeeTemplateSearchModel;

public interface IExpressfeeService {

	/***
	 * 将页面数据格式化
	 * @param template
	 * @return
	 * @throws I9heException 
	 */
	public ExpressfeeTemplateEX formatTemplate(ExpressfeeTemplateEX template) throws I9heException;

	/***
	 * 保存运费模板数据
	 * @param newTemplate
	 * @return
	 * @throws I9heException 
	 */
	public int addTemplate(ExpressfeeTemplateEX newTemplate) throws I9heException;

	/***
	 * 获取所有运费模板
	 * @param searchModel
	 * @return
	 */
	public List<ExpressfeeTemplateEX> getTemplateList(ExpressfeeTemplateSearchModel searchModel);

	public TemplatePageModel getPageModel(ExpressfeeTemplateSearchModel searchModel);

	/***
	 * 根据模板ID获取模板
	 * @param templateId
	 * @return
	 */
	public ExpressfeeTemplateEX getTemplateById(Integer templateId);

	/***
	 * 修改运费模板
	 * @param newTemplate
	 * @return
	 */
	public int modifyTemplate(ExpressfeeTemplateEX newTemplate);

	public int deleteTemplate(Integer templateId);

	/***
	 * 停用 模板
	 * @param templateId
	 * @return
	 */
	public int disableTemplate(Integer templateId);

	/***
	 * 使用模板
	 * @param templateId
	 * @return
	 */
	public int enableTemplate(Integer templateId);

	/***
	 * 获取运费模板
	 * @param searchModel
	 * @return
	 */
	public List<ExpressfeeTemplate> getTemplate(ExpressfeeTemplateSearchModel searchModel);

	/**
	 * 获取所有的快递公司名
	 * @return
	 */
	public List<String> getAllExpressName();

	/**
	 * 绑定运费模板
	 * @param goodsId
	 * @param templateId
	 * @return
	 */
	public int bindExpressfee(Integer goodsId, Integer templateId);

	/***
	 * 根据商品id获取运费模板
	 * @return
	 */
	public ExpressfeeTemplateEX getTemplateBygoodsId(Integer goodsId);

	/***
	 * 解除商品与运费模板的绑定
	 * @param goodsId
	 * @return
	 */
	public int removeBind(Integer goodsId);

}
