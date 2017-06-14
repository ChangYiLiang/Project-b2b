package com.i9he.m2b.server.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.i9he.common.alipay.AlipayCallback;
import com.i9he.common.alipay.AlipayDirectModel;
import com.i9he.common.alipay.AlipayNotifyModel;
import com.i9he.common.alipay.AlipayRefundModel;
import com.i9he.common.alipay.AlipayRefundNotifyModel;
import com.i9he.common.alipay.AlipayUtils;
import com.i9he.common.alipay.config.AlipayConfig;
import com.i9he.common.config.B2BConstants;
import com.i9he.common.exception.I9heException;
import com.i9he.common.jdpay.JDPayCallback;
import com.i9he.common.jdpay.JDPayConfig;
import com.i9he.common.jdpay.JDPayModel;
import com.i9he.common.jdpay.JDPayQueryModel;
import com.i9he.common.jdpay.JDPayReceiveModel;
import com.i9he.common.jdpay.JDPayUtils;
import com.i9he.common.util.RequestUtils;
import com.i9he.common.wxpay.WxCallback;
import com.i9he.common.wxpay.WxConfigure;
import com.i9he.common.wxpay.WxPayApi;
import com.i9he.common.wxpay.WxPayData;
import com.i9he.m2b.model.Alipay;
import com.i9he.m2b.model.JDPay;
import com.i9he.m2b.model.Wxpay;
import com.i9he.m2b.server.biz.IThirdPartyPaymentService;
import com.i9he.m2b.server.controller.callback.WxCallbackConfig;
import com.i9he.m2b.util.SessionUtil;
import com.i9he.m2b.util.ThreadContextHolder;

@Controller
@RequestMapping("/pay")
public class PayController {

	public static final String WXPAY_MODEL = "wxpayModel";

	public static final String ALIPAY_DIRECT_MODEL = "alipayDirectModel";

	public static final String ALIPAY_REFUND_MODEL = "alipayRefundModel";

	public static final String ALIPAY_TRADE_FINISHED = "TRADE_FINISHED";

	public static final String ALIPAY_TRADE_SUCCESS = "TRADE_SUCCESS";

	private static final String ALIPAY_DEFAULT_CALLBACK = "defaultAlipayCallback";
	
	public static final String JDPAY_MODEL = "jdpayModel";
	
	public static final String JDPAY_QUERY_MODEL = "jdpayQueryModel";

	private static final Logger logger = Logger.getLogger(PayController.class);

	private static final Logger payLogger = Logger.getLogger("com.i9he.pay");

	@Resource(name = "alipayDirectConfig")
	private AlipayConfig alipayDirectConfig;

	@Resource(name = "alipayRefundConfig")
	private AlipayConfig alipayRefundConfig;
	
	@Resource(name = "alipayNotifyConfig")
	private AlipayConfig alipayNotifyConfig;
	
	@Resource(name = "wxConfigure")
	private WxConfigure wxConfigure;
	
	@Resource(name = "wxRefundConfigure")
	private WxConfigure wxRefundConfigure;
	
	@Resource(name = "jdpayConfig")
	private JDPayConfig jdpayConfig;
	
	@Resource(name = "jdpayCallbacks")
	private Map<String,JDPayCallback> jdpayCallbacks;
	
	@Autowired
	private IThirdPartyPaymentService paymentService;
	
	@Autowired
	private WxCallbackConfig wxCallbackConfig;

	// TODO: 支付宝支付
	@ResponseBody
	@RequestMapping("/alipay")
	public void alipay(ModelMap map) throws Exception {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		if (map.get(ALIPAY_DIRECT_MODEL) == null) {
			String returnUrl = request.getHeader("Referer");
			if (StringUtils.isBlank(returnUrl)) {
				returnUrl = RequestUtils.getClientUrl(request, "");
			}
			response.sendRedirect(returnUrl);
			return;
		}

		AlipayConfig alipayConfig = alipayDirectConfig;
		if (Boolean.TRUE.equals(map.get("QrMode"))) {
			alipayConfig = alipayNotifyConfig;
		}
		// 插入订单
		AlipayDirectModel model = (AlipayDirectModel) map.get(ALIPAY_DIRECT_MODEL);
		Alipay alipay = paymentService.createAlipay(SessionUtil.getSessionUserID(), model.getTotalFee(), model.getType(), model.getOrderID());
		
		model.setOutTradeNo(alipay.getOutTradeNo());
		logger.info(String.format("申请支付宝交易: 交易号[%s] 商品名称[%s] 商品价格 [%f]", model.getOutTradeNo(), model.getSubject(), model.getTotalFee()));
		AlipayUtils.redirectDirectPay(response, model, alipayConfig);
	}

