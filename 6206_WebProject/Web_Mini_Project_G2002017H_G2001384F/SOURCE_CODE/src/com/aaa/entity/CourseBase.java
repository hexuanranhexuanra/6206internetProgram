package com.aaa.entity;

/**
 * 基本课程信息
 * 
 * @author 张晨光
 * 
 */
public class CourseBase {
	private int id;
	private String coursename;
	private String coursesummary;
	private String courseimg;
	private int count;
	private String courseintroduce;// 介绍;
	private int teacherid;
	private int clickRate;
	
	public CourseBase() {
		
	}
	
	public CourseBase(int id, String coursename, String coursesummary, String courseimg, int count,
			String courseintroduce, int teacherid, int clickRate) {
		super();
		this.id = id;
		this.coursename = coursename;
		this.coursesummary = coursesummary;
		this.courseimg = courseimg;
		this.count = count;
		this.courseintroduce = courseintroduce;
		this.teacherid = teacherid;
		this.clickRate = clickRate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getCoursesummary() {
		return coursesummary;
	}

	public void setCoursesummary(String coursesummary) {
		this.coursesummary = coursesummary;
	}

	public String getCourseimg() {
		return courseimg;
	}

	public void setCourseimg(String courseimg) {
		this.courseimg = courseimg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCourseintroduce() {
		return courseintroduce;
	}

	public void setCourseintroduce(String courseintroduce) {
		this.courseintroduce = courseintroduce;
	}

	public int getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}

	public int getClickRate() {
		return clickRate;
	}

	public void setClickRate(int clickRate) {
		this.clickRate = clickRate;
	}

	

}
