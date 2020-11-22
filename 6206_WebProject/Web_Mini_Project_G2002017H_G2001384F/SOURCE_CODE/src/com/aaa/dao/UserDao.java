package com.aaa.dao;

import com.aaa.entity.UserLoginInfo;

/*
 * 接口，对数据表的定义操作；增删改查
 */
public interface UserDao {
	//插入数据的参数是实体
	public int insertUserLoginInfo(UserLoginInfo user);
	public int updateUserLoginInfo(UserLoginInfo user);
	public UserLoginInfo selectByTelAndPwd(String tel,String pwd);
	public boolean selectPassword(String password, String userid);
	public int updatePassword(String newpwd,int userid);
	//更新头像路径;
	public int updateHeadImg(String headImg,int userid);
}