	@RequestMapping("/alipay_redirect")
	public String alipayRedirect() throws Exception {
		logger.info("支付宝在线支付回调(redirect)");
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final ServletContext sc = request.getServletContext();
		boolean verify_result = AlipayUtils.verify(request, alipayDirectConfig);
		String extraParam = StringUtils.defaultIfBlank(request.getParameter("extra_common_param"), ALIPAY_DEFAULT_CALLBACK);
		AlipayNotifyModel model = AlipayUtils.buildNotifyModel(request, alipayDirectConfig);
		AlipayCallback callback = WebApplicationContextUtils.getRequiredWebApplicationContext(sc).getBean(extraParam, AlipayCallback.class);
		if (verify_result) {
			logger.info("支付宝回调支付验证通过, 请求参数: " + JSON.toJSONString(request.getParameterMap()));
			payLogger.info(String.format("支付宝交易号: %s, 商城交易号: 交易状态: %s", model.getTradeNo(), model.getOutTradeNo(), model.getTradeStatus()));
			Alipay alipay = paymentService.getAlipay(model.getOutTradeNo());
			if (model.isSuccess()) {
				logger.info("支付成功, 交易号为: " + model.getTradeNo());
				alipay.setPayState(B2BConstants.PAY_STATUS_SUCCESS);
			} else {
				logger.info("支付失败, 交易号为: " + model.getTradeNo());
				alipay.setPayState(B2BConstants.PAY_STATUS_FAILURE);
			}
			alipay.setBuyerId(model.getBuyerId());
			alipay.setBuyerMail(model.getBuyerEmail());
			alipay.setTradeNo(model.getTradeNo());
			// 更新状态
			paymentService.updateAlipay(alipay);
			return callback.onReturn(model, alipay);
		} else {
			logger.info("验证失败: " + JSON.toJSONString(request.getParameterMap()));
			Alipay alipay = paymentService.getAlipay(model.getOutTradeNo());
			return callback.onReturnError(model, alipay);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/alipay_notify", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String alipayNotify(@RequestParam("out_trade_no") String outTradeNo, @RequestParam("trade_no") String tradeNo, @RequestParam("trade_status") String status) throws Exception {

		logger.info("支付宝在线支付通知(notify)");
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final ServletContext sc = request.getServletContext();
		String extraParam = StringUtils.defaultIfBlank(request.getParameter("extra_common_param"), ALIPAY_DEFAULT_CALLBACK);
		AlipayCallback callback = WebApplicationContextUtils.getRequiredWebApplicationContext(sc).getBean(extraParam, AlipayCallback.class);
		AlipayNotifyModel model = AlipayUtils.buildNotifyModel(request, alipayDirectConfig);
		boolean verify_result = AlipayUtils.verify(request, alipayDirectConfig);
		if (verify_result) {
			logger.info("支付宝回调验证通过, 请求参数: " + JSON.toJSONString(request.getParameterMap()));
			payLogger.info(String.format("支付宝交易号: %s, 商城交易号: 交易状态: %s", tradeNo, outTradeNo, status));
			
			Alipay alipay = paymentService.getAlipay(model.getOutTradeNo());
			if (model.isSuccess()) {
				logger.info("支付成功, 交易号为: " + tradeNo);
				alipay.setPayState(B2BConstants.PAY_STATUS_SUCCESS);
			} else {
				logger.info("支付失败, 交易号为: " + tradeNo);
				alipay.setPayState(B2BConstants.PAY_STATUS_FAILURE);
			}
			alipay.setBuyerId(model.getBuyerId());
			alipay.setBuyerMail(model.getBuyerEmail());
			alipay.setTradeNo(model.getTradeNo());
			// 更新状态
			paymentService.updateAlipay(alipay);
			return callback.onNotity(model, alipay) ? "success" : "fail";
		} else {
			logger.error("支付宝验证失败");
		}
		return "fail";
	}

	@ResponseBody
	@RequestMapping("/alipay_refund")
	public void alipayRefund(ModelMap map) throws IOException {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		if (map.get(ALIPAY_REFUND_MODEL) == null) {
			String returnUrl = request.getHeader("Referer");
			if (StringUtils.isBlank(returnUrl)) {
				returnUrl = RequestUtils.getClientUrl(request, "");
			}
			response.sendRedirect(returnUrl);
			return;
		}

		AlipayRefundModel model = (AlipayRefundModel) map.get(ALIPAY_REFUND_MODEL);
		logger.info(String.format("申请支付宝退款: 交易号[%s] 退款笔数[%d]", model.getBatchNo(), model.getBatchNum()));
		AlipayUtils.redirectRefund(response, model, alipayRefundConfig);
	}

	@ResponseBody
	@RequestMapping(value = "/alipay_refund_notify", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String alipayRefundNotify(@RequestParam("result_details") String details) throws IOException {
		logger.info("支付宝退款通知(notify)");
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final ServletContext sc = request.getServletContext();
		String extraParam = StringUtils.defaultIfBlank(request.getParameter("extra_common_param"), ALIPAY_DEFAULT_CALLBACK);
		AlipayCallback callback = WebApplicationContextUtils.getRequiredWebApplicationContext(sc).getBean(extraParam, AlipayCallback.class);
		AlipayRefundNotifyModel model = AlipayUtils.buildRefundNotifyModel(request, alipayRefundConfig);
		boolean verify_result = AlipayUtils.verify(request, alipayDirectConfig);
		if (verify_result) {
			logger.info("支付宝退款成功, 请求参数: " + JSON.toJSONString(request.getParameterMap()));
			payLogger.info(String.format("退款明细: %s", details));
			return callback.onRefundNotify(model) ? "success" : "fail";
		} else {
			logger.error("支付宝验证失败");
		}
		return "fail";
	}

	// TODO 微信支付
	private static final int BLACK = 0xFF000000;
	private static final int WHITE = 0xFFFFFFFF;

	public static BufferedImage toBufferedImage(BitMatrix matrix) {
		int width = matrix.getWidth();
		int height = matrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
			}
		}
		return image;
	}

