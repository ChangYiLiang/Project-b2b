package com.i9he.zq.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SysPropertiesUtil {

	private static Properties properties = new Properties();
	static{
		InputStream inputStream = SysPropertiesUtil.class.getClassLoader().getResourceAsStream("config.properties");
		try {
			properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 读取到properties的key对应的value值
	 * @param key
	 * @return
	 */
	public static String getKey(String key){
		return properties.getProperty(key);
	}
	
}
