package com.i9he.m2b.server.form;

import com.i9he.m2b.model.AfterSale;
import com.i9he.m2b.model.AfterSaleRefund;
import com.i9he.m2b.model.AfterSaleShipping;

public class AfterSaleApplyForm {

	private AfterSale aftersale;

	private AfterSaleRefund refund;
	
	private AfterSaleShipping shipping;

	public AfterSale getAftersale() {
		return aftersale;
	}

	public void setAftersale(AfterSale aftersale) {
		this.aftersale = aftersale;
	}

	public AfterSaleRefund getRefund() {
		return refund;
	}

	public void setRefund(AfterSaleRefund refund) {
		this.refund = refund;
	}

	public AfterSaleShipping getShipping() {
		return shipping;
	}

	public void setShipping(AfterSaleShipping shipping) {
		this.shipping = shipping;
	}

	
}
