package com.aaa.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * 封装
 * @author zh
 *
 */
public class AjaxWriter {
	public static void write(HttpServletResponse resp,Object obj){
		//ajax三种类型：text;json:对象传值，用这个；xml传递；
		resp.setContentType("json;charset=utf-8");
		try {
			resp.getWriter().print(JSON.toJSONString(obj));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
