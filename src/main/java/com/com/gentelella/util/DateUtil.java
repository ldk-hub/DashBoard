package com.com.gentelella.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import org.apache.log4j.spi.LoggerFactory;
import org.slf4j.Logger;


public final class DateUtil {
	
	 //protected Logger logger = LoggerFactory.getLogger(this.getClass());
	    
	    public static final String DATE_MILLISECOND_FORMAT_STRING = "yyyyMMddHHmmssSSS";
	    
	    /**
	     * <p>
	     * yyyyMMdd 혹은 yyyy-MM-dd 형식의 날짜 문자열을 입력 받아 년, 월, 일을 증감한다. 년, 월, 일은 가감할 수를
	     * 의미하며, 음수를 입력할 경우 감한다.
	     * </p>
	     *
	     * <pre>
	     * DateUtil.addYearMonthDay("19810828", 0, 0, 19)  = "19810916"
	     * DateUtil.addYearMonthDay("20060228", 0, 0, -10) = "20060218"
	     * DateUtil.addYearMonthDay("20060228", 0, 0, 10)  = "20060310"
	     * DateUtil.addYearMonthDay("20060228", 0, 0, 32)  = "20060401"
	     * DateUtil.addYearMonthDay("20050331", 0, -1, 0)  = "20050228"
	     * DateUtil.addYearMonthDay("20050301", 0, 2, 30)  = "20050531"
	     * DateUtil.addYearMonthDay("20050301", 1, 2, 30)  = "20060531"
	     * DateUtil.addYearMonthDay("20040301", 2, 0, 0)   = "20060301"
	     * DateUtil.addYearMonthDay("20040229", 2, 0, 0)   = "20060228"
	     * DateUtil.addYearMonthDay("20040229", 2, 0, 1)   = "20060301"
	     * </pre>
	     *
	     * @param dateStr
	     *            날짜 문자열(yyyyMMdd, yyyy-MM-dd의 형식)
	     * @param year
	     *            가감할 년. 0이 입력될 경우 가감이 없다
	     * @param month
	     *            가감할 월. 0이 입력될 경우 가감이 없다
	     * @param day
	     *            가감할 일. 0이 입력될 경우 가감이 없다
	     * @return yyyyMMdd 형식의 날짜 문자열
	     * @throws IllegalArgumentException
	     *             날짜 포맷이 정해진 바와 다를 경우. 입력 값이 <code>null</code>인 경우.
	     */
	    public static String addYearMonthDay(String sDate, int year, int month, int day) {
	        String dateStr = validChkDate(sDate);
	        
	        Calendar cal = Calendar.getInstance();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());
	        
	        try {
	            cal.setTime(sdf.parse(dateStr));
	        } catch (ParseException e) {
	            throw new IllegalArgumentException("Invalid date format: " + dateStr);
	        }
	        
	        if (year != 0)
	            cal.add(Calendar.YEAR, year);
	        if (month != 0)
	            cal.add(Calendar.MONTH, month);
	        if (day != 0)
	            cal.add(Calendar.DATE, day);
	        
