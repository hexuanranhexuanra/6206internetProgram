package com.aaa.entity;

import java.util.List;

/**
 * 一级标题实体类
 * mybatis hibernate;叫一對多的關係
 * @author zzz
 *
 */
public class FirstCatalog {
	private int id;
	private int courseid;
	private String catalogname;
	private String ctext;
	private String cvideo;
	private int corder;
	//重構代碼;一級實體類，裡面有一個列表，是二級標題的list
	private List<SecondCatalog>courseSecondCatalog;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getCatalogname() {
		return catalogname;
	}
	public void setCatalogname(String catalogname) {
		this.catalogname = catalogname;
	}
	public String getCtext() {
		return ctext;
	}
	public void setCtext(String ctext) {
		this.ctext = ctext;
	}
	public String getCvideo() {
		return cvideo;
	}
	public void setCvideo(String cvideo) {
		this.cvideo = cvideo;
	}
	public int getCorder() {
		return corder;
	}
	public void setCorder(int corder) {
		this.corder = corder;
	}
	public List<SecondCatalog> getCourseSecondCatalog() {
		return courseSecondCatalog;
	}
	public void setCourseSecondCatalog(List<SecondCatalog> courseSecondCatalog) {
		this.courseSecondCatalog = courseSecondCatalog;
	}
	
	
}
