package com.i9he.m2b.model;

import java.io.Serializable;

public class UserRegisterNumber implements Serializable {
	
	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		private Integer nowDay;
	    
	    private Integer nowMonth;
	    
	    private Integer nowCurdate;

		public Integer getNowDay() {
			return nowDay;
		}

		public void setNowDay(Integer nowDay) {
			this.nowDay = nowDay;
		}

		public Integer getNowMonth() {
			return nowMonth;
		}

		public void setNowMonth(Integer nowMonth) {
			this.nowMonth = nowMonth;
		}

		public Integer getNowCurdate() {
			return nowCurdate;
		}

		public void setNowCurdate(Integer nowCurdate) {
			this.nowCurdate = nowCurdate;
		}

		@Override
		public String toString() {
			return "UserRegisterNumber [nowDay=" + nowDay + ", nowMonth=" + nowMonth + ", nowCurdate=" + nowCurdate + "]";
		}
	    
	    
}
