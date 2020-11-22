<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Course Details</title>
<meta name="viewport" content="width:device-width;initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/course.css">

</head>
<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="top">
			<div class="left">
				<img src="${coursebase.courseimg}">
			</div>
			<div class="right">
				<div>
					<h1>${coursebase.coursename}</h1>
				</div>
				<div class="school-msg">
					<div>NANYANG TECHNOLOGICAL UNIVERSITY</div>
					<div>${coursebase.courseintroduce}</div>
				</div>
				<div>
					<div class="count">${coursebase.count} people have signed up</div>
					<div>
						<form action="/moocgd/StudyServlet?method=toMain" method="post" id="studyform">
							<input type="hidden" value="${coursebase.id}" name="courseid" />
						</form>
						<c:choose>
							<c:when test="${isStudyCourse}"><!-- ??? -->
								<button class="gotostudy">Signed up, go to study</button>
							</c:when>
							<c:otherwise>
								<button class="joinc">Immediately to attend</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="down">
			<div class="down-left">
				<div class="top-select">
					<span class="course-xq">Course Details</span>
					<hr style="color:#eee;">
				</div>
				<div class="coursezl">
					<div class="coursems">
						<img src="img/course/coursems.png"><span
							class="coursems-head">Course Overview</span>
						<div class="coursems-text" style="color:gray;">
							${coursebase.coursesummary}</div>
					</div>
					<div class="coursedg">
						<img src="img/course/coursedg.png"><span
							class="coursedg-head">Course Outline</span>
					</div>
				</div>
			</div>
			<div class="down-right" style="display: none;">
				<img src="img/ncwu.jpg">
				<hr style="color:#eee;">
				<div class="teacher">
					<span class="teacher-img"><img src="${teacherUser.headImg}">
					</span> <span class="teacher-name">${teacherUser.userName}</span>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(".joinc").click(function(){
			var user='${user}';//Log on的时候，存放数据到了session
			if(user==null||user==''){
				if(confirm("You have not logged in yet, please log in first!")){
					window.location.href="/moocgd/views/before/login.jsp";
				}
			}else{
				$("#studyform").submit();//直接走这,toMain
			}
		})
		//已经报过名的去学习
		$(".gotostudy").click(function(){
			var user='${user}';
			if(user==null||user==''){
				if(confirm("You have not logged in yet, please log in first!")){
					window.location.href="/moocgd/before/login/tologin";
				}
			}else{
				//?????
				window.location.href="/moocgd/StudyServlet?method=toCourse";
			}
		});
		//jquery代码；当页面dom加载完毕之后，ajax
		$(function(){
		  var id='${coursebase.id}';
			$.ajax({
			url:"/moocgd/CourseServlet?method=getFirstCatalogInfo",
			type:"post",
			data:{"id":id},
			dataType:"json",//指定的传输数据的类型;
			success:function(data){
				var div="";
				//循环一级标题
				for(var i=0;i<data.length;i++){
				   div+="<div class='first-level'>";
				   div+="<div class='first-level-text selected'>";
				   div+="<span>Chapter"+(i+1)+" "+data[i].catalogname+"</span>";
				   div+="</div>";
				   //二级标题
				       $.ajax({
				          async:false,//取消异步操作
				          url:"/moocgd/CourseServlet?method=getSecondCatalogInfo",
				          type:"post",
			              data:{"cid":data[i].id},
			              dataType:"json",
				          success:function(second){
				             for(var j=0;j<second.length;j++){
				                 div+="<div class='second-level selected'>"
				                  div+="<span>"+(i+1)+"."+(j+1)+second[j].scname+"</span>";
				                 div+="</div>";
				             }
				          }
				       
				       })
				   
				   
				   
				   
				   div+="</div>";
				}
				//将动态生成的div，添加到课程大纲中
				$(".coursedg").append(div);
				
			}
			
			})

		})
		
		
	</script>
</body>
</html>
