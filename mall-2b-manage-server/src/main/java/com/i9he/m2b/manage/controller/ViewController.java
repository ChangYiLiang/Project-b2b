package com.i9he.m2b.manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.i9he.m2b.manage.biz.ICommentService;
import com.i9he.m2b.manage.biz.IConcernService;
import com.i9he.m2b.manage.biz.IGoodsService;
import com.i9he.m2b.manage.biz.IUserCensusService;
import com.i9he.m2b.model.AfterSaleViewModel;
import com.i9he.m2b.model.CommentViewModel;
import com.i9he.m2b.model.GoodsAllRank;
import com.i9he.m2b.model.GoodsRank;
import com.i9he.m2b.model.GoodsSellViewModel;
import com.i9he.m2b.model.InterestedModel;
import com.i9he.m2b.model.OrderSalesVolume;
import com.i9he.m2b.model.UserNumber;
import com.i9he.m2b.model.UserRegisterNumber;
import com.i9he.m2b.model.UserToGrAndQy;
import com.i9he.privilege.api.IPrivilegeBaseApiService;
@Controller
@RequestMapping("/controller/view")
public class ViewController {
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IConcernService concernService;
	@Autowired
	private ICommentService commentService;
	@Autowired
	private IUserCensusService userCensusService;
	
	@RequestMapping("/userNumberView")
	public String userNumberView(){
		return "view/userNumberView.ftl";
	}
	@ResponseBody
	@RequestMapping(value="userNumberData",produces = "text/plain;charset=UTF-8")
	public String userNumberData(){
		List<UserNumber> list = userCensusService.getUserNumber();
		return JSON.toJSONString(list);
	}
	@RequestMapping("/userRegisterNumber")
	public String userRegisterNumber(){
		return "view/userRegisterNumber.ftl";
	}
	@ResponseBody
	@RequestMapping("/userRegisterNumberData")
	public String userRegisterNumberData(){
		UserRegisterNumber userRegisterNumber = userCensusService.getUserRegisterNumber();
		return JSON.toJSONString(userRegisterNumber);
	}
	@RequestMapping("/userToGrAndQyView")
	public String userToGrAndQyView(){
		return "view/userToGrAndQyView.ftl";
	}
	@ResponseBody
	@RequestMapping("/userToGrAndQyViewData")
	public String   userToGrAndQyViewData(){
		UserToGrAndQy userToGrAndQy =  userCensusService.getUserToGrAndQy();
		return JSON.toJSONString(userToGrAndQy);
	}
	@RequestMapping("/orderNumber")
	public String orderNumber(){
		return "view/orderNumber.ftl";
	}

	@ResponseBody
	@RequestMapping("/orderNumberData")
	public String orderNumberData() {
		List<OrderSalesVolume> orderSalesVolume = goodsService.getOrderSalesVolume();
		return JSON.toJSONString(orderSalesVolume);
	}
	@RequestMapping("/goodsRank")
	public String goodsRank(){
		return "view/goodsRank.ftl";
	}
	@ResponseBody
	@RequestMapping(value="goodsRankByM",produces = "text/plain;charset=UTF-8")
	public String goodsRankByM(){
		List<GoodsRank> listGoodsRank = goodsService.getGoodsRankByM();
		return JSON.toJSONString(listGoodsRank);
	}
	@ResponseBody
	@RequestMapping(value="goodsRankByQ",produces = "text/plain;charset=UTF-8")
	public String goodsRankByQ(){
		List<GoodsRank> listGoodsRank = goodsService.getGoodsRankByQ();
		return JSON.toJSONString(listGoodsRank);
	}
	@ResponseBody
	@RequestMapping(value="goodsRankByY",produces = "text/plain;charset=UTF-8")
	public String goodsRankByY(){
		List<GoodsRank> listGoodsRank = goodsService.getGoodsRankByY();
		return JSON.toJSONString(listGoodsRank);
	}
	@RequestMapping("/interestedView")
	public String InterestedView(){
		return "view/InterestedView.ftl";
	}
	@ResponseBody
	@RequestMapping(value="interestedViewData",produces = "text/plain;charset=UTF-8")
	public String InterestedViewData(){
		List<InterestedModel> list =  concernService.getInterestedModel();
		return JSON.toJSONString(list);
	}
	@ResponseBody
	@RequestMapping(value="commentViewData",produces = "text/plain;charset=UTF-8")
	public String commentViewData(){
		List<CommentViewModel> list = commentService.getCommentRankData();
		return JSON.toJSONString(list);
	}
	@RequestMapping("/commentView")
	public String commentView(){
		return "view/commentView.ftl";
	}
	@RequestMapping("/afterSaleView")
	public String afterSaleView(){
		return "view/afterSaleView.ftl";
	}
	@ResponseBody
	@RequestMapping(value="afterSaleViewData",produces="text/plain;charset=UTF-8")
	public String afterSaleViewDate(){
		List<AfterSaleViewModel> list =commentService.getListViewModel();
		return JSON.toJSONString(list);
	}
	@RequestMapping("/goodsSellView")
	public String goodsSellViewModel(){
		return "view/goodsSellView.ftl";
	}
	@ResponseBody
	@RequestMapping(value="goodsSellViewData",produces="text/plain;charset=UTF-8")
	public String goodsSellViewModelData(){
		List<GoodsSellViewModel> list = goodsService.getListGoodsSell();
		return JSON.toJSONString(list);
	}
	@RequestMapping("/goodsAllRankView")
	public String goodsAllRankView(){
		return "view/goodsAllRankView.ftl";
	}
	@ResponseBody
	@RequestMapping(value="goodsAllRankViewData",produces="text/plain;charset=UTF-8")
	public String goodsAllRankViewData(){
		List<GoodsAllRank> list = goodsService.getGoodsAllRank();
		return JSON.toJSONString(list);
	}
	
	
}
