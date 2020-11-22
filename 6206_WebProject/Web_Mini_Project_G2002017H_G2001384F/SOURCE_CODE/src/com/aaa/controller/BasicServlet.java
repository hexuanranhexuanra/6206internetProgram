package com.aaa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aaa.entity.BasicInfo;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.BasicinfoService;
import com.aaa.service.UserService;
import com.aaa.service.impl.BasicServiceImpl;
import com.aaa.service.impl.UserServiceImpl;

/**
 * 我们可以封装出来一个Servlet，名字叫ActionServlet;
 * @author 张晨光
 *
 */
/**
 * @author zh
 *
 */
public class BasicServlet extends HttpServlet {

	protected HttpServletRequest req=null;
	protected HttpServletResponse resp=null;
	private static final long serialVersionUID = 1L;
	//增加业务层 对象;
	BasicinfoService basicService=new BasicServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		String method=req.getParameter("method");
		int userid=Integer.parseInt(req.getParameter("userid"));
		BasicInfo basicInfo=new BasicInfo();
		if(method.equals("getBasicinfo")){
			getBasicinfo(userid);
		}else if(method.equals("updateBasic")){
			updateBasic(basicInfo,userid);
		}
	}

	

	/**
	 * 根据用户id，来更新其基本信息;
	 * @param basicInfo
	 * @param userid
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void updateBasic(BasicInfo basicInfo, int userid) throws ServletException, IOException {
		//需要有这个信息;
		basicInfo.setSex(Integer.parseInt(req.getParameter("sex")));
		basicInfo.setEmail(req.getParameter("email"));
		basicInfo.setCard(req.getParameter("card"));
		//调用业务对象进行处理 
		int result=basicService.updateBasicinfo(basicInfo, userid);
		if(result>0){
			getBasicinfo(userid);
		}
	}

	/**
	 * 根据用户id，来获得基本信息
	 * @param userid 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void getBasicinfo(int userid) throws ServletException, IOException {
		BasicInfo basicInfo=basicService.getBasicinfo(userid);
		req.setAttribute("basicinfo", basicInfo);
		//服务器端的转发
		UserService userService=new UserServiceImpl();
		//再次查询新的用户信息，同步更新用户，这样就得到新了的头像。
		UserLoginInfo user=((UserLoginInfo)req.getSession().getAttribute("user"));
		String tel=user.getTelephone();
		String pwd=user.getPassword();
		user=userService.selectByTelAndPwd(tel, pwd);
		//再次放到session,这样页面端调用的时候，就ok了。
		req.getSession().setAttribute("user", user);
		
		req.getRequestDispatcher("views/before/student/student-info.jsp").forward(req, resp);
	}
	
}