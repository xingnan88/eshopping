package com.eshop.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
/**
 * �˴�����load-on-startup Servlet�ǲ��еģ�listener��������һЩ��
 * ��������Ϊ0Ҳ��log4j.properties�����ļ���
 * @author ��ϣ
 *
 */
public class LogListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent sce) {
	}

	public void contextInitialized(ServletContextEvent sce) {
		//��ȡ��ǰ·��
		String url = sce.getServletContext().getRealPath("/");
		//���ñ����������ļ���ȡ
		System.setProperty("path", url);

	}

}
