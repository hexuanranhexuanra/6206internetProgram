package com.aaa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.CourseService;
import com.aaa.service.StudyService;
import com.aaa.service.impl.CourseServiceImpl;
import com.aaa.service.impl.StudyServiceImpl;

public class StudyServlet extends HttpServlet {
//提到上面;
	CourseService courseService=new CourseServiceImpl();
	private static final long serialVersionUID = 1L;
	HttpServletRequest req=null;
	HttpServletResponse resp=null;
	
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
		if(method.equals("toMain")){
			toMain();
		}else if(method.equals("toCourse")){
			toCourse();
		}else if(method.equals("deletestudycourse")){
			deletestudycourse();
		}else if(method.equals("lookcontent")){
			lookcontent();
		}else if(method.equals("courseright")){
			courseright();
		}else if(method.equals("getCourseText")){
			getCourseText();
		}else if(method.equals("updateStateId")){
			updateStateId();
		}else if(method.equals("getCourseVideo")){
			getCourseVideo();
		}
	}
	
	
	/**
	 * 查看视频
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void getCourseVideo() throws ServletException, IOException {
		int state=Integer.parseInt(req.getParameter("state"));
		int catalogid=Integer.parseInt(req.getParameter("catalogid"));
		
		//需要查询;
		StudyService studyService=new StudyServiceImpl();
		Map map=studyService.getCourseVideo(state, catalogid);
		req.setAttribute("map",map);
		req.getRequestDispatcher("views/before/student/look-video.jsp").forward(req, resp);
	}
	/**
	 * 只是记录一下state和catalogid的变化;
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void updateStateId() throws ServletException, IOException {
		int state=Integer.parseInt(req.getParameter("state"));
		int catalogid=Integer.parseInt(req.getParameter("catalogid"));
		
		req.setAttribute("state", state);
		req.setAttribute("catalogid", catalogid);
		req.getRequestDispatcher("views/before/student/look-select.jsp").forward(req, resp);
	}
	/**
	 * 根据课程id，state级别得到相应的内容；
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void getCourseText() throws ServletException, IOException {
		int state=Integer.parseInt(req.getParameter("state"));
		int catalogid=Integer.parseInt(req.getParameter("catalogid"));
		//需要查询;
		StudyService studyService=new StudyServiceImpl();
		Map map=studyService.getText(state,catalogid);
		req.setAttribute("map",map);
		req.getRequestDispatcher("views/before/student/look-word.jsp").forward(req, resp);
	}
	/**
	 * 去右边一二级目录;
	 * @throws IOException 
	 * @throws ServletException 
	 * 
	 */
	private void courseright() throws ServletException, IOException {
		List<FirstCatalog>list=(List<FirstCatalog>) req.getSession().getAttribute("firstCatalogList");
		resp.sendRedirect("views/before/student/look-catalog.jsp");
		//req.getRequestDispatcher("views/before/student/look-catalog.jsp").forward(req, resp);
	}
	/**
	 * 根據用課程id，得到課程信息；
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void lookcontent() throws ServletException, IOException {
		int courseid=Integer.parseInt(req.getParameter("courseid"));
		//根據courseid，來查詢課程；
		CourseBase courseBase=courseService.getCourseBaseById(courseid);
		req.getSession().setAttribute("courseid", courseid);
		req.setAttribute("course",courseBase);
		//根據課程id，來得到一級目錄;重構
		List<FirstCatalog>list=courseService.getFirstSecondCatalog(courseid);
		//req.setAttribute("list",list);
		req.setAttribute("courseid", courseid);
		req.getSession().setAttribute("FirstCatalogList", list);
		//走下頁面;
		req.getRequestDispatcher("views/before/student/look-coursecontent.jsp").forward(req, resp);
		//resp.sendRedirect("views/before/student/look-coursecontent.jsp");
	}
	
	
	/**
	 * 
	 * 刪除課程方法;
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void deletestudycourse() throws IOException, ServletException {
		resp.setCharacterEncoding("utf-8");
		StudyService studyService=new StudyServiceImpl();
		int userid=((UserLoginInfo)req.getSession().getAttribute("user")).getId();
		int courseid=Integer.parseInt(req.getParameter("courseid"));
		int result=studyService.deletestudycourse(userid, courseid);
		if(result>0){
			resp.getWriter().print("true");
			toCourse();
		}
		else
			resp.getWriter().print("false");
	}
	/**
	 *去选择课程，将自己选择的课程加进来；或者查询一下；
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void toCourse() throws ServletException, IOException {
		//去课程页面，用户id，课程id；student_course表；
		//页面：课程id 课程图片 课程名称；
		StudyService studyService=new StudyServiceImpl();
		int userid=((UserLoginInfo)req.getSession().getAttribute("user")).getId();
		List<CourseBase>list=studyService.getCourseBaseByUid(userid);
		req.setAttribute("list", list);
//		System.out.println(list.size());
		req.getRequestDispatcher("views/before/student/student-course.jsp").forward(req, resp);
	}
	/**
	 * 参加学习，应该去学习；
	 * 做一个增加操作；
	 * @throws ServletException
	 * @throws IOException
	 */
	private void toMain() throws ServletException, IOException {
		//1.操作student_course表；
		int userid=((UserLoginInfo)req.getSession().getAttribute("user")).getId();
		int courseid=Integer.parseInt(req.getParameter("courseid"));
		//一个是增加数据到选课表，另外一个课程，被选择的次数加1；最好在java里面加事务;
		//根据userid,courseid查询student_course表是否有数据，有数据，则去已经报名去学习的页面 ；
		CourseBase courseBase=courseService.getCourseBase(userid, courseid);
		if(courseBase==null){
			int result=courseService.insStudentCourse(userid, courseid);
			//更新coursebase表的count+1；
			if(result>0)
				courseService.updateCount(courseid);
			
			req.getRequestDispatcher("views/before/student/student-frameset.jsp").forward(req, resp);
		}else{
			req.getRequestDispatcher("views/before/student/look-catalog.jsp").forward(req, resp);
		}
	}
}