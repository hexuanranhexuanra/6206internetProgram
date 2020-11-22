package com.aaa.entity;
/**
 * 基本信息实体类
 * @author 张晨光
 *
 */
public class BasicInfo {
	private int id;
	private int userid;//是user_login_info表中的id，是唯一的，不可重复;
	private String email;
	private int sex;
	private String card;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	
	
	//下面也可以重写Object的toString（）,将属性信息返回;
}
