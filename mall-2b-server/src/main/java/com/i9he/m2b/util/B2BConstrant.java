package com.i9he.m2b.util;

import java.util.LinkedHashMap;
import java.util.Map;

import com.i9he.common.config.B2BConstants;

public class B2BConstrant implements B2BConstants {
	
	public static final Map<Byte, String> PURCHASE_REQUIREMENT_STATES;
	
	public static final Map<Byte, String> PURCHASE_REQUIREMENT_TYPES;
	
	public static final Map<Byte, String> AFTER_SALE_STATES;
	
	public static final Map<Byte, String> AFTER_SALE_TYPES;
	
	public static final Map<Integer, String> LOGISTIC_STATE;
	
	static {
		PURCHASE_REQUIREMENT_STATES = new LinkedHashMap<Byte, String>();
		PURCHASE_REQUIREMENT_STATES.put(PURCHASE_REQUIREMENT_STATE_UNPROCESS, "等待报价");
		PURCHASE_REQUIREMENT_STATES.put(PURCHASE_REQUIREMENT_STATE_PROCESSING, "等待报价");
		PURCHASE_REQUIREMENT_STATES.put(PURCHASE_REQUIREMENT_STATE_PROCESSED, "已报价");
		
		PURCHASE_REQUIREMENT_TYPES = new LinkedHashMap<Byte, String>();
		PURCHASE_REQUIREMENT_TYPES.put(PURCHASE_REQUIREMENT_TYPE_GOODS, "询产品");
		PURCHASE_REQUIREMENT_TYPES.put(PURCHASE_REQUIREMENT_TYPE_SOLUTION, "询方案");
		PURCHASE_REQUIREMENT_TYPES.put(PURCHASE_REQUIREMENT_TYPE_OTHER, "其他");
		
		AFTER_SALE_STATES = new LinkedHashMap<>();
		AFTER_SALE_STATES.put(AFS_STATE_UNPROCESS, "未处理");
		AFTER_SALE_STATES.put(AFS_STATE_PROCESSED, "已受理");
		AFTER_SALE_STATES.put(AFS_STATE_FINUSHED, "已完成");
		AFTER_SALE_STATES.put(AFS_STATE_REFUSED, "已拒绝");
		AFTER_SALE_STATES.put(AFS_STATE_CLOSED, "已关闭");
		AFTER_SALE_STATES.put(AFS_STATE_CANCEL, "已取消");
		
		AFTER_SALE_TYPES = new LinkedHashMap<Byte, String>();
		AFTER_SALE_TYPES.put(AFS_TYPE_REFUND_MONEY_ONLY, "仅退款");
		AFTER_SALE_TYPES.put(AFS_TYPE_REFUND_GOODS_MONEY, "退货退款");
		AFTER_SALE_TYPES.put(AFS_TYPE_EXCHANGE_GOODS, "换货");
		AFTER_SALE_TYPES.put(AFS_TYPE_REPAIR, "返修");
		
		LOGISTIC_STATE = new LinkedHashMap<Integer,String>();
		LOGISTIC_STATE.put(0,"无轨迹");
		LOGISTIC_STATE.put(1,"已揽收");
		LOGISTIC_STATE.put(2,"在途中");
		LOGISTIC_STATE.put(3,"签收");
		LOGISTIC_STATE.put(4,"问题件");
		LOGISTIC_STATE.put(201,"到达派件城市");
	}

}