	@ResponseBody
	@RequestMapping(value = "/wxpay", produces = "image/png")
	public void wxpay(ModelMap map) throws Exception {
		HttpServletResponse resp = ThreadContextHolder.getHttpResponse();
		String productID = (String) map.get(WXPAY_MODEL);
		String wxpayurl = WxPayApi.nativeQrPayUrl(wxConfigure, productID);
		logger.info(wxpayurl);
		BitMatrix bitMatrix = new MultiFormatWriter().encode(wxpayurl, BarcodeFormat.QR_CODE, 200, 200);
		BufferedImage image = toBufferedImage(bitMatrix);
		ImageIO.write(image, "png", resp.getOutputStream());
	}

	@ResponseBody
	@RequestMapping(value = "/wxpay_redirect", produces = "text/xml;charset=utf-8")
	public String wxpayRedirect() throws Exception {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String body = IOUtils.toString(request.getInputStream());
		logger.info("微信Native扫码支付回调 CONTENT[" + body + "]");
		WxPayData payData = WxPayData.parseFromXml(body);
		if (payData.checkSign(wxConfigure)) {
			// 签名验证通过
			logger.info("验证签名通过");
			String productID = (String) payData.getValue("product_id");
			WxCallback cb = wxCallbackConfig.getWxCallback(productID);
			Byte orderType = cb.getOrderType();
			String orderID = cb.getOrderID(productID);
			int userID = cb.getUserID(orderID);
			String productName = cb.getProductName(orderID);
			BigDecimal totalFee = cb.getTotalFee(orderID);
			
			Wxpay wxpay = paymentService.createWxpay(userID, totalFee, orderType, orderID);
			wxpay.setProductId(productID);
			
			WxPayData unifiredOrder = WxPayApi.unifiedOrder(wxConfigure, productName, wxpay.getOutTradeNo(), totalFee, wxpay.getProductId());
			
			logger.info(JSON.toJSONString(unifiredOrder.toMap()));
			if (unifiredOrder.checkSign(wxConfigure)) {
				wxpay.setPrepayId((String) unifiredOrder.getValue("prepay_id"));
				wxpay.setCodeUrl((String) unifiredOrder.getValue("code_url"));
				paymentService.updateWxpay(wxpay);
				return unifiredOrder.sign(wxConfigure).toXml();
			}
		} else {
			logger.error("签名验证失败");
		}
		
		logger.info(JSON.toJSONString(payData.toXml()));
		
		return "error";
	}
	
	@ResponseBody
	@RequestMapping(value = "/wxpay_unifiedorder_notify", produces = "text/xml;charset=utf-8")
	public String wxpayUnifiedorderNotify() throws Exception {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String body = IOUtils.toString(request.getInputStream());
		logger.info("微信统一支付回调Content:[" + body + "]");
		WxPayData payData = WxPayData.parseFromXml(body);
		if (payData.checkSign(wxConfigure)) {
			// 签名验证通过
			logger.info("验证签名通过");
			// 支付成功
			String outTradeNo = (String) payData.getValue("out_trade_no");
			Wxpay wxpay = paymentService.getWxpay(outTradeNo);
			if ("SUCCESS".equals(payData.getValue("result_code"))) {
				logger.info("微信支付成功, 交易号为: " + outTradeNo);
				wxpay.setPayState(B2BConstants.PAY_STATUS_SUCCESS);
			} else {
				logger.info("微信支付失败, 交易号为: " + outTradeNo);
				wxpay.setPayState(B2BConstants.PAY_STATUS_FAILURE);
			}
			wxpay.setOpenid((String) payData.getValue("openid"));
			wxpay.setPayTime((String) payData.getValue("time_end"));
			wxpay.setTransactionId((String) payData.getValue("transaction_id"));
			logger.info("已更新微信支付, 回调微信支付业务");
			paymentService.updateWxpay(wxpay);
			String productID = wxpay.getProductId();
			WxCallback cb = wxCallbackConfig.getWxCallback(productID);
			cb.onPay(payData, wxpay);
			return WxPayApi.responsePayState(true, null).toXml();
		} else {
			return WxPayApi.responsePayState(false, "签名错误").toXml();
		}
	}
	
