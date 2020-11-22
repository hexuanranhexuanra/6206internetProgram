package com.aaa.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.aaa.dao.BaseDao;
import com.aaa.dao.CourseDao;
import com.aaa.entity.CourseBase;
import com.aaa.entity.FirstCatalog;
import com.aaa.entity.SecondCatalog;

public class CourseDaoImpl extends BaseDao implements CourseDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List<CourseBase> selectAllCourse() {
		String sql = "select * from coursebase";
		// 定义一个课程列表 的list
		List<CourseBase> list = new ArrayList<CourseBase>();
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();// 得到执行结果，放结果集对象rs
			while (rs.next()) {
				CourseBase course = new CourseBase();
				//new完了，给对象赋值
				//我们赋值的时候，多少个？？？
				course.setId(rs.getInt("id"));
				course.setCoursename(rs.getString("coursename"));// ...其他列一样
				course.setCoursesummary(rs.getString("coursesummary"));
				course.setCourseimg(rs.getString("courseimg"));
				course.setCount(rs.getInt("count"));
				course.setCourseintroduce(rs.getString("courseintroduce"));
				course.setTeacherid(rs.getInt("teacherid"));
				course.setClickRate(rs.getInt("clickRate"));
				list.add(course);// 将每次得到的课程对象，放到list列表中；
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/* 查找，代码
	 * @see com.aaa.dao.CourseDao#getCourseBaseById(int)
	 */
	@Override
	public CourseBase getCourseBaseById(int id) {
		//Log onRegister，sql注入；
		String sql = "select * from coursebase where id=?";
		CourseBase courseBase=new CourseBase();
		Object[]params={id};
		List<CourseBase>list=search(sql, CourseBase.class, params);
		if(list.size()>0)
			return list.get(0);//NullPointerException
		else
			return null;
// 		conn=getConnection();
//		
// 		try {
// 			pstmt=conn.prepareStatement(sql);
// 			pstmt.setInt(1, id);
// 			rs=pstmt.executeQuery();
// 			if(rs.next()){
// 				courseBase.setId(rs.getInt("id"));
// 				courseBase.setCoursename(rs.getString("coursename"));// ...其他列一样
//				courseBase.setCoursesummary(rs.getString("coursesummary"));
//				courseBase.setCourseimg(rs.getString("courseimg"));
//				courseBase.setCount(rs.getInt("count"));
//				courseBase.setCourseintroduce(rs.getString("courseintroduce"));
// 				courseBase.setTeacherid(rs.getInt("teacherid"));
// 				courseBase.setClickRate(rs.getInt("clickRate"));
// 			}
// 		} catch (SQLException e) {
// 			e.printStackTrace();
// 		}
// 		
// 		return courseBase;
 	}

	/* (non-Javadoc)
	 * 写实现代码
	 * @see com.aaa.dao.CourseDao#getFirstCatalog(int)
	 */
	@Override
	public List<FirstCatalog> getFirstCatalog(int id) {
		String sql="select * from coursefirstcatalog where courseid=?";
		Object[]params={id};
		List<FirstCatalog>list=super.search(sql, FirstCatalog.class, params);
		return list;
	}

	@Override
	public List<SecondCatalog> getSecondCatalog(int cid) {
		String sql="select * from coursesecondcatalog where catalogid=?";
		Object[]params={cid};
		List<SecondCatalog>list=super.search(sql, SecondCatalog.class, params);
		return list;
	}

	@Override
	public boolean isStudyCourse(int userid, int courseid) {
		String sql="select * from student_course where userid=? and courseid=?";
		Object[]params={userid,courseid};
		List<Object>list=super.search(sql, Object.class, params);
//		if(list.size()>0)
//			return true;
//		else
//			return false;
		//三元运算符;
		return (list.size()>0)?true:false;
	}

	@Override
	public int insStudentCourse(int userid, int courseid) {
		String sql="insert into student_course(userid,courseid) values(?,?)";
		Object[]params={userid,courseid};		
		return super.savaOrUpdate(sql, params);
	}

	@Override
	public int updateCount(int courseid) {
		String sql="update coursebase set count=count+1 where id=?";
		Object[]params={courseid};
		return super.savaOrUpdate(sql, params);
	}

	@Override
	public CourseBase getCourseBase(int userid, int courseid) {
		String sql="select * from student_course where userid=? and courseid=?";
		Object[]params={userid,courseid};
		List<CourseBase>list=super.search(sql, CourseBase.class, params);
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	/*原來只有一級;
	 * @see com.aaa.dao.CourseDao#getFirstSecondCatalog(int)
	 */
	@Override
	public List<FirstCatalog> getFirstSecondCatalog(int courseid) {
		String sql="select * from coursefirstcatalog where courseid=?";
		Object[]params={courseid};
		List<FirstCatalog>list=super.search(sql, FirstCatalog.class, params);
		//根據一級的id，得到二級的目錄？？？
		String sql2="select * from coursesecondcatalog where catalogid=?";
		for(int i=0;i<list.size();i++){
			int cid=list.get(i).getId();
			Object[]params2={cid};
			List<SecondCatalog>list2=super.search(sql2, SecondCatalog.class, params2);
			//得到每一個一級標題對應的二級標題的內容列表;
			list.get(i).setCourseSecondCatalog(list2);
		}
		return list;
	}


}
