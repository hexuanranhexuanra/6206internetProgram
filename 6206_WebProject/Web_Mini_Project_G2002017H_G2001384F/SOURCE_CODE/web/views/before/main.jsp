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
<meta name="viewport" content="width:device-width;initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" href="back/layui/css/layui.css" media="all" />
<style type="text/css">
.main-left-select a,img {
	color: #333;
	box-sizing: content-box;
}
</style>
</head>

<body>
	
	<div class="main-navigation">
		<div class="main-top">
			<div class="main-logo">
				<img src="img/logo.png">
			</div>
			<div class="main-search">
				<input class="mainsearch" id="mainsearch-invisible" type="text" placeholder="Search what you like" />
				<button class="main-search-img" id="main-search-img-invisible">
					<img src="img/search.png">
				</button>
				
				<!-- 这是一个判断； -->
				<c:choose>
					<c:when test="${empty user}">
						<a class="login" style="cursor:pointer;"
							href="/moocgd/views/before/login.jsp">Login&nbsp</a>
						<span>|</span>
						<a href="/moocgd/views/before/register.jsp">Register</a>
					</c:when>
					<c:otherwise>
						<a class="login" href="/mooc/before/index/person"style="cursor:pointer;">Welcome：${user.username}</a>
					|<a href="/moocgd/UserServlet?method=quit" style="cursor:pointer;">Logout</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="main-top-select">
		</div>
	</div>
	<div class="main-lunbotu" style="background-color:#6041A0;">
		<div class="main-left-select">
			<a><img src="img/computer.png"><span>Computer</span>
			</a> <a><img src="img/kaoyan.png"><span>MBA</span> </a> <a><img
				src="img/kongcheng.png"><span>FREIGHT</span> </a> <a><img
				src="img/dili.png"><span>Geography</span> </a> <a><img
				src="img/music.png"><span>Musicology</span> </a> <a><img
				src="img/shehui.png"><span>Sociometry</span> </a> <a><img
				src="img/waiyu.png"><span>English</span> </a> <a><img
				src="img/wenxue.png"><span>Pedagogy</span> </a> <a><img
				src="img/xinli.png"><span>Psychology</span> </a>
		</div>
		<div class="main-middle-lunbo" id="image">
			<div class="main-middle-image">
				<div class="image-show">
					<a><img src="img/lunbo1.png"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo2.jpg"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo3.png"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo4.jpg"> </a>
				</div>
				<div class="image-hide">
					<a><img src="img/lunbo5.jpg"> </a>
				</div>
			</div>
			<div class="main-lunbo-li">
				<ul class="lunbo-point">
					<li class="point"></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="lunbo-twocricle">
				<div class="lunbo-leftcricle">
					<span>＜</span>
				</div>
				<div class="lunbo-rightcricle">
					<span style="left:5px;">＞</span>
				</div>
			</div>
		</div>
		<div class="main-right-person">
			<div class="right-text">
				<span>Take free courses</span><br /> <span>from famous teachers from famous universities</span>
			</div>
			<c:choose>
				<c:when test="${empty user}">
					<div class="right-img">
						<img  src="img/person.png"><br /> <a
							href="/moocgd/views/before/login.jsp"><button class="login">Login</button>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="right-img">
						<a href="/moocgd/before/index/person"><img style="cursor:pointer;height:80px;width:80px;overflow:hidden;border-radius:80px;" src="${user.headImg}" ></a><br />
						<a href="/moocgd/before/index/person"><span class="loginUserName">${user.username}</span>
						</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="main-college">
		<span><a >All 600 cooperative universities</a> </span> <span><a ><img
				src="img/beida.png"> </a> </span> <span><a ><img
				src="img/zheda.png"> </a> </span> <span><a ><img
				src="img/nanjinda.png"> </a> </span> <span><a ><img
				src="img/wuda.png"> </a> </span> <span><a ><img
				src="img/hagongda.png"> </a> </span>
	</div>
	
	<div class="courselist" id="courselist">
		<h1 style="padding-top:30px;color:#55b929;">Course List</h1>
		<!-- items,list，这个list就是req设置的变量；var指的的是单个的对象；.之后的东西是实体的属性 -->
		<c:forEach items="${list}" var="item">
			<div class="course-main">
				<div class="computer-course">
					<div class="course">
						<div class="course-img">
							<img src="${item.courseimg}">
						</div>
					</div>
					<div class="course-text">
						<div class="course-name">${item.coursename}</div>
						<div style="margin-top:30px;margin-left:10px;">
							<span>NANYANG TECHNOLOGICAL UNIVERSITY</span> <img
								style="margin-left: 60px;" src="img/course/count.png"> <span
								style="margin-left:10px;">${item.count}</span>
						</div>
						<div style="margin-left:10px;">${item.courseintroduce}</div>
						<form action="/moocgd/CourseServlet?method=getOneCourseDetail" class="selectform" method="post">
							<input type="hidden" name="id" value="${item.id}">
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jq.js"></script>
	<script type="text/javascript" charset="UTF-8" src="js/main.js"></script>
	<script src="back/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		
		$(".main-left-select > a > span").click(function(){
		    searchCourseForm($(this).html());
		});
		
		$(".course-main").click(function() {
			var index=$(this).index();
			$(".selectform").eq(index-1).submit();
		});
		
		$("#main-search-img-invisible").click(function(){
		if($("#mainsearch-invisible").val()!=null&&$("#mainsearch-invisible").val().trim()!=''){
		     searchCourseForm($("#mainsearch-invisible").val());
		   }
		});
		
		$("#scrollsearch-img-top").click(function(){
		if($("#mainsearch-top").val()!=null&&$("#mainsearch-top").val().trim()!=''){
		     searchCourseForm($("#mainsearch-top").val());
		   }
		});
		
		// JavaScript 构建一个 form 
		function searchCourseForm(data) { 
		  // 创建一个 form 
		  var searchcourse = document.createElement("form"); 
		  searchcourse.id = "searchcourse"; 
		  searchcourse.name = "searchcourse"; 
		  // 添加到 body 中 
		  document.body.appendChild(searchcourse); 
		  // 创建一个输入 
		  var input = document.createElement("input"); 
		  // 设置相应参数 
		  input.type = "text"; 
		  input.name = "selectValue"; 
		  input.value = data; 
		  // 将该输入框插入到 form 中 
		  searchcourse.appendChild(input); 
		  // form 的提交方式 
		  searchcourse.method = "POST";
		  // form 提交路径 
		  searchcourse.action = "/moocgd/before/course/searchresult"; 
		  // 对该 form 执行提交 
		  searchcourse.submit(); 
		  // 删除该 form 
		  document.body.removeChild(searchcourse); 
		} 
	</script>
</body>
</html>
