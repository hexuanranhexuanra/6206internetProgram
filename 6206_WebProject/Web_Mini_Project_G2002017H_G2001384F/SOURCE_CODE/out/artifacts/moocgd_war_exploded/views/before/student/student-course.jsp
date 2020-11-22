<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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

<title>Student Course Management</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/teacher-course.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
	.courses,.add-course{
		vertical-align: middle;
	}
</style> 
</head>
<body>

<div class="course-manage">
	<div class="course-manage-head">
		<span class="select">My Course</span>
		<hr />
	</div>
	<div class="teach-course">
		<c:forEach items="${list}" var="coursebase">
		<div class="courses">
			<div class="studycourse">
				<img src="${coursebase.courseimg}">
				<div class="course-msg">
					<span class="course-name">${coursebase.coursename}</span><br/>
				</div>
				<form action="/moocgd/StudyServlet?method=lookcontent" target="_window" class="selectf" method="post">
					<input type="hidden" name="courseid" value="${coursebase.id}">
				</form>
		</div>
			<form action="/moocgd/StudyServlet?method=deletestudycourse"
					style="display:inline-block;" target="right" method="post">
					<input type="hidden" name="courseid" value="${coursebase.id}">
					<button class="btndelecourse" onclick="delcourse">Delete</button>
			</form>
		</div>
		</c:forEach>
		
	</div>
</div>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	$(".studycourse").click(function(){
		var index =	$(".studycourse").index(this);
		$(".selectf").eq(index).submit();
	});
	/* 
	 function delcourse(){
		$.post("/moocgd/StudyServlet?method=deletestudycourse",{
		      "courseid":${coursebase.id},
		success:function(data){
			console.log(data);
			if (data=='true'){
				//alert("true");
				//window.location.href="/moocgd/views/before/course.jsp";
				//在本頁面刷新，使用window.location.href無效;
				
				//window.location.href="/moocgd/StudyServlet?method=toCourse";
				//$("#frameright").src="/moocgd/StudyServlet?method=toCourse";
			} else {
				alert("刪除失敗");
			}}
		},"text");
	 } */
</script>

</body>
</html>
