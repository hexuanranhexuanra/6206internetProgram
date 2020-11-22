package com.aaa.entity;
/**
 * 用户Log on实体类
 * @author hxr zmt
 *
 */
public class UserLoginInfo {
	//私有的成员变量
	private int id; //private Integer id;
	private String headImg;//头像
	private String username; //用户名,camel命名法
	private String telephone; //电话
	private String password; //密码
	private int state; //状态，标识 ;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}