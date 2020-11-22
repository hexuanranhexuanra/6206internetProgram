package com.aaa.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.aaa.dao.BaseDao;
import com.aaa.dao.UserDao;
import com.aaa.entity.UserLoginInfo;
/**
 * 需要UserDaoImpl继承自BaseDao
 * @author 张晨光
 *
 */
public class UserDaoImpl extends BaseDao implements UserDao {
	//定义数据操作的一些对象；
	Connection conn=null;
	PreparedStatement pstmt=null; //预编译语句对象
	//结果集;
	ResultSet rs=null;
	
	@Override
	public int insertUserLoginInfo(UserLoginInfo user) {
		int result=0;
		String sql="insert into user_login_info(headImg,username,telephone,password,state) values('img/person.png',?,?,?,0)";
		String[] params={user.getUsername(),user.getTelephone(),user.getPassword()};
		result=savaOrUpdate(sql, params);
		return result;	
		
//		String sql="insert into user_login_info(headImg,username,telephone,password,state) values('img/person.png',?,?,?,0)";
//		try {
//			pstmt=conn.prepareStatement(sql);
//			//对三个？赋值;
//			pstmt.setString(1,user.getUserName());
//			pstmt.setString(2,user.getTelephone());
//			pstmt.setString(3,user.getPassword());
//			//执行
//			result=pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
			//return result;
		
	}

	@Override
	public int updateUserLoginInfo(UserLoginInfo user) {
		return 0;
	}
	/**
	 * 方法是根据tel和密码查询用户
	 */
	@Override
	public UserLoginInfo selectByTelAndPwd(String tel, String pwd) {
		UserLoginInfo user=null;
		String sql="select id,headImg,username,telephone,password,state from user_login_info where telephone=? and password=?";
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,tel);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			//下面进行遍历;
			while(rs.next()){
				user=new UserLoginInfo();
				user.setId(rs.getInt("id"));
				user.setHeadImg(rs.getString("headImg"));
				user.setUsername(rs.getString("username"));
				user.setTelephone(rs.getString("telephone"));
				user.setPassword(rs.getString("password"));
				user.setState(rs.getInt("state"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public boolean selectPassword(String password, String userid) {
		String sql="select id from user_login_info where  password=? and id=?";
		Object[]params={password,userid};
		List<Object>list=super.search(sql, Object.class, params);
		if(list.size()>0)
			return true;
		else
			return false;
	}

	@Override
	public int updatePassword(String newpwd, int userid) {
		String sql="update user_login_info set password=? where id=?";
		Object[]params={newpwd,userid};
		
		return super.savaOrUpdate(sql, params);
	}

	@Override
	public int updateHeadImg(String headImg, int userid) {
		String sql="update user_login_info set headImg=? where id=?";
		Object[]params={headImg,userid};
		return super.savaOrUpdate(sql, params);
	}


}