package com.i9he.m2b.model;

import java.io.Serializable;
import java.util.Date;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class LogisticsDetail implements Serializable {

	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.logistic_code
	 * @mbggenerated
	 */
	@NotEmpty(message = "{m2b.logisticsdetail.logisticCode.validation.notempty}")
	@Length(message = "{m2b.logisticsdetail.logisticCode.validation.length}", max = 50)
	private String logisticCode;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.accept_time
	 * @mbggenerated
	 */
	private Date acceptTime;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.accept_station
	 * @mbggenerated
	 */
	@Length(message = "{m2b.logisticsdetail.acceptStation.validation.length}", max = 255)
	private String acceptStation;
	/**
	 * This field was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail
	 * @mbggenerated
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.logistic_code
	 * @return  the value of b2b_logistics_detail.logistic_code
	 * @mbggenerated
	 */
	public String getLogisticCode() {
		return logisticCode;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.logistic_code
	 * @param logisticCode  the value for b2b_logistics_detail.logistic_code
	 * @mbggenerated
	 */
	public void setLogisticCode(String logisticCode) {
		this.logisticCode = logisticCode == null ? null : logisticCode.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.accept_time
	 * @return  the value of b2b_logistics_detail.accept_time
	 * @mbggenerated
	 */
	public Date getAcceptTime() {
		return acceptTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.accept_time
	 * @param acceptTime  the value for b2b_logistics_detail.accept_time
	 * @mbggenerated
	 */
	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.accept_station
	 * @return  the value of b2b_logistics_detail.accept_station
	 * @mbggenerated
	 */
	public String getAcceptStation() {
		return acceptStation;
	}

	/**
	 * This method was generated by MyBatis Generator. copyright @ www.9he.com b2b_logistics_detail.accept_station
	 * @param acceptStation  the value for b2b_logistics_detail.accept_station
	 * @mbggenerated
	 */
	public void setAcceptStation(String acceptStation) {
		this.acceptStation = acceptStation == null ? null : acceptStation
				.trim();
	}
}