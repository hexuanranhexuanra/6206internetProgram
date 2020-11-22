package com.aaa.dao;

import com.aaa.entity.BasicInfo;

/**
 * 基本信息Dao接口
 * @author zh
 *
 */
public interface BasicinfoDao {
	//根据userid，来获取基本信息;
	public BasicInfo getBasicinfo(int userid);
	//根据userid，来更新基本信息；
	public int updateBasicinfo(BasicInfo basicInfo,int userid);
}