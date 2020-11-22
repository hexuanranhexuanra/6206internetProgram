package com.aaa.dao;

import java.util.List;

import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;

public interface CourseDao {
	// 查询所有的课程信息;
	public List<CourseBase> selectAllCourse();
	//根据id来查询课程详情;
	public CourseBase getCourseBaseById(int id);
	//根据id来获得一级标题；
	public List<FirstCatalog>getFirstCatalog(int id);
	//逆向创建;
	public List<SecondCatalog> getSecondCatalog(int cid);
	public boolean isStudyCourse(int userid, int courseid);
	//增加数据到student_course
	public int insStudentCourse(int userid,int courseid);
	//更新数量;
	public int updateCount(int courseid);
	//根据userid，courseid查询课程；
	public CourseBase getCourseBase(int userid,int courseid);
	//得到的是一級和二級目錄
	public List<FirstCatalog> getFirstSecondCatalog(int courseid);
	
}