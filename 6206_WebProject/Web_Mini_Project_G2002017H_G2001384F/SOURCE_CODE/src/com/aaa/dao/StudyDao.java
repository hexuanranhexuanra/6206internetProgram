package com.aaa.dao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.CourseBase;

public interface StudyDao {
	//注意这里面是使用了左外连接的查询;
		public List<CourseBase> getCourseBaseByUid(int userid);
	//刪除課程；
	public int deletestudycourse(int userid,int courseid);
	//根据state和catalogid来查询；
	//数据结构：map(key,value)
	public Map getText(int state,int catalogid);
	//查看视频;
	public Map getCourseVideo(int state,int catalogid);
}
