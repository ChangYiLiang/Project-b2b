package com.i9he.m2b.server.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.i9he.common.alipay.AlipayDirectModel;
import com.i9he.common.alipay.AlipayRefundDataItem;
import com.i9he.common.alipay.AlipayRefundModel;

@Controller
public class DemoController {

	@RequestMapping("/demo/main")
	public String demo() {
		return "demo/main.ftl";
	}

	@RequestMapping("/demo/pay")
	public String pay(ModelMap model) {
		return "demo/pay.ftl";
	}

	@RequestMapping(value = "/demo/wxpay")
	public String wxpay(RedirectAttributes attrs) {
		attrs.addFlashAttribute(PayController.WXPAY_MODEL, "TEST_1"); // 订单类型前缀_订单号
		return "redirect:/pay/wxpay.do";
	}

	@RequestMapping(value = "/demo/alipay")
	public String alipay(Boolean qrMode, RedirectAttributes attrs) {
		
		AlipayDirectModel model = new AlipayDirectModel("测试商品", new BigDecimal(0.01), "1", (byte)1);
		attrs.addFlashAttribute(PayController.ALIPAY_DIRECT_MODEL, model);
		model.setExtraCommonParam("defaultAlipayCallback");
		attrs.addFlashAttribute("QrMode", qrMode);
		
		return "redirect:/pay/alipay.do";
		// AlipayUtils.redirectDirectPay(ThreadContextHolder.getHttpResponse(), model);
	}
	
	@RequestMapping(value = "/demo/refund")
	public String refund(RedirectAttributes attrs) throws IOException {
		AlipayRefundModel model = new AlipayRefundModel();
		String batchNo = new SimpleDateFormat("yyyyMMdd").format(new Date()) + "DEV0017";
		model.setBatchNo(batchNo);
		model.putItem(new AlipayRefundDataItem(new BigDecimal(0.01), "2016121321001004880235829067", "退款-测试商品"));
		
		attrs.addFlashAttribute(PayController.ALIPAY_REFUND_MODEL, model);
		return "redirect:/pay/alipay_refund.do";
	}

}
