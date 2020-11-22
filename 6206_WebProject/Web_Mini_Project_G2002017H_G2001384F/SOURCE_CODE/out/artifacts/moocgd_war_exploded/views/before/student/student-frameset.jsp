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

<title>学生选课界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head> 
</html>
<!-- 框架，注意不要放在body里面 ；左右的比例;-->
<frameset  cols="25%,75%" border="1" style="height:100%;">
		<frame src="../views/before/student/student-home-left.jsp" scrolling="no" />
		
		<frame src="../views/before/student/student-course.jsp" name="right" id="frameright" scrolling="yes"/>
	</frameset>