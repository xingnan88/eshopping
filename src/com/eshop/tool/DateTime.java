package com.eshop.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
	public static String getDateAndTime(){
		Date d = new Date();
		String dt;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
		dt = sdf.format(d);
		return dt;
	}
	public static String getDate(){
		Date d = new Date();
		String dt;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dt = sdf.format(d);
		return dt;
	}
	public static void main(String[] args){
		System.out.println(getDate());
	}
}
