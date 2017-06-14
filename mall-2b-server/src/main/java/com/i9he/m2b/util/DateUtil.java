package com.i9he.m2b.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;

/**
 * <功能详细描述>日期处理
 * 
 * @author： 陈亮平
 * @version： v1.0 创建时间: 2011-11-18
 */
public class DateUtil {

	public static final SimpleDateFormat DF_YYYY_MM_DD = new SimpleDateFormat("yyyy-MM-dd");

	public static final SimpleDateFormat DF_YYYYMMDD = new SimpleDateFormat("yyyyMMdd");

	public static final SimpleDateFormat DF_YYYY_MM_DD_CHN = new SimpleDateFormat("yyyy年MM月dd日");

	public static final SimpleDateFormat DF_YYYY_MM_DD_HH_MM_SS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static final SimpleDateFormat DF_YYYY_MM_DD_HH_MM = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	public static final SimpleDateFormat DF_YYYY_MM = new SimpleDateFormat("yyyy-MM");

	public static final SimpleDateFormat DF_YYYY = new SimpleDateFormat("yyyy");

	public static final SimpleDateFormat DF_YYYYMM = new SimpleDateFormat("yyyyMM");

	public static final SimpleDateFormat DF_YYYY_MM_CHN = new SimpleDateFormat("yyyy年MM月");

	/**
	 * 获取系统当前时间
	 */
	public static Date getSysDate() {
		return new java.util.Date();
	}

	/**
	 * 格式化时间, yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 */
	public static String formateDate(Date date) {
		return DateUtil.formateDate(date, DF_YYYY_MM_DD);
	}

	/**
	 * 按指定的格式进行日期格式化
	 * 
	 * @param value
	 * @param formate
	 * @return
	 */
	public static String formateDate(Date date, SimpleDateFormat formate) {
		if (date == null) {
			return "";
		} else {
			return formate.format(date);
		}
	}

	/**
	 * 格式化成NUMBER
	 * 
	 * @param date
	 * @return
	 */
	public static Long formateDateToNum(Date date) {
		if (date == null) {
			return null;
		} else {
			return Long.parseLong(DF_YYYYMMDD.format(date));
		}
	}

	/**
	 * 格式化成NUMBER
	 * 
	 * @param date
	 * @return
	 */
	public static Long formateDateToNum(Date date, SimpleDateFormat formate) {
		if (date == null) {
			return null;
		} else {
			return Long.parseLong(formate.format(date));
		}
	}

	/**
	 * 将STRING转换成DATE
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Date parseDate(String date) throws ParseException {
		if (StringUtils.isNotBlank(date)) {
			return DF_YYYY_MM_DD.parse(date);
		} else {
			return null;
		}
	}

	/**
	 * 将STRING转换成DATE
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Date parseDate(String date, SimpleDateFormat formate) throws ParseException {
		if (StringUtils.isNotBlank(date)) {
			return formate.parse(date);
		} else {
			return null;
		}
	}

	/**
	 * 日期
	 * 
	 * @param value
	 * @param amount
	 * @return
	 */
	public static Date addDays(Date date, int amount) {
		if (date == null) {
			return null;
		} else {
			return DateUtils.addDays(date, amount);
		}
	}

	/**
	 * 加月
	 * 
	 * @param date
	 * @param amount
	 * @return
	 */
	public static Date addMonths(Date date, int amount) {
		if (date == null) {
			return null;
		} else {
			return DateUtils.addMonths(date, amount);
		}
	}

	/**
	 * 转换java.util.date-->java.sql.date
	 * 
	 * @param d
	 * @return
	 */
	public static java.sql.Date convertUtilDate(Date d) {
		return new java.sql.Date(d.getTime());
	}

	/**
	 * 比较两个日期大小
	 * 
	 * @param da
	 * @param db
	 * @return -1: da < db 0 : da = db 1 : da > db -9: 同时为空
	 */
	public static int compareDate(Date da, Date db) {
		if (da == null && db == null) {
			return -9;
		} else if (da != null && db == null) {
			return 1;
		} else if (da == null && db != null) {
			return -1;
		} else {
			Calendar ca = Calendar.getInstance();
			ca.setTime(da);
			Calendar cb = Calendar.getInstance();
			cb.setTime(db);
			return compareDate(ca, cb);
		}
	}

	/**
	 * @param ca
	 * @param cb
	 * @return
	 */
	private static int compareDate(Calendar ca, Calendar cb) {
		if (ca.before(cb)) {
			return -1;
		} else if (ca.after(cb)) {
			return 1;
		} else if (ca.equals(cb)) {
			return 0;
		} else {
			// 不会发生，忽略
			return -9;
		}
	}

