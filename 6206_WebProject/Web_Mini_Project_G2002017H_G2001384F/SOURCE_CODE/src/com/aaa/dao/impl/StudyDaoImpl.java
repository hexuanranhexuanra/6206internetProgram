package com.aaa.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aaa.dao.BaseDao;
import com.aaa.dao.StudyDao;
import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;

public class StudyDaoImpl extends BaseDao implements StudyDao {

	@Override
	public List<CourseBase> getCourseBaseByUid(int userid) {
		String sql="SELECT c.id,c.coursename,c.courseimg from student_course sc inner JOIN coursebase c on sc.courseid=c.id and sc.userid=?";
//		System.out.println(sql);
		Object[]params={userid};
		List<CourseBase>list=super.search(sql, CourseBase.class, params);
		return list;
	}

	@Override
	public int deletestudycourse(int userid, int courseid) {
		String sql="delete  from  student_course where userid=? and courseid=?";
		Object[]params={userid,courseid};
		return super.savaOrUpdate(sql, params);
	}
	/*
	 * 查詢時可能來自兩個實體類
	 */
	@Override
	public Map getText(int state, int catalogid) {
		Map map=new HashMap();
		Object[]params={catalogid};
		map.put("catalogid", catalogid);
		if(state==1){ //要查询一级目录信息表
			String sql="select ctext from coursefirstcatalog where id=?";
			List<FirstCatalog>list=super.search(sql, FirstCatalog.class, params);
			if(list.size()>0){
				map.put("content",list.get(0).getCtext());
			}
				
		}else{
			String sql="select sctext from coursesecondcatalog where id=?";
			List<SecondCatalog>list=super.search(sql, SecondCatalog.class, params);
			if(list.size()>0){
				map.put("content",list.get(0).getSctext());
			}
		}
		return map;
	}

	@Override
	public Map getCourseVideo(int state, int catalogid) {
		Map map=new HashMap();
		Object[]params={catalogid};
		map.put("catalogid", catalogid);
		if(state==1){ //要查询一级目录信息表
			String sql="select cvideo from coursefirstcatalog where id=?";
			List<FirstCatalog>list=super.search(sql, FirstCatalog.class, params);
			if(list.size()>0){
				map.put("video",list.get(0).getCvideo());
			}
				
		}else{
			String sql="select scvideo from coursesecondcatalog where id=?";
			List<SecondCatalog>list=super.search(sql, SecondCatalog.class, params);
			if(list.size()>0){
				map.put("video",list.get(0).getScvideo());
			}
		}
		return map;
	}

}
