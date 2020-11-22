package com.aaa.service.impl;

import com.aaa.dao.BasicinfoDao;
import com.aaa.dao.impl.BasicinfoImpl;
import com.aaa.entity.BasicInfo;
import com.aaa.service.BasicinfoService;

public class BasicServiceImpl implements BasicinfoService {

	//业务层应该有个dao对象;
	BasicinfoDao basicInfoDao=new BasicinfoImpl();
	@Override
	public BasicInfo getBasicinfo(int userid) {
		return basicInfoDao.getBasicinfo(userid);
	}

	@Override
	public int updateBasicinfo(BasicInfo basicInfo,int userid) {
		return basicInfoDao.updateBasicinfo(basicInfo, userid);
	}

}