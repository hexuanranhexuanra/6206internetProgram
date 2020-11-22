package com.aaa.service;

import com.aaa.entity.BasicInfo;

public interface BasicinfoService {
	public BasicInfo getBasicinfo(int userid);
	//根据userid，来更新基本信息；
		public int updateBasicinfo(BasicInfo basicInfo,int userid);
}