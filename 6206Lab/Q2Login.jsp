<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<form action="LoginServlet" method="POST">
User ID : <input type="text" name="email" size="20"><br>
Password : <input type="password" name="password" size="20">
<br><br>
<input type="submit" value="Submit" id="submitBth">
</form>
<script type="text/javascript">
    $("#submitBth").click(function() {
            $.post("/LoginServlet", {
                "email" : $(".email").val(),
                "password" : $(".password").val()
            }, function(data) {
                if (data=='true') {
                    window.location.href="/verifyOTP.jsp";
                } else {
                    $("#loginmsg").html("&nbspAccount information provided is not correct.Please try again.");
                }
            },"text");
    });
	</script>
</body>
</html>