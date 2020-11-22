package com.aaa.service;

import com.aaa.entity.UserLoginInfo;
/**
 * 业务层接口的定义，很多时候和dao层接口相同，但是必须有;
 * @author 张晨光
 *
 */
public interface UserService {
	public int insertUserLoginInfo(UserLoginInfo user);
	public UserLoginInfo selectByTelAndPwd(String tel,String pwd);
	public boolean selectPassword(String password, String userid);
	public int updatePassword(String newpwd,int userid);
	public int updateHeadImg(String headImg,int userid);
}
