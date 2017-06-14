package com.i9he.m2b.model;

import java.util.List;

public class LogisticsViewModel extends LogisticsInfo{

	private static final long serialVersionUID = 1L;
	
	private List<LogisticsDetail> logisticsDetails;

	public List<LogisticsDetail> getLogisticsDetails() {
		return logisticsDetails;
	}

	public void setLogisticsDetails(List<LogisticsDetail> logisticsDetails) {
		this.logisticsDetails = logisticsDetails;
	}
	
}
