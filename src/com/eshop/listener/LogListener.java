package com.eshop.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
/**
 * 此处若用load-on-startup Servlet是不行的，listener比它更早一些，
 * 而它设置为0也比log4j.properties配置文件晚
 * @author 苏希
 *
 */
public class LogListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent sce) {
	}

	public void contextInitialized(ServletContextEvent sce) {
		//获取当前路径
		String url = sce.getServletContext().getRealPath("/");
		//设置变量供配置文件读取
		System.setProperty("path", url);

	}

}
