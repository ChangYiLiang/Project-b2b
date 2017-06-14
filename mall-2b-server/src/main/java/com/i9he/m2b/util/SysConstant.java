package com.i9he.m2b.util;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.i9he.common.config.BusinessConstants;
import com.i9he.common.config.FinanCanstants;
import com.i9he.order.api.IOrderBaseApiServcie;
import com.i9he.privilege.api.IPrivilegeBaseApiService;

/**
 * 说明： 常量类
 * 
 * @author zhengxg @date 2012-12-10
 */
@SuppressWarnings( { "serial", "unchecked" })
public class SysConstant {
	
	public static Map<String, Object> wrap(Map sources) {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		for (Object key : sources.keySet()) {
			result.put(String.valueOf(key), sources.get(key));
		}
		return result;
	}

	/**
	 * 物流状态： 2-在途中,3-签收,4-问题件
	 */
	/***在途中*/
	public static final int LOGISTIC_ONTHEWAY = 2;
	/***已签收*/
	public static final int LOGISTIC_SIGN = 3;
	/***问题件*/
	public static final int LOGISTIC_PROBLEMS = 4;
	
	/***好评*/
	public static final String POSITIVE_COMMENT = "2";
	/***中评*/
	public static final String MEDIUM_COMMENT = "1";
	/***差评*/
	public static final String BAD_COMMENT = "0";
	
	/** 未发货*/
	public static final int NON_GOODS = 0;
	/** 已发货*/
	public static final int DELIVERED = 1;
	/** 已签收*/
	public static final int SIGN = 2;
	
	/***物流状态*/
	public static final Map<Integer, String> LOGISTIC_STATUS_MAP;
	/***商品总体评价*/
	public static final Map<String, String> GOODS_COMMENT_MAP;
	
	public static int getOrderCycle(Integer a,Integer id){
		
		if(a==1){
			return 7;
		}else{
			return 8;
		}
		
//		if(id==3||id==7||id==8||id==9){
//			if(a==1){
//				return 7;
//			}else if(a==2){
//				return 8;
//			}else{
//				return 0;
//			}
//		}else{	
//			if(a==1){
//				return 4;
//			}else if(a==3){
//				return 5;
//			}else if(a==6){
//				return 6;
//			}else if(a==12){
//				return 7;
//			}else if(a==24){
//				return 8;
//			}else if(a==36){
//				return 9;
//			}else{
//				return 0;
//			}
//		}
	}
	
	/** 账单状态 */
	public static final Map INVOICE_STATUS_MAP = new HashMap() {
		{
			put(FinanCanstants.STATUS_UNPAID, "未支付");
			put(FinanCanstants.STATUS_PAID, "已支付");
			put(FinanCanstants.STATUS_APPLY_REFUND, "申请退款中");
			put(FinanCanstants.STATUS_AUDIT_DID_NOT_PASS, "退款审核未通过");
			put(FinanCanstants.STATUS_AUDIT_BY, "退款审核通过");
			put(FinanCanstants.STATUS_REFUNDED, "已退款");
			put(FinanCanstants.STATUS_CLIENT_CANCEL, "客户取消");
			put(FinanCanstants.STATUS_ADMIN_CANCEL, "客服取消");
			put(FinanCanstants.STATUS_HAS_EXPIRED, "已过期");
			put(FinanCanstants.STATUS_PAYING, "支付中");
//			put(InvoiceService.STATUS_INADVANCEPAID, "已预确认收款");
		}
	};

	/** 账单状态集合 */
	public static final List INVOICE_STATUS_LIST = new LinkedList() {
		{
			add(FinanCanstants.STATUS_UNPAID, "未支付");
			add(FinanCanstants.STATUS_PAID, "已支付");
			add(FinanCanstants.STATUS_APPLY_REFUND, "申请退款中");
			add(FinanCanstants.STATUS_AUDIT_DID_NOT_PASS, "退款审核未通过");
			add(FinanCanstants.STATUS_AUDIT_BY, "退款审核通过");
			add(FinanCanstants.STATUS_REFUNDED, "已退款");
			add(FinanCanstants.STATUS_CLIENT_CANCEL, "客户取消");
			add(FinanCanstants.STATUS_ADMIN_CANCEL, "客服取消");
			add(FinanCanstants.STATUS_HAS_EXPIRED, "已过期");
			add(FinanCanstants.STATUS_PAYING, "支付中");
//			add(InvoiceService.STATUS_INADVANCEPAID, "已预确认收款");
		}
	};
	// 业务类型 0、服务器，1、独立高防,2、分布式高防, 3、托管业务
		public static Map<Byte, String> SERVICE_TYPE = new LinkedHashMap<Byte, String>() {
			{
				put(BusinessConstants.BUSINESS_TYPE_SERVER_HIRE, "服务器租用");
				put(BusinessConstants.BUSINESS_TYPE_DEFENSE, "独立高防");
				put(BusinessConstants.BUSINESS_TYPE_DISTRIBUTED_DEFENSE, "分布式高防");
				put(BusinessConstants.BUSINESS_TYPE_TRUSTEESHIP, "服务器托管");
			}
		};

