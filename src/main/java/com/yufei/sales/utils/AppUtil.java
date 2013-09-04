package com.yufei.sales.utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jndi.JndiObjectTargetSource;

import com.yufei.utils.XPathUtil;

public class AppUtil {
private static Log mLog = LogFactory.getLog(AppUtil.class);

private static ApplicationContext appContext=null;


final static String defaultSpringConfigPath="conf/app.xml";









public static Object getBeanFromBeanContainer(String name){
	return getAppContext().getBean(name);
	
}
public static Object getBeanFromBeanContainer(Class c){
	return getAppContext().getBean(c);
	
}//初始化各种类型连接处理对象


public static Object getEjb(String name){
	return ((JndiObjectTargetSource)getAppContext().getBean(name)).getTarget();
	
}

private static ApplicationContext getAppContext(){
	appContext=appContext== null?new ClassPathXmlApplicationContext(defaultSpringConfigPath):appContext;
	return appContext;
	
	
}




public static String getVlaue(String xpath){
	String value=null;
	try {
		value=XPathUtil.getNodeTextByXPath(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.xml"), xpath);
	} catch (Exception e) {
		// TODO Auto-generated catch block
       return null;
        }
	return value;
}


































































































}
