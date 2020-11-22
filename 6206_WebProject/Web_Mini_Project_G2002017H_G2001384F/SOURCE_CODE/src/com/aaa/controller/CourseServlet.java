package com.aaa.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.CourseService;
import com.aaa.service.impl.CourseServiceImpl;
import com.alibaba.fastjson.JSON;

public class CourseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private HttpServletRequest req = null;
	private HttpServletResponse resp = null;
	//多个方法，共用；直接提上来;
	CourseService courseService = new CourseServiceImpl();

	// Alt+/:快捷键，出来系统有的关键字或方法等;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// this:当前类对象
		this.req = req;
		this.resp = resp;
		String method = req.getParameter("method");
		if (method.equals("getCourseBaseInfo")) {
			getCourseBaseInfo();
		}else if(method.equals("getOneCourseDetail")){
			getOneCourseDetail();
		}else if(method.equals("getFirstCatalogInfo")){
			getFirstCatalogInfo();
		}else if(method.equals("getSecondCatalogInfo")){
			getSecondCatalogInfo();
		}

	}

	

	/**
	 * 获取二级列表
	 * @throws IOException 
	 */
	private void getSecondCatalogInfo() throws IOException {
		//需要处理标题乱码;
				resp.setCharacterEncoding("utf-8");
				String cid=req.getParameter("cid");
				//调用业务层的根据id，来获得一级标题;
				List<SecondCatalog>list=courseService.getSecondCatalog(Integer.parseInt(cid));
				
				String json=JSON.toJSONString(list);
				//使用ajax的时候，不需要页面转向，直接传值即可;
				resp.getWriter().print(json);
	}

	/**
	 * 获得一级标题
	 * @throws IOException 
	 */
	private void getFirstCatalogInfo() throws IOException {
		//需要处理标题乱码;
		resp.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		//调用业务层的根据id，来获得一级标题;
		List<FirstCatalog>list=courseService.getFirstCatalog(Integer.parseInt(id));
		String json=JSON.toJSONString(list);
		//使用ajax的时候，不需要页面转向，直接传值即可;
		resp.getWriter().print(json);
	}

	/**
	 * 得到一门课程信息详情;
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void getOneCourseDetail() throws ServletException, IOException {//alt+shift+j 出来方法的注释
		String id=req.getParameter("id");//得到隐藏域的id值;
		CourseBase courseBase=courseService.getCourseBaseById(Integer.parseInt(id));
		//只要从业务层取得数据之后，都要存起来到req请求对象或session
		req.setAttribute("coursebase", courseBase);
 		//首先获得当前用户对象;
 		UserLoginInfo user=(UserLoginInfo)req.getSession().getAttribute("user");
 		//写一个变量，用来存放是否已经选过课了;
 		//根据userid和courseid来查询表;
 		boolean isStudyCourse=courseService.isStudyCourse(user.getId(),courseBase.getId());
 		req.setAttribute("isStudyCourse", isStudyCourse);
 		req.getRequestDispatcher("/views/before/course.jsp").forward(req, resp);


 		//System.out.println(isStudyCourse);
//		
//		
//		req.getRequestDispatcher("/views/before/course.jsp").forward(req, resp);
	}

	// 私有的方法：获得基本课程信息;
	private void getCourseBaseInfo() throws ServletException, IOException {
		// 这里面应该调用业务层对象;
		List<CourseBase> list = courseService.selectAllCourse();
		// 有一定的判断，具体,设置请求对象的属性，list,对应的值是list;前面的list将来jsp页面要用的，后面的是上一行的值;
		req.setAttribute("list", list);
		// 转发(服务器端直接转)，重定向（客户端再次发送请求）
		req.getRequestDispatcher("/views/before/main.jsp").forward(req, resp);
	}
}