		// 业务状态 0：等待安装，1：正常，3：已过期，4：机房取消
		public static Map<Byte, String> SERVICE_STATE = new LinkedHashMap<Byte, String>() {
			{
				put(BusinessConstants.BUSINESS_STATE_PRESETUP, "等待安装");
				put(BusinessConstants.BUSINESS_STATE_NORMAL, "正常");
				put(BusinessConstants.BUSINESS_STATE_OUTDATE, "已过期");
				put(BusinessConstants.BUSINESS_STATE_CANCEL, "机房取消");
			}
		};
		
		/** 物流状态：0未发货，1已发货，2已签收*/
		public static final Map<Integer, String> SHIPPING_STATUS_MAP = new HashMap<Integer, String>() {
			{
				put(NON_GOODS, "未发货");
				put(DELIVERED, "已发货");
				put(SIGN, "已签收");
			}
		};
//	/** 账单是否需要发票状态 */
//	public static final Map INVOICE_STATUSRECEIPT_MAP = new HashMap() {
//		{
//			put(InvoiceService.STATUSRECEIPT_NO, "不需要");
//			put(InvoiceService.STATUSRECEIPT_YES, "需要");
//		}
//	};
//
//	/** 账单是否需要发票状态集合 */
//	public static final List INVOICE_STATUSRECEIPT_LIST = new LinkedList() {
//		{
//			add(InvoiceService.STATUSRECEIPT_NO, "不需要");
//			add(InvoiceService.STATUSRECEIPT_YES, "需要");
//		}
//	};

	/** 账单类型 */
	public static final Map INVOICE_TYPE_MAP = new HashMap() {
		{
			put(FinanCanstants.TYPE_ORDER, "订购");
			put(FinanCanstants.TYPE_RENEW, "续费");
//			put(InvoiceService.TYPE_RECHARGE, "充值");
			put(FinanCanstants.TYPE_ONETIME, "一次性");
		}
	};

	/** 账单类型集合 */
	public static final List INVOICE_TYPE_LIST = new LinkedList() {
		{
			add(FinanCanstants.TYPE_ORDER, "订购");
			add(FinanCanstants.TYPE_RENEW, "续费");
//			add(InvoiceService.TYPE_RECHARGE, "充值");
		}
	};
	
