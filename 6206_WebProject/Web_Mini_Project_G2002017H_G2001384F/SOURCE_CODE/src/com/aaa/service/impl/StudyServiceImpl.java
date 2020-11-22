package com.aaa.service.impl;

import java.util.List;
import java.util.Map;

import com.aaa.dao.StudyDao;
import com.aaa.dao.impl.StudyDaoImpl;
import com.aaa.entity.CourseBase;
import com.aaa.service.StudyService;

public class StudyServiceImpl implements StudyService {
	//dao对象
	StudyDao studyDao=new StudyDaoImpl();
	
	@Override
	public List<CourseBase> getCourseBaseByUid(int userid) {
		return studyDao.getCourseBaseByUid(userid);
	}

	@Override
	public int deletestudycourse(int userid, int courseid) {
		return studyDao.deletestudycourse(userid, courseid);
	}

	@Override
	public Map getText(int state, int catalogid) {
		return studyDao.getText(state, catalogid);
	}

	@Override
	public Map getCourseVideo(int state, int catalogid) {
		return studyDao.getText(state, catalogid);
	}

}