	@ResponseBody
	@RequestMapping("/wxpay_refund")
	public String wxpayRefund() {
		WxPayData payData = WxPayApi.refund(wxRefundConfigure, "T1000000005", "R2_T1000000005", 1, 1);
		if (payData.checkSign(wxRefundConfigure)) {
			logger.info("签名通过");
			logger.info(payData.toMap());
			return "SUCCESS";
		}
		return "ERROR";
	}
	
	// TODO: 京东网关支付
	@ResponseBody
	@RequestMapping("/jdpay")
	public void jdpay(ModelMap map) throws IOException, I9heException {
		final JDPayModel jdpayModel = (JDPayModel) map.get(JDPAY_MODEL);
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		if (jdpayModel == null) {
			String returnUrl = request.getHeader("Referer");
			if (StringUtils.isBlank(returnUrl)) {
				returnUrl = RequestUtils.getClientUrl(request, "");
			}
			response.sendRedirect(returnUrl);
			return;
		}
		JDPay jdpay = paymentService.createJDPay(SessionUtil.getSessionUserID(), jdpayModel.getAmount(), jdpayModel.getType(), jdpayModel.getOrderId());
		jdpayModel.setV_oid(jdpay.getvOid());
		response.setContentType("text/html;charset=utf-8");
		String html = JDPayUtils.buildRequest(jdpayModel, jdpayConfig);
		Writer writer = response.getWriter();
		writer.write(html);
		writer.flush();
		writer.close();
	}
	
	@ResponseBody
	@RequestMapping("/jdpay_query")
	public void jdpayQuery(ModelMap map) throws I9heException, IOException {
		final JDPayQueryModel jdpayModel = (JDPayQueryModel) map.get(JDPAY_QUERY_MODEL);
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		if (jdpayModel == null) {
			String returnUrl = request.getHeader("Referer");
			if (StringUtils.isBlank(returnUrl)) {
				returnUrl = RequestUtils.getClientUrl(request, "");
			}
			response.sendRedirect(returnUrl);
			return;
		}
		JDPay jdpay = paymentService.getJDPay(jdpayModel.getType(), jdpayModel.getOrderId());
		String html = JDPayUtils.buildSearchRequest(jdpay.getvOid(), jdpayConfig);
		IOUtils.write(html, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("/jdpay_receive")
	public void jdpayReceive(RedirectAttributes attrs) throws I9heException, IOException {
		final HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		final HttpServletResponse response = ThreadContextHolder.getHttpResponse();
		Enumeration<String> names = request.getParameterNames();
		Map<String, String> params = new HashMap<String, String>();
		if (names != null) {
			while(names.hasMoreElements()) {
				String name = names.nextElement();
				params.put(name, request.getParameter(name));
			}
		}
		System.out.println(JSON.toJSONString(params));
		JDPayReceiveModel rModel = JDPayUtils.parseReceiveModel(params, jdpayConfig);
		JDPay jdpay = paymentService.getJDPay(rModel.getV_oid());
		jdpay.setvAmount(rModel.getV_amount());
		jdpay.setvMoneytype(rModel.getV_moneytype());
		jdpay.setvPmode(rModel.getV_pmode());
		jdpay.setvPstatus(rModel.getV_pstatus());
		jdpay.setvPstring(rModel.getV_pstring());
		
		if (StringUtils.equals("20", rModel.getV_pstatus())) {
			jdpay.setPayState(B2BConstants.PAY_STATUS_SUCCESS);
		}
		if (StringUtils.equals("30", rModel.getV_pstatus())) {
			jdpay.setPayState(B2BConstants.PAY_STATUS_FAILURE);
		}
		
		paymentService.updateJDPay(jdpay);
		JDPayCallback callback = jdpayCallbacks.get(String.valueOf(jdpay.getType()));
		if (rModel.isSuccess()) {
			logger.info("交易成功!");
			if (callback != null) {
				callback.onpay(rModel, jdpay);
			}
		} else {
			attrs.addFlashAttribute("error", "您的订单尚未支付成功");
			String orderId = jdpay.getOrderId();
			response.sendRedirect(RequestUtils.getClientUrl(request, "/cart/topay.do?orderId=" + orderId));
		}
	}
}
