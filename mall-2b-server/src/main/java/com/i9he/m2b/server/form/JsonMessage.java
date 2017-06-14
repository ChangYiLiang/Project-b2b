package com.i9he.m2b.server.form;

import com.alibaba.fastjson.JSON;

public class JsonMessage {

	public JsonMessage() {

	}

	public JsonMessage(int res, String message) {
		this.res = res;
		this.message = message;
	}

	public JsonMessage(int res, String message, Object... args) {
		this.res = res;
		this.message = message;
		this.args = args;
	}

	private int res;

	private String message;

	private Object[] args;

	public int getRes() {
		return res;
	}

	public void setRes(int res) {
		this.res = res;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getArgs() {
		return args;
	}

	public void setArgs(Object[] args) {
		this.args = args;
	}

	public String toJSONString() {
		return JSON.toJSONString(this);
	}

}
