package com.aaa.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.aaa.entity.UserLoginInfo;
import com.aaa.service.UserService;
import com.aaa.service.impl.UserServiceImpl;
import com.aaa.util.*;
import com.alibaba.fastjson.JSON;
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// 上面定义两个http传递数据时候，请求和响应对象;目的就是为了让这些对象，在类内共享;
	private HttpServletRequest req=null;
	private HttpServletResponse resp=null;
	
	UserService userService=new UserServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 在此处写代码
		// System.out.println("从Register页面来的数据...");
		req = request;
		resp = response;
		String method = req.getParameter("method");
		UserLoginInfo user=new UserLoginInfo();
		// 判断，这时候，相当于我们自己写了一个小框架
		if (method.equals("register")) {
			register();
		} else if (method.equals("login")) {
			login();
		} else if (method.equals("quit")) {
			quit();
		}else if(method.equals("selectPassword")){
			String password=req.getParameter("password");
			String userid=req.getParameter("userid");
			//查询当前userid的password是否存在？
			//System.out.println("userid"+userid);
			selectPassword(password,userid);
		}else if(method.equals("updatePassword")){
			String newpwd=req.getParameter("password");
			int userid=Integer.parseInt(req.getParameter("userid"));
			updatePassword(newpwd,userid);
		}else if(method.equals("updateHeadImg")){
			String headImg=req.getParameter("headImg");
			int userid=Integer.parseInt(req.getParameter("userid"));
			updateHeadImg(headImg,userid);
		}

	}


	private void updateHeadImg(String headImg, int userid) throws ServletException, IOException {
		int result=userService.updateHeadImg(headImg, userid);
		if(result>0)
			AjaxWriter.write(resp, true);
		else
			AjaxWriter.write(resp, false);
	}



	/**
	 * 更新密码
	 * @param newpwd
	 * @param userid
	 */
	private void updatePassword(String newpwd, int userid) {
		//加密
		String encPwd=MD5Util.MD5(newpwd);
		int result=userService.updatePassword(encPwd, userid);
		if(result>0)
			AjaxWriter.write(resp, true);
		else
			AjaxWriter.write(resp, false);
	}

	/**
	 * 查询是否密码，你输入的是否正确
	 * @param password
	 * @param userid
	 * @throws IOException 
	 */
	private void selectPassword(String password, String userid) throws IOException {
		
		boolean flag=userService.selectPassword(password,userid);
		//resp.setContentType("json;charset=utf-8");
		//resp.getWriter().print(JSON.toJSON(flag));
		AjaxWriter.write(resp, flag);
		//AjaxWriter.write(resp, flag);
		//ajax调用;
		/*if(flag)
			resp.getWriter().print("true");
		else
			resp.getWriter().print("false");*/
		
	}

	// 私有注销方法;
	private void quit() throws IOException {
		req.getSession().invalidate();
		resp.sendRedirect("/moocgd/views/before/main.jsp");
	}

	// 封装一个私有的方法;
	private void register() throws IOException {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String telephone = req.getParameter("telephone");
		// 对数据再次进行封装;
		UserLoginInfo userLogin = new UserLoginInfo();
		userLogin.setUsername(userName);
		userLogin.setTelephone(telephone);
		userLogin.setPassword(password);
		// 下面需要传递数据，因此需要有业务层的对象、new出来
		UserService userService = new UserServiceImpl();
		int result = userService.insertUserLoginInfo(userLogin);
		if (result > 0)
			resp.getWriter().print("true");// 还需要使用ajax向页面传递数据;

	}

	// 继续封装私有的方法;
	private void login() throws IOException {
		String tel = req.getParameter("telephone");
		String pwd =(req.getParameter("password"));
		// 调用业务层；
		UserService userService = new UserServiceImpl();
		// 应该是根据业务层，根据电话和密码去查询是否有该用户；
//		String encPwd=MD5Util.MD5(pwd);
		String encPwd = pwd;
		UserLoginInfo user = userService.selectByTelAndPwd(tel, encPwd);
		System.out.println(user);
		if (user != null) {
			req.getSession().setAttribute("user", user);
			resp.getWriter().print("true");
		} else {
			resp.getWriter().print("false");
		}

	}
}