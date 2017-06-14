package com.i9he.m2b.util;

public enum MessageUtil {
	// 订单相关消息
	NO_PAY("您还有商品未支付,赶紧去支付吧!", "未支付", 1), 
	END_PAY("您已经完成支付,商家正准备给您发货,请耐心等待...", "完成支付", 2), 
	WAIT_GOODS("客户已经付款,请尽快发货.", "发货提醒", 7), 
	SEND_GOODS("商家已经给您发货,请注意查收.", "商家发货", 3),

	// 客户服务相关消息
	SERVE_CUSTOMER("客户希望来公司洽谈,请公司安排人接待.", "报价单", 4), 
	OFFER_SHEET("客户已经提交报价单,请相关人员尽快处理.", "客户预约", 5),
	// 降价提醒消息
	PRICE_REMINDER("您关注的商品已经降到您满意的价格了,赶快去购买吧!", "降价提醒", 6);
	private String content;
	private String title;
	private Integer no;

	private MessageUtil(String content, String title, Integer no) {
		this.content = content;
		this.title = title;
		this.no = no;
	}

	public static String getContext(Integer no) {
		for (MessageUtil m : MessageUtil.values()) {
			if (m.getNo() == no) {
				return m.getContent();
			}
		}
		return null;
	}

	public static String getTitle(Integer no) {
		for (MessageUtil m : MessageUtil.values()) {
			if (m.getNo() == no) {
				return m.getTitle();
			}

		}
		return null;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
