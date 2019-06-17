package com.atguigu.atcrowdfunding.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServerStartupListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//w将web应用名称(路劲)保存到application范围中
		ServletContext application = sce.getServletContext();
		String path = application.getContextPath();
		application.setAttribute("APP_PATH", path);

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

}
