<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<form action="verifyServlet" method="POST">
OTP : <input type="text" name="OPT" size="20"><br>
<br><br>
<input type="submit" value="Submit" id="submitBth">
</form>
<script type="text/javascript">
    $("#submitBth").click(function() {
            $.post("/verifyServlet", {
                "OPT" : $(".OPT").val(),
            }, function(data) {
                if (data.result=='true') {
                    if(data.id == 'tutor'){
                        window.location.href="/tutorHome.jsp";
                    }
                    else{
                        window.location.href="/parentHome.jsp";
                    }
                } else {
                    $("#loginmsg").html("&nbspOTP provided is not correct.Please try again.");
                }
            },"text")
    });
	</script>
</body>
</html>