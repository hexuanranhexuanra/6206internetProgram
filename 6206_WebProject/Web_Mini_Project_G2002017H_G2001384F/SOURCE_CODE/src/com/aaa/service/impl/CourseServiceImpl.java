package com.aaa.service.impl;

import java.util.List;

import com.aaa.dao.CourseDao;
import com.aaa.dao.impl.CourseDaoImpl;
import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;
import com.aaa.service.CourseService;

public class CourseServiceImpl implements CourseService {
	// 这里面，定义一个dao的对象;
	CourseDao courseDao = new CourseDaoImpl();

	@Override
	public List<CourseBase> selectAllCourse() {
		return courseDao.selectAllCourse();
	}

	@Override
	public CourseBase getCourseBaseById(int id) {
		return courseDao.getCourseBaseById(id);
	}

	@Override
	public List<FirstCatalog> getFirstCatalog(int id) {
		return courseDao.getFirstCatalog(id);
	}

	@Override
	public List<SecondCatalog> getSecondCatalog(int cid) {
		return courseDao.getSecondCatalog(cid);
	}

	@Override
	public boolean isStudyCourse(int userid, int courseid) {
		
		return courseDao.isStudyCourse(userid,courseid);
	}

	@Override
	public int insStudentCourse(int userid, int courseid) {
		return courseDao.insStudentCourse(userid, courseid);
	}

	@Override
	public int updateCount(int courseid) {
		return courseDao.updateCount(courseid);
	}

	@Override
	public CourseBase getCourseBase(int userid, int courseid) {
		return courseDao.getCourseBase(userid, courseid);
	}

	@Override
	public List<FirstCatalog> getFirstSecondCatalog(int courseid) {
		return courseDao.getFirstSecondCatalog(courseid);
	}




	
}