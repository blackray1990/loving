<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>笔记管理系统</title>
</head>
<link rel="stylesheet" href="css/demo/bootstrap.min.css">
<script src="js/jquery/jquery.min.js"></script>
<script src="js/bootstrap/js/bootstrap.min.js"></script>

<body>   
	<nav class="navbar navbar-default" role="navigation" style="height:40px">
		   <div class="navbar-header">
		      <a class="navbar-brand" href="#">笔记后台管理系统</a>
		   </div>
		   <div style="height:40px">
		      <ul class="nav navbar-nav navbar-right" style="margin-right: 0;height:40px">
		         <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		              	 当前登陆用户：${USER.username } <b class="caret"></b>
		            </a>
		            <ul class="dropdown-menu">
		               <li><a href="#">基本资料</a></li>
		               <li><a href="#">修改密码</a></li>
		               <li><a href="#">注销</a></li>
		            </ul>
		         </li>
		      </ul>
		   </div>
	</nav>
    <jsp:include page="left.jsp"></jsp:include>
</body> 
</html>