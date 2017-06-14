package com.i9he.m2b.util;

public class ConstantUtil {

	public static final Integer ZERO = 0;

	public static final String Fail = "fail";

	public static final String Success = "success";

	public static final String Exists = "exists";

	public static final String EmptyJsonObject = "{}";

	public static final String DefaultMd5Password = "63a9f0ea7bb98050796b649e85481845"; // root

	public static final String AJAX_TRUE = "true";
	public static final String AJAX_FALSE = "false";

	public static final String ACCESS_SUCESS = "00";
	public static final String PLEASE_LOGIN = "01";

	// 6-69999 查询类返回码
	public static final String SYS_ID_INVALID = "60001";
	public static final String SYS_SERIALNO_EXIST = "60002";
	public static final String USER_EXIST = "60003";

	public static final String BUSINESS_NULL = "6009";

	public static final String BUSINESS_ISUSER = "6010";
	// 7-79999 报文类错误码
	public static final String SIG_FAIL = "70001";
	public static final String FORMAT_ERROR = "70002";

	// 8-89999 验证类错误码
	// 9001-99999 系统类错误码
	public static final String SYS_ERR = "99999";

	public static final String USER_SELECT_ERROR = "1001";

	public static final String USER_EMAIL_ERROR = "1002";

	public static final String EMAIL_Exists = "1003";
	/**
	 * 根据用户ID查询购物车异常
	 */
	public static final String SELECT_CART_ERROR = "6001";

	// 用户地址最大数量
	public static final String Address_MAX = "5";
	
	//节操币使用规则参数
	public static final Integer Rate_Of_Exchange = 100;//兑换余额比率
	//会员资料
	public static final Integer Register_OK = 1000;//新注册用户
	public static final Integer User_Header = 50;//认证头像
	public static final Integer User_Mobile = 500;//认证手机
	public static final Integer User_Email = 300;//认证邮箱
	public static final Integer User_WchatQQ = 200;//认证微信或者QQ
	public static final Integer User_Person = 500;//个人认证
	public static final Integer User_Company = 10000;//企业认证
	//购买商品
	public static final Integer Goods_Exchage = 10;//一般商品兑换比率
	public static final Integer Goods_Max10000 = 1000; //价格10000或者以上封顶1000
	//商品评价
	public static final Integer Price300_WordCount10 = 20;//价格小于300且评价字数10个以上
	public static final Integer Price300Between2000_WordCount10 = 50;//价格300到2000之间且评价字数10个以上
	public static final Integer Price2000_WordCount10 = 100;//价格2000以上且评价字数10以上
	//分享
	public static final Integer Goods_Share = 500;//分享
	//建议回馈
	public static final Integer Person_Suggest = 100;//建议回馈
	
	
	//支付宝充值
	public static final Integer Charge_Pay = 1;
	//微信充值
	public static final Integer Charge_Wx = 2;
	//银行卡充值
	public static final Integer Charge_Bank = 3;
	//节操币兑换
	public static final Integer Charge_Fest = 4;
	//未充值
	public static final Integer Charge_No = 5;
	
	public static final Integer COMMENT_TIMEOUT_DAY = 15;
	

}
