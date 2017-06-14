package com.i9he.m2b.server.form;

import com.i9he.m2b.model.PurchaseRequirement;
import com.i9he.m2b.model.PurchaseRequirementGoods;

public class PurchaseRequirementForm {

	private PurchaseRequirement requirement;

	private PurchaseRequirementGoods goods;

	public PurchaseRequirement getRequirement() {
		return requirement;
	}

	public void setRequirement(PurchaseRequirement requirement) {
		this.requirement = requirement;
	}

	public PurchaseRequirementGoods getGoods() {
		return goods;
	}

	public void setGoods(PurchaseRequirementGoods goods) {
		this.goods = goods;
	}

}
