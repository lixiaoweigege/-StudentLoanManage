package com.java2019.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;
@Component(value="DateUtil")
public class DateUtil {
	public int compareMounth(String date) throws ParseException {
		String nowyear = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		String nowmounth = new SimpleDateFormat("MM").format(Calendar.getInstance().getTime());		
		java.util.Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);//定义起始日期
		SimpleDateFormat sdf0 = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM");		
		String str1 = sdf0.format(d1);
		String str2 = sdf1.format(d1);
		int comparemounth=(Integer.parseInt(nowyear)-Integer.parseInt(str1))*12+(Integer.parseInt(nowmounth)-Integer.parseInt(str2));		
		return comparemounth;
	}
}
