package com.i9he.m2b.manage.utils;

public class MessageContentUtil {
	 public static String TITLE_1 = "专属节操券发放通知";
	 public static String TITLE_2 = "商品降价提醒";
	 //物流信息标题
	 public String getLogisticsTitle(String name){
		 return  "您的"+name+"已签收";
	 }
	//物流信息内容
	 public String getLogistics(String orderid,String mailno){
		 return "亲爱的用户，您的订单("+orderid+")已出库，物流信息：顺丰"+mailno;
	 }
	 //节操币标题
	 public String getJcbTitle(String number){
		 return "您的节操币<b style='font-size:18px;color:#1B9D97' >+"+number+"</b>";
	 }
	 public String getJcbTitle1(String number){
		 return "您的节操币+<b style='font-size:14px;color:#1B9D97'>-"+number+"</b>";
	 }
	 //订单赛图成功
	 public String getOrderCommentst(String orderid){
		 return "亲爱的用户，您的订单("+orderid+")评论晒图成功，获得节操币 <span style='font-size:14px;color:#1B9D97'>+5</span>";
	 }
	 //订单评论完成
	 public String getOrderEnd(String orderid){
		 return "亲爱的用户，您的订单("+orderid+")已完成，获得节操币 <span style='font-size:14px;color:#1B9D97'>+5</span>";
	 }
	 //完成注册
	 public String getRegister(){
		 return "亲爱的用户,您已完成用户注册,获得节操币<span style='font-size:14px;color:#1B9D97'>+1000</span>";
	 }
	 //完成上传头像
	 public String getHead(){
		 return "亲爱的用户,您已完成头像照片，获得节操币<span style='font-size:14px;color:#1B9D97'>+50</span>";
	 }
	 //完成手机验证
	 public String getPhoneValidate(){
		 return "亲爱的用户,您已完成手机验证，获得节操币<span style='font-size:14px;color:#1B9D97'>+500</span>";
	 }
	 //完成邮箱验证
	 public String getEamilValidate(){
		 return "亲爱的用户,您已完成邮箱验证,获得节操币<span style='font-size:14px;color:#1B9D97'>+300</span>";
	 }
	 //微信绑定
	 public String getWx(){
		 return "亲爱的用户,您已完成微信绑定,获得节操币<span style='font-size:14px;color:#1B9D97'>+200</span>";
	 }
	 //QQ绑定
	 public String getQQ(){
		 return "亲爱的用户,您已完成QQ绑定,获得节操币<span style='font-size:14px;color:#1B9D97'>+200</span>";
	 }
	 //完成个人认证
	 public String getUserYz(){
		 return "亲爱的用户,您已完成个人认证,获得节操币<span style='font-size:14px;color:#1B9D97'>+500</span>";
	 }
	 //完成企业认证
	 public String getCompany(){
		 return "亲爱的用户,您已完成企业验证,获得节操币<span style='font-size:14px;color:#1B9D97'>+5000</span>";
	 }
	 //订单消耗节操币
	 public String getOrderConsumeJcb(String orderid,String jcb){
		 return "亲爱的用户,您的订单("+orderid+"),消耗了<span style='font-size:14px;color:#1B9D97'>"+jcb+"</span>个节操币。";
	 }
	 //节操币换余额
	 public String getYue(String jcb,String money){
		 return "亲爱的用户,你已成功使用<span style='font-size:14px;color:#1B9D97'>"+jcb+"</span>个节操币兑换余额<span style='font-size:14px;color:#1B9D97'>"+money+"</span>元";
	 } 
	 //专属节操券发放通知
	 public String getZsJcq(String money,String startTime,String endTime){
		 return "亲爱的用户,您有一张"+money+"元限购【服务器】的节操券可以领取哟~ 活动时间："+startTime+"至"+endTime;
	 }
	 //降价提醒
	 public String getRemind(String goodsName,String price){
		 return "亲爱的用户,您关注的"+goodsName+",已经降价到<span style='font-size:14px;color:#1B9D97'>"+price+"</span>元,赶紧抢购吧~";
	 }
}
