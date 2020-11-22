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

<title>Mooc registration interface</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/register.css" rel="stylesheet" type="text/css">
<link href="css/verify.css" rel="stylesheet" type="text/css">
<style type="text/css">
#formr ul input {
	margin-bottom: 20px;
	padding-left: 10px;
}
</style>
</head>

<body>
	<jsp:include page="/static/jsp/header.jsp"></jsp:include>
	<div class="wrap">
		<div class="registerCont">
			<h1 style="color:#55b929;">Registration</h1>
			<form id="formr" >
				<ul>
					<li><span class="dis">User Name:</span> <input type="text"
						name="userName" id="userName" class="input userName"
						maxlength="24" placeholder="Please enter username, 3-12 characters"><span
						class="userNameAlt" style="color:red"></span></li>

					<li><span class="dis">Password:</span> <input type="password"
						name="password" id="password" class="input password"
						maxlength="16" class="a" placeholder="6-16 bit password, case sensitive"> <span
						class="passwordAlt" style="color:red"></span>
					</li>

					<li><span class="dis">Re-Enter Password:</span> <input type="password"
						name="repeatPassword" id="rePassword" class="input repassword"
						class="a" maxlength="16"  placeholder="Please enter your password again">
						<span class="repasswordAlt" style="color:red"></span>
					</li>
					<li class="telNumber"><span class="dis">Tel:</span> <input
						type="text" class="input telephone" id="phone" name="telephone"
						maxlength="11" class="a" placeholder="Please enter your 11-digit cell phone number" required="required"> <span
						class="telephoneAlt" style="color:red"></span>
					</li>
					<li style="margin-left:160px;"><div id="mpanel4" style="margin-top:50px;"></div>
					</li>
					<li class="agree"><input name="protocol" id="protocol"
						type="checkbox" value="" style="margin-left:62px;"
						checked="checked"> I agree to 《<a href="#" target="_black">the MOOC registration Agreement</a>》<span
						id="protocolAlt"></span></li>
					<li class="btnr"><input
						style="padding-left:0;margin-left:160px;" type="button" onclick="sub()" value="Register">
					</li>
				</ul>
			</form>
		</div>
	</div>
	<jsp:include page="/static/jsp/foot.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="js/jquery-form.js"></script>
	<script type="text/javascript" src="js/verify.js"></script>
	<script type="text/javascript">
	//false:
		var nameTest = false;
		var pswTest = false;
		var rePswTest = false;
		var telTest = false;
		var yzmTest = false;

		/* 验证用户名格式是否正确，是否已存在  */
		$(".userName").blur(function() {
			var a = /^(?!(\d+)$)[\u4e00-\u9fffa-zA-Z\d\-_]{3,12}$/;
			if (!a.test($(".userName").val())) {
				nameTest = false;
				$(".userNameAlt").html("Format error, 3-12 characters (no special characters allowed)");
			} else {
			       nameTest=true;
			        return true;
				/*$.post("/mooc/before/register/checkusername", {
					"userName" : $(".userName").val()
				}, function(data) {
					if (!data) {
						nameTest = false;
						$(".userNameAlt").html("对不起，用户名已存在");
					} else {
						nameTest = true;
						$(".userNameAlt").html("");
					}
				});*/
			}
		});

		/*  验证密码格式 */
		$(".password").blur(function() {
		//正则表达式：用来给form表单添加一些输入的规则
			var reg = /^([0-9A-Za-z])[0-9A-Za-z]{5,16}$/;
			$(".repassword").blur();
			//判断输入的内容与正则表达式规定的是否一致
			if (!reg.test($(".password").val())) {
				pswTest = false;
				$(".passwordAlt").html("6-16 bit password, case sensitive");
			} else {
				pswTest = true;
				$(".passwordAlt").html("");
			}
		});

		/* 重复密码验证 */

		$(".repassword").blur(function() {

			var psw = $(".password").val();
			var psw1 = $(".repassword").val();
			if (psw != psw1) {
				rePswTest = false;
				$(".repasswordAlt").html("The passwords are different");
			} else if (psw1 == "") {
				rePswTest = false;
				$(".repasswordAlt").html("The password cannot be empty");
			} else {
				rePswTest = true;
				$(".repasswordAlt").html("");
			}
		});

		//验证手机号格式是否正确，是否已存在
		$(".telephone").blur(function() {
			var a = /^1[3|4|5|7|8][0-9]\d{8}$/;
			if (a.test($(".telephone").val())) {
			   telTest=true;
			   return true;
				/*$.post("/mooc/before/register/checktel", {
					"telephone" : $(".telephone").val()
				}, function(data) {
					if (!data) {
						telTest = false;
						$(".telephoneAlt").html("对不起，该手机号码已经被使用");
					} else {
						telTest = true;
						$(".telephoneAlt").html("");
					}
				});*/
			} else {
				telTest = false;
				$(".telephoneAlt").html("Please enter the correct phone format");
			}
		});
		var code;

		/* 如果表单的各项正确则可提交，错误不提交 */

		var pictureNum = 50;
		var pictureName = new Array(pictureNum);
		for ( var i = 0; i < pictureNum; i++) {
			pictureName[i] = (i + 1) + ".jpg";
		}
		//验证插件
		$('#mpanel4').slideVerify({
			type : 2, //类型
			vOffset : 5, //误差量，根据需求自行调整
			vSpace : 5, //间隔
			imgName : pictureName,
			imgSize : {
				width : '340px',
				height : '170px',
			},
			blockSize : {
				width : '40px',
				height : '40px',
			},
			barSize : {
				width : '340px',
				height : '40px',
			},
			ready : function() {
			},
			success : function() {
				yzmTest = true;
			},
			error : function() {
				yzmTest = false;
			}

		});

			function sub() {
				$(".userName").blur();
				$(".password").blur();
				$(".repassword").blur();
				$(".telephone").blur();
				if (nameTest && pswTest && rePswTest && telTest && yzmTest){
					//ajax(get/post)?用来传递参数
					$.ajax({
					    url:"/moocgd/UserServlet?method=register",
					    type:"post",
					    data:$("#formr").serialize(),//serialize():提交表单
					    dataType:"text",
					    success:function(data){
						    //通过服务器返回的数据判断
						    //若返回的有执行成功的数据，则跳转到Log on页面
						    if(data=='true'){
						 	  window.location.href="/moocgd/views/before/login.jsp"
					 }
					  //  若返回的没有执行成功的数据，在当前页面	
					    }
					})
				 }
			}
	</script>
</body>
</html>
