package com.i9he.m2b.manage.utils;

import com.i9he.m2b.model.Item;



public class ItemViewModel extends Item {

	public ItemViewModel(Item item) {
		this.setId(item.getId());
		this.setTitle(item.getTitle());
		this.setPrice(item.getPrice());
		this.setItemType(item.getItemType());
	}

}