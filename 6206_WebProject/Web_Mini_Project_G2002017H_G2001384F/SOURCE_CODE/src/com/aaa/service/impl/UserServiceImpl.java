package com.aaa.service.impl;

import com.aaa.dao.UserDao;
import com.aaa.dao.impl.UserDaoImpl;
import com.aaa.entity.UserLoginInfo;
import com.aaa.service.UserService;

public class UserServiceImpl implements UserService {
	//需要有dao层的对象;
	UserDao userDao=new UserDaoImpl();
	
	@Override
	public int insertUserLoginInfo(UserLoginInfo user) {
		return userDao.insertUserLoginInfo(user);
	}

	@Override
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd) {
		return userDao.selectByTelAndPwd(tel, pwd);
	}

	@Override
	public boolean selectPassword(String password, String userid) {
		return userDao.selectPassword(password,userid);
	}

	@Override
	public int updatePassword(String newpwd, int userid) {
		return userDao.updatePassword(newpwd, userid);
	}

	@Override
	public int updateHeadImg(String headImg, int userid) {
		return userDao.updateHeadImg(headImg, userid);
	}

}