	static{
		
		LOGISTIC_STATUS_MAP = new LinkedHashMap<Integer, String>();
		LOGISTIC_STATUS_MAP.put(IOrderBaseApiServcie.LOGISTIC_ONTHEWAY, "在途中");
		LOGISTIC_STATUS_MAP.put(IOrderBaseApiServcie.LOGISTIC_SIGN, "已签收");
		LOGISTIC_STATUS_MAP.put(IOrderBaseApiServcie.LOGISTIC_PROBLEMS, "问题件");
		
		GOODS_COMMENT_MAP = new LinkedHashMap<String, String>();
		GOODS_COMMENT_MAP.put(POSITIVE_COMMENT, "好评");
		GOODS_COMMENT_MAP.put(MEDIUM_COMMENT, "中评");
		GOODS_COMMENT_MAP.put(BAD_COMMENT, "差评");
	}

//	/** 发票状态 */
//	public static final Map RECEIPT_STATUS_MAP = new HashMap() {
//		{
//			put(ReceiptService.STATUS_NO, "未寄出");
//			put(ReceiptService.STATUS_YES, "已寄出");
//		}
//	};
//
//	/** 发票状态集合 */
//	public static final List RECEIPT_STATUS_LIST = new LinkedList() {
//		{
//			add(ReceiptService.STATUS_NO, "未寄出");
//			add(ReceiptService.STATUS_YES, "已寄出");
//		}
//	};
//
//	/** 业务状态：0未交付，1使用中，2暂停，3已取消，4终止,5 欺诈 */
//	public static final Map SERVICE_STATUS_MAP = new HashMap() {
//		{
//			put(ServiceService.NON_DELIVERY, "未付款");
//			put(ServiceService.WORKING, "正常");
//			put(ServiceService.TERMINATED, "机房取消");
//			put(ServiceService.WILL_EXPIRED, "即将到期");
//			put(ServiceService.EXPIRED, "已过期");
//		}
//	};
//	/** 业务处理状态：0未配置，1配置中，2已配置，3缺货等待 */
//	public static final Map SERVICE_DEPLOY_STATUS_MAP = new HashMap() {
//		{
//			put(ServiceService.NO_DEPLOY, "未配置");
//			put(ServiceService.DEPLOYING, "配置中 ");
//			put(ServiceService.DEPLOYED, "已配置");
//			put(ServiceService.STOCKOUT, "缺货等待");
//		}
//	};
//	/** 业务处理状态集合：0未配置，1配置中，2已配置，3缺货等待 */
//	public static final List SERVICE_DEPLOY_STATUS_LIST = new ArrayList() {
//		{
//			add(0, "未配置");
//			add(1, "配置中 ");
//			add(2, "已配置");
//			add(3, "缺货等待");
//		}
//	};
//	/** 业务类型集合：0、服务器，1、VPS,2、域名DNS，4、托管 */
//	public static final List SERVICE_TYPE_LIST = new ArrayList() {
//		{
//			add(ServiceService.TYPE_SERVER, "服务器");
//			add(ServiceService.TYPE_VPS, "VPS");
//			add(ServiceService.TYPE_DNS, "DNS");
//		}
//	};
//
//	/** 业务类型:0、服务器，1、VPS,2、域名DNS,4、托管 */
//	public static final Map SERVICE_TYPE_MAP = new HashMap() {
//		{
//			put(ServiceService.TYPE_SERVER, "服务器");
//			put(ServiceService.TYPE_VPS, "VPS");
//			put(ServiceService.TYPE_DNS, "DNS");
//			put(ServiceService.TYPE_FIREWALLCDN, "高防");
//		}
//	};

//	/** 管理员状态 （0为正常，1为禁用） */
//	public static final Map ADMIN_STATUS_MAP = new HashMap() {
//		{
//			put(AdminService.ADMIN_STATUS_UNLOCK, "正常");
//			put(AdminService.ADMIN_STATUS_LOCK, "禁用");
//		}
//	};
//
//	/** 联系人状态，如，0未锁定，1被锁定无法登陆 */
//	public static final Map CLIENT_LOCK_STATUS_MAP = new HashMap() {
//		{
//			put(ClientContactService.CLIENTCONTACT_STATUS_UNLOCK, "正常");
//			put(ClientContactService.CLIENTCONTACT_STATUS_LOCKED, "锁定");
//		}
//	};

