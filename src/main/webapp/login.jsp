<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>css/login.css" rel="stylesheet" type="text/css">
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script src="<%=basePath%>js/login.js"></script>

<title>欢迎！</title>
</head>
    <div id="login">  
        <h1>欢迎登陆SMS！</h1>  
        <form method="post" action="${pageContext.request.contextPath }/student/login.action">  
            <input type="text" required="required" placeholder="用户名" name="userName"></input>  
            <input type="password" required="required" placeholder="密码" name="password"></input>  
            <button class="but" type="submit">登录</button>  
        </form>  
    </div>  
</body>  
</body>
</html>