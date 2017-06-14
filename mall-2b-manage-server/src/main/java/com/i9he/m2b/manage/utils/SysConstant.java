package com.i9he.m2b.manage.utils;

import java.util.LinkedHashMap;
import java.util.Map;

import com.i9he.common.config.B2BConstants;

/**
 * 说明： 常量类
 * 
 */
public class SysConstant {
	
	
	/***商品总体评价*/
	public static final Map<String, String> GOODS_COMMENT_MAP;
	
	/** 售后申请状态*/
	public static final Map<Byte, String> AFS_STATE_MAP;
	
	public static final Map<Byte, String> AFS_TYPE_MAP;
	
	static{
		GOODS_COMMENT_MAP = new LinkedHashMap<String, String>();
		GOODS_COMMENT_MAP.put(B2BConstants.POSITIVE_COMMENT, "好评");
		GOODS_COMMENT_MAP.put(B2BConstants.MEDIUM_COMMENT, "中评");
		GOODS_COMMENT_MAP.put(B2BConstants.BAD_COMMENT, "差评");
		
		AFS_STATE_MAP = new LinkedHashMap<Byte, String>();
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_UNPROCESS, "未处理");
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_PROCESSING, "已受理");
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_PROCESSED, "已处理");
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_FINUSHED, "已完成");
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_REFUSED, "已拒绝");
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_CLOSED, "已关闭");
		AFS_STATE_MAP.put(B2BConstants.AFS_STATE_CANCEL, "已取消");
		
		AFS_TYPE_MAP =  new LinkedHashMap<Byte, String>();
		AFS_TYPE_MAP.put(B2BConstants.AFS_TYPE_REFUND_MONEY_ONLY, "仅退款");
		AFS_TYPE_MAP.put(B2BConstants.AFS_TYPE_REFUND_GOODS_MONEY, "退货退款");
		AFS_TYPE_MAP.put(B2BConstants.AFS_TYPE_EXCHANGE_GOODS, "换货");
		AFS_TYPE_MAP.put(B2BConstants.AFS_TYPE_REPAIR, "返修");
	}
	


}