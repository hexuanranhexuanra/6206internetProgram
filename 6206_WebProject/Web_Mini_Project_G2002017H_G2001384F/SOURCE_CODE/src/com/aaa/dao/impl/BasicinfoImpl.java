package com.aaa.dao.impl;

import java.util.List;

import com.aaa.dao.BaseDao;
import com.aaa.dao.BasicinfoDao;
import com.aaa.entity.BasicInfo;

public class BasicinfoImpl extends BaseDao implements BasicinfoDao {

	@Override
	public BasicInfo getBasicinfo(int userid) {
		String sql="select * from user_basic_info where userid=?";
		Object[]params={userid};
		List<BasicInfo>list=super.search(sql, BasicInfo.class, params);
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	@Override
	public int updateBasicinfo(BasicInfo basicInfo,int userid) {
		String sql="update user_basic_info set email=?,sex=?,card=? where userid=?";
		Object[]params={basicInfo.getEmail(),basicInfo.getSex(),basicInfo.getCard(),userid};
		return super.savaOrUpdate(sql, params);
	}

}
