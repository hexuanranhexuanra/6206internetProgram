package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.CourseBase;

public interface StudyService {
	//注意这里面是使用了左外连接的查询;
	public List<CourseBase> getCourseBaseByUid(int userid);
	//刪除課程；
	public int deletestudycourse(int userid,int courseid);
	//根据state和catalogid来查询：
	//数据结构：map（key，value）
	public Map getText(int state,int catalogid);
	public Map getCourseVideo(int state, int catalogid);
}