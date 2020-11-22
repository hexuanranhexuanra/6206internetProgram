package com.aaa.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

/**
 * 基础dao类，用来定义所有dao的公共的增删改方法，连接数据库，关闭连接，公共查询等等;
 * @author 张晨光
 *
 */
/**
 * @author 张晨光
 * 
 */
public class BaseDao {
	// 定义成了私有的静态的常量
	private static final String CLASSNAME = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/mooc?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	private static final String USER = "root";
	private static final String PASSWORD = "123456";

	static Connection conn = null;

	static {
		try {
			Class.forName(CLASSNAME); // 加载驱动;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 关闭资源，结果集，语句对象；连接;
	 * 
	 * @param rs
	 * @param st
	 * @param conn
	 */
	public void closeAll(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (st != null) {
				st.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 公共的增删该查方法;...,这个是变长数组;params[]
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public int savaOrUpdate(String sql, Object... params) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			if (params != null && params.length > 0) {
				// 下面这个是逐个给?赋值
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
		return result;
	}
	/**
	 * 试验把查询封装一下;
	 * T:CourseBase-->T;Student->T;User->T
	 */
	public <T>List<T>search(String sql,Class<T>clazz,Object...params){
		Connection conn=getConnection();
		ResultSet rs=null;
		List<T>list=new ArrayList<T>();;//用来存放泛型的数据；
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ParameterMetaData pmd=pstmt.getParameterMetaData();//得到了预编译语句对象的元数据;????等信息
			for(int i=0;i<pmd.getParameterCount();i++){
				pstmt.setObject(i+1,params[i]);
			}
			//到此为止，已经把值给了？下一步？？？继续结果集的操作;
			rs=pstmt.executeQuery();
			//得到结果集的元数据
			ResultSetMetaData rsmd=rs.getMetaData();
			while(rs.next()){
				//new出来一个T类型的对象;8列；4列；
				T obj=clazz.newInstance();
				//赋值的时候，元数据类型的列不固定，没问题；我们是不是已经得到了元数据，类的元数据;
				for(int i=0;i<rsmd.getColumnCount();i++){
					String colName=rsmd.getColumnName(i+1); //得到列名;
					Object value=rs.getObject(colName);		//得到了，该列对应的值；
					
					BeanUtils.setProperty(obj, colName, value);//封装数据到类对象obj;
				}
				list.add(obj);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return list;
	}

}