	/**
	 * 获取天
	 * 
	 * @param d
	 * @return
	 */
	public static int getDay(Date d) {
		Calendar ca = Calendar.getInstance();
		ca.setTime(d);
		return ca.get(Calendar.DATE);
	}

	/**
	 * 获取月
	 * 
	 * @param d
	 * @return
	 */
	public static int getMonth(Date d) {
		Calendar ca = Calendar.getInstance();
		ca.setTime(d);
		return ca.get(Calendar.MONTH) + 1;
	}

	/**
	 * 获取年
	 * 
	 * @param d
	 * @return
	 */
	public static int getYear(Date d) {
		Calendar ca = Calendar.getInstance();
		ca.setTime(d);
		return ca.get(Calendar.YEAR);
	}

	/**
	 * 是否是同一个月
	 * 
	 * @param da
	 * @param db
	 * @return
	 */
	public static boolean isSameMonth(Date da, Date db) {
		if (da != null && db != null) {
			Calendar ca = Calendar.getInstance();
			ca.setTime(da);
			Calendar cb = Calendar.getInstance();
			cb.setTime(db);
			return (ca.get(Calendar.YEAR) == cb.get(Calendar.YEAR)) && (ca.get(Calendar.MONTH) == cb.get(Calendar.MONTH));
		} else {
			return false;
		}
	}

	/**
	 * 获取当前累加月份的时间
	 * 
	 * @param dates
	 *            当前时间
	 * @param months
	 *            根据月份累加
	 * @return Date
	 * @see [类、类#方法、类#成员]
	 */
	public static Date getNextDate(Date dates, Integer months) {
		// 创建日历类
		Calendar cal = Calendar.getInstance();
		cal.setTime(dates); // 赋值当前客户订购的时间
		int maxDay = cal.getActualMaximum(Calendar.DATE); // 取当前订购时间的最大天数
		int clientMaxDay = DateUtil.getDay(dates); // 取客户的订购时间的天数
		// 客户订购的天数是当前月最大天数，则自动匹配下个月及最大天数，否则，月份只加1
		Date tempDate;
		if (maxDay == clientMaxDay) {
			tempDate = DateUtil.addMonths(dates, months); // 月份+
			cal.setTime(tempDate);
			int tempDay = cal.getActualMaximum(Calendar.DATE); // 取下个月的最大天数
			tempDate.setDate(tempDay); // 修改为最大天数
		} else {
			tempDate = DateUtil.addMonths(dates, months);
		}
		return tempDate;
	}

	/**
	 * 获取当前一个小时后的时间
	 */
	public static Date getLastHourTime(int lastNum) {
		java.util.Calendar cal = java.util.Calendar.getInstance();
		cal.setTime(new java.util.Date());
		cal.add(java.util.Calendar.HOUR_OF_DAY, lastNum);
		return cal.getTime();
	}

	/**
	 * 获取当前指定分钟后的时间
	 * 
	 * @param lastNum
	 * @return
	 */
	public static Date getLastMinuteTime(int lastNum) {
		java.util.Calendar cal = java.util.Calendar.getInstance();
		cal.setTime(new java.util.Date());
		cal.add(java.util.Calendar.MINUTE, lastNum);
		return cal.getTime();
	}

	/**
	 * 获取当前下个月的时间
	 */
	public static Date getNextDate(Date dates) {
		// 创建日历类
		Calendar cal = Calendar.getInstance();
		cal.setTime(dates); // 赋值当前客户订购的时间
		int maxDay = cal.getActualMaximum(Calendar.DATE); // 取当前订购时间的最大天数
		int clientMaxDay = DateUtil.getDay(dates); // 取客户的订购时间的天数
		// 客户订购的天数是当前月最大天数，则自动匹配下个月及最大天数，否则，月份只加1
		Date tempDate;
		if (maxDay == clientMaxDay) {
			tempDate = DateUtil.addMonths(dates, 1); // 月份+1
			cal.setTime(tempDate);
			int tempDay = cal.getActualMaximum(Calendar.DATE); // 取下个月的最大天数
			tempDate.setDate(tempDay); // 修改为最大天数
		} else {
			tempDate = DateUtil.addMonths(dates, 1);
		}
		return tempDate;
	}

