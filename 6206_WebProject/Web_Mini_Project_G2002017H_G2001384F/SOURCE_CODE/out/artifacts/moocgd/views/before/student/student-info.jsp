<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/" + "static/";
%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/teacher-mycenter.css" />
<style type="text/css">
	a{
		list-style: none;
	}
</style>
</head>
  <body><!--  enctype="multipart/form-data" -->
       <!-- 以为之前，我们更新的时候，有的同学，一直为null； -->
		  	 <div class="wrap">
				  <div class="head">
						<span class="mycenter">My Center${user.id}</span>
						<hr />
				  </div>
			  	  <div class="content">
			  	  	<form action="/moocgd/UserServlet?method=updateHeadImg" method="post" enctype="multipart/form-data"  id="headImgForm">
			  		    <div> 
				  			<span >Head Image:</span>
				  			<div><!-- user,是Log on的时候的user，存放在session -->
								<input  type="file"  name="file" id="userHeadPortrait" value="${user.headImg}" class="file"/>
								<input type="hidden" name="headimg" value="${user.headImg}" />		  
				  			</div><div id="result" style="FONT:12px 宋体"></div><br/>
							<div class="img"><img id="headPortraitimg" src="${user.headImg}"/></div>
				  		</div>
				  	</form>
				  		<div>
				  			<input name="userid" value="${user.id}" id="userid" type="hidden"/>
				  			<input name="id" value="${id}" type="hidden"/>
				  			<span>Name:</span><span class="nickname">${user.username}</span>
				  		</div>
				  		<div>
				  			<span>Phone No.:</span><span class="nickname">${user.telephone}</span>
				  		</div>
				  	 <form action="/moocgd/BasicServlet?method=updateBasic&userid=${user.id }" method="post">
				  		<div>
				  			<span>Sex:</span>
							<c:choose>
								<c:when test="${basicinfo.sex eq 1}">
									<input type="radio" value="1" name="sex" checked="checked"/>Male
									<input type="radio" value="0" name="sex"/>Female
								</c:when>
								<c:otherwise>
									<input type="radio" value="1" name="sex"/>Male
									<input type="radio" value="0" name="sex"  checked="checked"/>Female
								</c:otherwise>
							</c:choose>
				  		</div>
				  		<div>
				  			<span>Password:</span><span class="nickname">******</span>
				  		</div>
				    	<div><!-- 基本信息，存放到basicinfo -->
				    		<span>Email:</span><input class="input" id="userEmail" value="${basicinfo.email}" name="email" placeholder="Please enter email address"/>
				    		<span class="hint-0" id="userEmailinput"></span>
				    	</div>
				    	<div>
				    		<span>ID Number:</span><input class="input" id="userCard" value="${basicinfo.card}" name="card" placeholder="Please enter your ID card" />
				    		<span class="hint" id="userCardinput"></span>
				    	</div>
				    	<span id="submit" class="error"></span>
				    	<div>
				    		<input id="sub" class="button" type="submit" value="Submit"/> 
				    	</div> 
				    	</form>
			      </div>
		  	 </div>
	 	
	 	<!-- 修改密码 -->
	 	<input class="change-2" type="submit" value="Change"/>
	 	<form action="/moocgd/UserServlet?method=updatePassword&userid=${user.id }" onsubmit="return pswcheck()" id="updateform" method="post">
			<div class="update-1">
				<div>
					Original Password：<input type="password" id="password" class="input-2" required="required"/>
					<span class="span" id="passwordinput"></span>
				</div>
				<div class="password">
					New&nbsp;Password:<input type="password" name="password" id="pwd" class="input-2" required="required"/>
					<span id="pwdinput"></span>
				</div>
				<div>
					Re-Enter Password：<input type="password" id="passw" class="input-2" required="required"/>
					<span id="passwinput"></span>
				</div>
				<div class="subm">
					<input class="sub" type="submit" style="cursor:pointer;" value="Submit"/>
					<a class="qxbtn sub" style="cursor:pointer;" >Cancel</a>
				</div>
			</div>
		</form>
	 	
	  	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript" charset="utf-8"  src="js/ajaxfileupload.js"></script>
		<script type="text/javascript">
			$(".qxbtn").click(function(){
     			$(".update-1").hide();
     		});
			/* 头像上传 */
			$("#userHeadPortrait").change(function() {
				//获取文件  
				var file = $("#headImgForm").find("input")[0].files[0];//将jQuery对象转换为js对象
				if ((file.type).indexOf("image/") == -1) {
					$("#userHeadPortrait").val("");
					$("#headPortraitimg").removeAttr("src");
				} else {
					//创建读取文件的对象  
					var reader = new FileReader();
					var imgFile=null;
					//为文件读取成功设置事件  
					reader.onloadend = function(e){
						imgFile= e.target.result;
						//设置img图像框，prop,范围更广;图片框的src为你更换的文件名;
						$("#headPortraitimg").prop("src", imgFile);
						//console.log($("#headPortraitimg").prop("src"));
					};
					//第一个ajax：上传图片到服务器上某个文件夹；
					  $.ajaxFileUpload({
		                 url:"/moocgd/FileUpload", //这是一个Servlet，我把它放在了com.aaa.util包;
		                 secureuri:false,
		                 fileElementId:"userHeadPortrait",                         //文件选择框的id属性
		                 dataType:"json",                             //服务器返回的格式，可以是json
		                 success: function(data,status)             //相当于java中try语句块的用法
		                 {  //data->{ src: "29fc5ad8-10a6-401b-a502-39b587abf2a4.jpg", name: "123" }
		                	// console.log(data);
		                	//String fileName="img/personage/"+data.src;
		                	//var fileName=data.src;
		                	 //console.log(fileName);
		                    // $("#result").html("上传图片成功!请复制图片地址<br/>"+data.src);
		                    //继续ajax进行更新;对上传的图片，更新文件名信息;
		                    $.post("/moocgd/UserServlet?method=updateHeadImg",{
		                    	headImg:"img/personage/"+data.src,
		         				userid:'${user.id}'
		                    	},function(data){
		                    		//data--->这个data是UserServlet，向客户端回传过来的值；
		                    		//console.log(data);
		                    		if(data)
		                    			alert('头像更新成功！');
		                    		else
		                    			alert('头像更新失败');
		                    	}
		                    );
		 
		                 },
		                 error: function (data,status,e)             //相当于java中catch语句块的用法
		                 {
		                     $("#result").html("上传图片失败");
		                 }
		               }
		             );
					
					//正式读取文件  +
					reader.readAsDataURL(file);
				};
			});
			
			/* 密码的显示 */
			$(".change-2").click(function(){
				$(".update-1").show();
			});
			
     		function pswcheck(){
     			$.post("/moocgd/UserServlet?method=selectPassword",{
     				password:$("#password").val(),
     				userid:'${user.id}'
     			},function(data){
     				//alert(data+",type:"+typeof(data));
     				//type:string,data=="true"
     				if(!data){//data->boolean
     					$("#passwordinput").html("密码输入错误").css("color","red");
     					$("#pwd").val("");
     					$("#passw").val("");
     					$("#password").val("");
     					return false;
     				}else{     					
     					$("#passwordinput").html("").css("color","green");
     					//如果成功，进行异步提交;
     					$("#updateform").ajaxSubmit(function(data) {	
						if(data){
							//self:自身页面;原来写的是top
							self.location.href="/moocgd/BasicServlet?method=getBasicinfo&userid=${user.id}";
						}
						});
						return false;
     				}
     			});
     			return false;
     		}
     		/* 两次密码是否一致 */
     		$("#passw").blur(function(){
     			var pwd = $("#pwd").val();
     			var passw = $("#passw").val();
     			if(pwd != passw){
     				$("#passwinput").html("两次密码不一致").css("color","red");
     			}else{
     				$("#passwinput").html("").css("color","green");
     			}
     		});
			
			
			/* 邮箱 */
			$("#userEmail").blur(function(){
				if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#userEmail").val())){
					$.post("/mooc/before/upstudent/selectUserEmail",{
						userEmail:$("#userEmail").val()
					},function(data){
						if(!data){
							$("#userEmailinput").html("").css("color","green");
						}else{
							$("#userEmailinput").html("邮箱已占用").css("color","red");
						}
				    });
				}else{
					$("#userEmailinput").html("邮箱格式错误").css("color","red");
				}
			});
		
			/*身份证 */
			$("#userCard").blur(function(){
				if(/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/.test($("#userCard").val())){
					$.post("/mooc/before/upstudent/selectUserCard",{
						userCard:$("#userCard").val()
					},function(data){
						if(!data){
							$("#userCardinput").html("").css("color","green");
						}else{
							$("#userCardinput").html("身份证已占用").css("color","red");
						}
					});
				}else{
			 		$("#userCardinput").html("身份证格式错误").css("color","red");
				}
			});
		</script>
  </body>
</html>