	/** 客户性别，0为男，1为女，2为未知 */
	public static final Map CLIENT_GENDER_MAP = new HashMap() {
		{
			put(IPrivilegeBaseApiService.unknow+"", "未知");
			put(IPrivilegeBaseApiService.MAN+"", "先生");
			put(IPrivilegeBaseApiService.WOMAN+"", "女士");
			put(IPrivilegeBaseApiService.UNKNOWN+"", "先生/女士");
		}
	};
//
//	/** 管理员状态 （0为正常，1为禁用） */
//	public static final List ADMIN_STATUS_LIST = new LinkedList() {
//		{
//			add(AdminService.ADMIN_STATUS_UNLOCK, "正常");
//			add(AdminService.ADMIN_STATUS_LOCK, "禁用");
//		}
//	};
//
//	/** 交易记录状态：0成功，1失败 */
//	public static final Map PAYMENTLOG_STATUS_MAP = new HashMap() {
//		{
//			put(PaymentLogService.STATUS_SUCCESS, "成功");
//			put(PaymentLogService.STATUS_FAILURE, "失败");
//		}
//	};
//
//	/** 交易类型。0公司收款（包括：客户付款/续费/充值等）1公司支出（包括：客户退款/退差价等） */
//	public static final Map PAYMENTLOG_TYPE_MAP = new HashMap() {
//		{
//			put(PaymentLogService.TYPE_RECEIVABLE, "收款");
//			put(PaymentLogService.TYPE_EXPENDITURE, "支出");
//		}
//	};
//
	/** 订购周期 1:小时、2:天，3:周、4:月付、5:季付、6:半年付、7:年付、8:2年付，9:3年付 */
	public static final Map ORDER_ORDERCYCLE_MAP = new HashMap() {
		{
//			 暂时系统支持（月，季，半年，年）
			put(IOrderBaseApiServcie.ORDERCYCLE_HOUR+"", "一小时付");
			put(IOrderBaseApiServcie.ORDERCYCLE_DAY+"", "一天付");
			put(IOrderBaseApiServcie.ORDERCYCLE_WEEK+"", "一周付");
			put(IOrderBaseApiServcie.ORDERCYCLE_MONTHLY+"", "一月付");
			put(IOrderBaseApiServcie.ORDERCYCLE_QUARTER+"", "一季付");
			put(IOrderBaseApiServcie.ORDERCYCLE_SEMIANNUALLY+"", "半年付");
			put(IOrderBaseApiServcie.ORDERCYCLE_YEAR+"", "年付");
			put(IOrderBaseApiServcie.ORDERCYCLE_BIENNIALLY+"", "两年付");
			put(IOrderBaseApiServcie.ORDERCYCLE_TRIENNIALLY+"", "三年付");
		}
	};
//
//	/** 工单类型: 0财务、1技术、2业务（包括销售等）、3投诉建议(客户发起投诉)、4违规或滥用(管理员发起)、9其他 */
//	public static final Map TICKET_TYPE_MAP = new HashMap() {
//		{
//			put(TicketService.TICKET_TYPE_INVOICE, "财务问题");
//			put(TicketService.TICKET_TYPE_TECHNOLOGY, "技术");
//			put(TicketService.TICKET_TYPE_BUSINESS, "销售问题");
//			put(TicketService.TICKET_TYPE_SUGGEST, "投诉建议");
//			put(TicketService.TICKET_TYPE_ABUSE, "违规或滥用");
//			put(TicketService.TICKET_TYPE_ELSE, "其他");
//		}
//	};
//	/** 工单状态: 0待处理，1已关闭，2管理员回复，3为客户回复，4为处理中，5用户重开工单。只有管理员可以关闭工单。 */
//	public static final Map TICKET_STATUS_MAP = new HashMap() {
//		{
//			put(TicketService.TICKET_STATUS_PENDING, "待处理");
//			put(TicketService.TICKET_STATUS_CLOSED, "已关闭");
//			put(TicketService.TICKET_STATUS_ADMIN_RECOVERY, "管理员回复");
//			put(TicketService.TICKET_STATUS_CLIENT_RECOVERY, "客户回复");
//			put(TicketService.TICKET_STATUS_BEINGPROCESSED, "处理中");
//			put(TicketService.TICKET_STATUS_REOPEN, "用户重开工单");
//		}
//	};
//	/** 工单重要程度: 0不急,1一般,2紧急 */
//	public static final Map TICKET_IMPORTANCE_MAP = new HashMap() {
//		{
//			put(TicketService.TICKET_IMPORTANCE_SLOW, "不急");
//			put(TicketService.TICKET_IMPORTANCE_ORDINARY, "一般");
//			put(TicketService.TICKET_IMPORTANCE_URGENCY, "紧急");
//		}
//	};
//
//	/** 回复人类型: 0普通客户,1代理商,2客服 */
//	public static final Map TICKET_OBJECT_TYPE_MAP = new HashMap() {
//		{
//			put(TicketReplyService.TICKET_REPLY_OBJECT_TYPE_ORDINARY, "普通客户");
//			put(TicketReplyService.TICKET_REPLY_OBJECT_TYPE_AGENCY, "代理商");
//			put(TicketReplyService.TICKET_REPLY_OBJECT_TYPE_ADMIN, "客服");
//		}
//	};
//	/** 创建人类型: 0为客户,1为客服 */
//	public static final Map TICKET_CREATOR_TYPE_MAP = new HashMap() {
//		{
//			put(TicketService.TICKET_CREATOR_TYPE_CLIENT, "客户");
//			put(TicketService.TICKET_CREATOR_TYPE_ADMIN, "客服");
//		}
//	};
//
	/** 订单类型2，0为服务器租用，1服务器托管，2服务器高防，3 分布式高防订单，4实体类订单*/
	public static final Map ORDER_TYPE2_MAP = new HashMap() {
		{		

			put(IOrderBaseApiServcie.TYPE2_HIRE+"", "服务器租用");
			put(IOrderBaseApiServcie.TYPE2_TRUSTEESHIP+"", "服务器托管");
			put(IOrderBaseApiServcie.TYPE2_DEFENSE+"", "服务器高防");
			put(IOrderBaseApiServcie.TYPE2_DUBBO_DEFENSE+"", "分布式高防");
			put(IOrderBaseApiServcie.TYPE2_HARDWARE+"", "实体类");
		}
	};

	/** 订单状态：0未支付，1已支付，2已退款，3已过期，4已取消 */
	public static final Map ORDER_STATUS_MAP = new HashMap() {
		{
			put(IOrderBaseApiServcie.NON_PAYMENT+"", "待支付");
			put(IOrderBaseApiServcie.PREPAID+"", "已支付");
			put(IOrderBaseApiServcie.REFUND+"", "已退款");
			put(IOrderBaseApiServcie.HAVA_EXPIRED+"", "已过期");
			put(IOrderBaseApiServcie.CANCELED+"", "已取消");
			put(IOrderBaseApiServcie.PAYING+"", "已打款");
			put(IOrderBaseApiServcie.RECEIVING+"", "待收货");
			put(IOrderBaseApiServcie.RECEIVED+"", "已收货");
		}
	};
//

}