	        return sdf.format(cal.getTime());
	    }
	    
	    /**
	     * <p>
	     * yyyyMMdd 혹은 yyyy-MM-dd 형식의 날짜 문자열을 입력 받아 년을 증감한다. <code>year</code>는 가감할
	     * 수를 의미하며, 음수를 입력할 경우 감한다.
	     * </p>
	     *
	     * <pre>
	     * DateUtil.addYear("20000201", 62)  = "20620201"
	     * DateUtil.addYear("20620201", -62) = "20000201"
	     * DateUtil.addYear("20040229", 2)   = "20060228"
	     * DateUtil.addYear("20060228", -2)  = "20040228"
	     * DateUtil.addYear("19000101", 200) = "21000101"
	     * </pre>
	     *
	     * @param dateStr
	     *            날짜 문자열(yyyyMMdd, yyyy-MM-dd의 형식)
	     * @param year
	     *            가감할 년. 0이 입력될 경우 가감이 없다
	     * @return yyyyMMdd 형식의 날짜 문자열
	     * @throws IllegalArgumentException
	     *             날짜 포맷이 정해진 바와 다를 경우. 입력 값이 <code>null</code>인 경우.
	     */
	    public static String addYear(String dateStr, int year) {
	        return addYearMonthDay(dateStr, year, 0, 0);
	    }
	    
	    /**
	     * <p>
	     * yyyyMMdd 혹은 yyyy-MM-dd 형식의 날짜 문자열을 입력 받아 월을 증감한다. <code>month</code>는 가감할
	     * 수를 의미하며, 음수를 입력할 경우 감한다.
	     * </p>
	     *
	     * <pre>
	     * DateUtil.addMonth("20010201", 12)  = "20020201"
	     * DateUtil.addMonth("19800229", 12)  = "19810228"
	     * DateUtil.addMonth("20040229", 12)  = "20050228"
	     * DateUtil.addMonth("20050228", -12) = "20040228"
	     * DateUtil.addMonth("20060131", 1)   = "20060228"
	     * DateUtil.addMonth("20060228", -1)  = "20060128"
	     * </pre>
	     *
	     * @param dateStr
	     *            날짜 문자열(yyyyMMdd, yyyy-MM-dd의 형식)
	     * @param month
	     *            가감할 월. 0이 입력될 경우 가감이 없다
	     * @return yyyyMMdd 형식의 날짜 문자열
	     * @throws IllegalArgumentException
	     *             날짜 포맷이 정해진 바와 다를 경우. 입력 값이 <code>null</code>인 경우.
	     */
	    public static String addMonth(String dateStr, int month) {
	        return addYearMonthDay(dateStr, 0, month, 0);
	    }
	    
	    /**
	     * <p>
	     * yyyyMMdd 혹은 yyyy-MM-dd 형식의 날짜 문자열을 입력 받아 일(day)를 증감한다. <code>day</code>는
	     * 가감할 수를 의미하며, 음수를 입력할 경우 감한다. <br/>
	     * <br/>
	     * 위에 정의된 addDays 메서드는 사용자가 ParseException을 반드시 처리해야 하는 불편함이 있기 때문에 추가된
	     * 메서드이다.
	     * </p>
	     *
	     * <pre>
	     * DateUtil.addDay("19991201", 62) = "20000201"
	     * DateUtil.addDay("20000201", -62) = "19991201"
	     * DateUtil.addDay("20050831", 3) = "20050903"
	     * DateUtil.addDay("20050831", 3) = "20050903"
	     * // 2006년 6월 31일은 실제로 존재하지 않는 날짜이다 -> 20060701로 간주된다
	     * DateUtil.addDay("20060631", 1) = "20060702"
	     * </pre>
	     *
	     * @param dateStr
	     *            날짜 문자열(yyyyMMdd, yyyy-MM-dd의 형식)
	     * @param day
	     *            가감할 일. 0이 입력될 경우 가감이 없다
	     * @return yyyyMMdd 형식의 날짜 문자열
	     * @throws IllegalArgumentException
	     *             날짜 포맷이 정해진 바와 다를 경우. 입력 값이 <code>null</code>인 경우.
	     */
	    public static String addDay(String dateStr, int day) {
	        return addYearMonthDay(dateStr, 0, 0, day);
	    }
	    
	    /**
	     * 입력된 일자 문자열을 확인하고 8자리로 리턴
	     *
	     * @param sDate
	     * @return
	     */
	    public static String validChkDate(String dateStr) {
	        String _dateStr = dateStr;
	        
	        if (dateStr == null || !(dateStr.trim().length() == 8 || dateStr.trim().length() == 10)) {
	            throw new IllegalArgumentException("Invalid date format: " + dateStr);
	        }
	        
	        if (dateStr.length() == 10) {
	            _dateStr = dateStr.replaceAll("\\D", "");
	        }
	        
	        return _dateStr;
	    }
	    
	    /**
	     * 입력된 포멧에 맞춰 현재 날짜를 리턴
	     *
	     * @param format
	     * @return
	     */
	    public static String getNowDate(String format) {
	        DateFormat dtFormat = new SimpleDateFormat(format);
	        Date date = new Date();
	        
	        return dtFormat.format(date);
	    }
	    
	    /**
	     * 날짜형태의 String의 날짜 포맷 및 TimeZone을 변경해 주는 메서드
	     *
	     * @param strSource 바꿀 날짜 String
	     * @param fromDateFormat 기존의 날짜 형태
	     * @param toDateFormat 원하는 날짜 형태
	     * @param strTimeZone 변경할 TimeZone(""이면 변경 안함)
	     * @return 소스 String의 날짜 포맷을 변경한 String
	     */
	    public static String convertDate(String strSource, String fromDateFormat, String toDateFormat, String strTimeZone) {
	        SimpleDateFormat simpledateformat = null;
	        Date date = null;
	        
	        String _fromDateFormat = fromDateFormat;
	        String _toDateFormat = toDateFormat;
	        
	        if ("".equals(strSource)) {
	            return "";
	        }
	        
	        if ("".equals(_fromDateFormat))
	            _fromDateFormat = "yyyyMMddHHmmss";     // default값
	        if ("".equals(_toDateFormat))
	            _toDateFormat = "yyyy-MM-dd HH:mm:ss";  // default값
	        
	        try {
	            simpledateformat = new SimpleDateFormat(_fromDateFormat, Locale.getDefault());
	            
	            date = simpledateformat.parse(strSource);
	            
	            if (!"".equals(strTimeZone)) {
	                simpledateformat.setTimeZone(TimeZone.getTimeZone(strTimeZone));
	            }
	            
	            simpledateformat = new SimpleDateFormat(_toDateFormat, Locale.getDefault());
	        } catch (Exception exception) {
	            
	        }
	        
	        return simpledateformat.format(date);
	    }
	    
	    /**
	     * 현재 시간은 문자 타입으로 변환해 주는 메서드
	     *
	     * @return  날짜 포맷을 변경한 String
	     */
	    public static String getNow(){
	        String now = "";
	        
	        SimpleDateFormat simpleFomat = new SimpleDateFormat(DATE_MILLISECOND_FORMAT_STRING);
	        Date currentTime = new Date();
	        now = simpleFomat.format(currentTime);
	        
	        return now;
	    }
}