	/**
	 * 时间减去天数
	 * 
	 * @param date
	 * @param day
	 * @return Date
	 * @see [类、类#方法、类#成员]
	 */
	public static Date minusDay(Date date, int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, -day);
		Date d2 = calendar.getTime();
		return d2;
	}

	/**
	 * 时间比较大小
	 * 
	 * @param a
	 * @param b
	 * @return hour
	 * @see [类、类#方法、类#成员]
	 */
	public static Long compareDates(Date currDate, Date compareDate) {
		try {
			java.util.Date now = DF_YYYY_MM_DD_HH_MM_SS.parse(DF_YYYY_MM_DD_HH_MM_SS.format(currDate));
			java.util.Date date = DF_YYYY_MM_DD_HH_MM_SS.parse(DF_YYYY_MM_DD_HH_MM_SS.format(compareDate));
			long l = now.getTime() - date.getTime();
			long day = l / (24 * 60 * 60 * 1000);
			long hour = (l / (60 * 60 * 1000) - day * 24);
			// long min = ((l / (60 * 1000)) - day * 24 * 60 - hour * 60);
			// long s = (l / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min *
			// 60);
			return hour;
		} catch (Exception e) {
		}
		return 0L;
	}

	/**
	 * 获取当前月份第一天 格式为:2012-8-1
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentMonthFirstDay() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0);
		c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		String first = DF_YYYY_MM_DD.format(c.getTime());
		return first;
	}

	/**
	 * 获取当前月份最后一天 格式为:2012-8-31
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentMonthLastDay() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar ca = Calendar.getInstance();
		ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
		String last = format.format(ca.getTime());
		return last;
	}

	/**
	 * 把普通的JAVA日期字符串　转换为yyyy-MM-dd hh:ss:mm形式字符串
	 * 
	 * @param commonDateStr
	 *            最普通的JAVA日期字符串：格式为Tue May 25 10:46:14 CST 2010
	 * @return　yyyy-MM-dd hh:ss:mm形式字符串
	 * @see [类、类#方法、类#成员]
	 */
	public static String convertCommonDateStr(String commonDateStr) {
		StringBuffer result = new StringBuffer("");
		String[] arrStr = commonDateStr.split(" ");
		result.append(arrStr[5]).append("-");// 年-
		result.append(convertMonthStr(arrStr[1], true)).append("-");// 月-
		result.append(arrStr[2]).append(" ");// 日 　
		result.append(arrStr[3]);// 时:分:秒
		return result.toString();
	}

	/**
	 * 把英文的月份转找为数字 Thu May 10 13:08:08 CST 2012
	 * 
	 * @param monthStr
	 * @param isWithZero当月份小于10时
	 *            ，前面是否带0
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String convertMonthStr(String monthStr, boolean isWithZero) {
		String monthResult = "";
		if ("Jan".equals(monthStr))
			monthResult = "01";
		else if ("Feb".equals(monthStr))
			monthResult = "02";
		else if ("Mar".equals(monthStr))
			monthResult = "03";
		else if ("Apr".equals(monthStr))
			monthResult = "04";
		else if ("May".equals(monthStr))
			monthResult = "05";
		else if ("Jun".equals(monthStr))
			monthResult = "06";
		else if ("Jul".equals(monthStr))
			monthResult = "07";
		else if ("Aug".equals(monthStr))
			monthResult = "08";
		else if ("Sep".equals(monthStr))
			monthResult = "09";
		else if ("Oct".equals(monthStr))
			monthResult = "10";
		else if ("Nov".equals(monthStr))
			monthResult = "11";
		else if ("Dec".equals(monthStr))
			monthResult = "12";

		if (!isWithZero) {
			if (monthResult.startsWith("0"))
				monthResult = monthResult.substring(1, 2);
		}
		return monthResult;
	}

	/**
	 * 获取指定几个月后的日期
	 */
	public static Date getDate(Date dates, int number) {
		// 创建日历类
		Calendar cal = Calendar.getInstance();
		cal.setTime(dates); // 赋值当前客户订购的时间
		int maxDay = cal.getActualMaximum(Calendar.DATE); // 取当前订购时间的最大天数
		int clientMaxDay = DateUtil.getDay(dates); // 取客户的订购时间的天数
		// 客户订购的天数是当前月最大天数，则自动匹配下个月及最大天数，否则，月份只加1
		Date tempDate;
		if (maxDay == clientMaxDay) {
			tempDate = DateUtil.addMonths(dates, number);
			cal.setTime(tempDate);
			int tempDay = cal.getActualMaximum(Calendar.DATE); // 取下个月的最大天数
			tempDate.setDate(tempDay); // 修改为最大天数
		} else {
			tempDate = DateUtil.addMonths(dates, number);
		}
		return tempDate;
	}

	/**
	 * 两个时间之间的天数
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */

	public static long getDays(String date1, String date2) {
		if (date1 == null || date1.equals(""))
			return 0;
		if (date2 == null || date2.equals(""))
			return 0;
		// 转换为标准时间
		Date date = null;
		Date mydate = null;
		try {
			date = DF_YYYY_MM_DD.parse(date1);
			mydate = DF_YYYY_MM_DD.parse(date2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
	}

	/**
	 * 获取指定时间是当前年份的周期
	 * 
	 * @param date
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentYearCycle(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		String week = Integer.toString(c.get(Calendar.WEEK_OF_YEAR));
		if (week.length() == 1)
			week = "0" + week;
		return week;
	}

	/**
	 * 获取指定时间在当前月份的周期
	 * 
	 * @param date
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getCurrentMonthCycle(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.setFirstDayOfWeek(Calendar.MONDAY); // 设置每周的第一天为星期一
		return String.valueOf(calendar.get(Calendar.DAY_OF_WEEK_IN_MONTH));
	}

	/**
	 * 获取指定月份的时间
	 * 
	 * @param month
	 * @return 比如今天2012-09-18 指定 5月份的时间就是2012-05-18， 只改变月份不改变年份以及日期年份随着当前年份而改变
	 */
	public static Date getDesignationMonthDate(int month) {
		Date returnDate = null;
		String date = "";
		int year = DateUtil.getYear(new Date());
		int day = DateUtil.getDay(new Date());
		date = year + "-" + month + "-" + day;
		try {
			returnDate = DateUtil.parseDate(date);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return returnDate;
	}

	/**
	 * 根据日期获取星期数
	 * 
	 * @param dates
	 * @return 星期一、星期二等
	 * @see [类、类#方法、类#成员]
	 */
	public static String getWeek(Date dates) {
		// 计算星期数
		if (dates != null) {
			String result = "";
			String[] str = new String[] { "", "一", "二", "三", "四", "五", "六", "天" };
			Calendar cal = Calendar.getInstance();
			cal.setTime(dates);
			if (cal.get(Calendar.DAY_OF_WEEK) == 1) {
				result = "星期天";
			} else {
				int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
				result = "星期" + str[week];
			}
			return result;
		} else {
			return "";
		}
	}

	/**
	 * 获取指定秒后的事件
	 * 
	 * @param date
	 * @param amount
	 * @return
	 */
	public static Date getDateBySecond(Date date, int amount) {
		return DateUtils.addSeconds(date, amount);
	}

	/**
	 * 得到自己设置的一个时间
	 * 
	 * @author chenjiaxing
	 * @param date
	 *            日期
	 * @param hour
	 *            时
	 * @param minute
	 *            分
	 * @param second
	 *            秒
	 * @return
	 */
	public static Date getDateTime(Date date, int hour, int minute, int second) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, hour);
		calendar.set(Calendar.MINUTE, minute);
		calendar.set(Calendar.SECOND, second);
		return calendar.getTime();
	}

	/**
	 * 判断是否是同一天
	 * 
	 * @author zhengxg
	 * @param da
	 * @param db
	 * @return
	 */
	public static boolean isSameDay(Date da, Date db) {
		if (da != null && db != null) {
			Calendar ca = Calendar.getInstance();
			ca.setTime(da);
			Calendar cb = Calendar.getInstance();
			cb.setTime(db);
			return (ca.get(Calendar.YEAR) == cb.get(Calendar.YEAR)) && (ca.get(Calendar.MONTH) == cb.get(Calendar.MONTH)) && (ca.get(Calendar.DATE) == cb.get(Calendar.DATE));
		} else {
			return false;
		}
	}

	/**
	 * da 是否是 db的前一天
	 * 
	 * @author zhengxg
	 * @param da
	 * @param db
	 * @return
	 */
	public static boolean isYesterday(Date da, Date db) {
		if (da != null && db != null) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(db);
			calendar.add(Calendar.DATE, -1);
			Date date = calendar.getTime();

			Calendar ca = Calendar.getInstance();
			ca.setTime(da);
			Calendar cb = Calendar.getInstance();
			cb.setTime(date);
			return (ca.get(Calendar.YEAR) == cb.get(Calendar.YEAR)) && (ca.get(Calendar.MONTH) == cb.get(Calendar.MONTH)) && (ca.get(Calendar.DATE) == cb.get(Calendar.DATE));

		} else {
			return false;
		}
	}
}