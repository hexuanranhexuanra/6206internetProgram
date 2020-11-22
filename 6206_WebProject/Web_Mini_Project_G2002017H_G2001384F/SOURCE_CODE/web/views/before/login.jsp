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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Mooc Login Page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<link href="css/verify.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="main-login">
		<div class="main-login-window">
			<div class="login-text">
				<span style="padding-top:20px">Using existing telephone to login</span>
			</div>
			<div style="border-bottom:1px solid gray;"></div>
			<div class="main-login-mes">
				<span><img src="img/username.png"><input type="text"
					class="telephone" name="telephone" placeholder="Please enter your phone number"
					style="display:inline-block;" /> </span> <span><img
					src="img/psw.png"><input type="password" name="password"
					required="required" class="password" placeholder="Please enter your password" /> </span>
				<div id="mpanel1" style="margin-left:151px;margin-top:20px;"></div>
				<span id="loginmsg" style="color:red;">&nbsp</span> 
				<input	type="button" class="loginbtn"
					style="border:0;text-align:center; padding-left:0;background-color:#55b929;margin-left:152px;"
					value="Login" required="required" />
			</div>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/verify.js"></script>
	<script type="text/javascript">
		var yzmTest = false;
		$('#mpanel1').slideVerify({
			type : 1, //类型
			vOffset : 5, //误差量，根据需求自行调整
			barSize : {
				width : '340px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
				if($("#loginmsg:contains('验证码')")){ 
					$("#loginmsg").html("&nbsp");
				}
				yzmTest = true;
			},
			error : function() {
				yzmTest = false;
			}

		});
		var pswTest = false;
		var telTest = false;
		$(".telephone").blur(function() {
			var reg = /^1[3|4|5|7|8][0-9]\d{8}$/;
			var tel = $(".telephone").val();
			if (reg.test(tel)) {
				$("#loginmsg").html("&nbsp");
				telTest = true;
			} else {
				$("#loginmsg").html("&nbspPlease enter the correct telephone");
				telTest = $(".telephone").blur(function() {false;
			}
		});

		$(".password").blur(function() {
			var psw = $(".password").val();
			if (psw == "" || psw == null) {
				$("#loginmsg").html("&nbspThe password cannot be empty");
				pswTest = false;
			} else {
				$("#loginmsg").html("&nbsp");
				pswTest = true;
			}
		});
		$(".loginbtn").click(function() {
			$(".telephone").blur();
			if (telTest) {
				$(".password").blur();
			}
			if(pswTest&&telTest){
			if(yzmTest){
				$("#loginmsg").html("&nbsp");
			}else{
				$("#loginmsg").html("&nbspThe captcha is incorrect");
			}
			}
			//验证为true,调用ajax
			if (pswTest && telTest && yzmTest) {
				$.post("/moocgd/UserServlet?method=login", {
					"telephone" : $(".telephone").val(),
					"password" : $(".password").val()
				}, function(data) {
					if (data=='true') {
						//alert('ss');
						//window.location.href="/moocgd/views/before/course.jsp";
						window.location.href="/moocgd/CourseServlet?method=getCourseBaseInfo";
					} else {
						//alert('fail');
						//console.log("fail");
						$("#loginmsg").html("&nbspPASSWORD ERROR");
					}
				},"text");
			}
		});
	</script>
</body>
</html>
