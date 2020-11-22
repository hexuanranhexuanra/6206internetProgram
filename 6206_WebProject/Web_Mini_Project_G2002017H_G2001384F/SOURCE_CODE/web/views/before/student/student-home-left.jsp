<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>Student interface left</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 	<link rel="stylesheet" href="css/teacher-home-left.css" type="text/css"></link>
	<style type="text/css">
	  .wrap{
	  		width:220px;
	  	}
	  a{
			text-decoration: none;
			color:black;
		}
  </style>
  </head>
  
  <div class="wrap">
		<div class="headmsg">
			<div class="headimg"><img src="${user.headImg}"></div>
			<span class="teacher-name">${user.username}</span>
		</div>
		<div class="menu-left">	
			<ul>
				<li>
					<img  src="img/course/ketangn.png"><a href="/moocgd/StudyServlet?method=toCourse" target="right" class="menu-select">Classroom</a>
				</li>
				<li>
					<img  src="img/course/ketangn.png"><a href="/moocgd/BasicServlet?method=getBasicinfo&userid=${user.id}" target="right" class="menu-select">Account Management</a>
				</li>
			</ul>
		</div>
  </div>
  <body></body>
</html>
