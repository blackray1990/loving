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
<%-- 	<nav class="navbar navbar-default" role="navigation">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="#">笔记后台管理系统</a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav navbar-left">
	         <li><a href="#">SVN</a></li>
	         <li class="dropdown">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               Java 
	               <b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu">
	               <li><a href="#">jmeter</a></li>
	               <li><a href="#">EJB</a></li>
	               <li><a href="#">Jasper Report</a></li>
	               <li class="divider"></li>
	               <li><a href="#">分离的链接</a></li>
	               <li class="divider"></li>
	               <li><a href="#">另一个分离的链接</a></li>
	            </ul>
	         </li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
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
</nav> --%>
  <%--   <div id="north" data-options="region:'north'" style="overflow: hidden;height:120px;border-top: none;background-size:cover;background-image: url('images/header2.jpg')">
    	<div style="right: 20px;position: absolute;">欢迎你：${username } &nbsp;<a href="#" id="logout">退出登录</a></div>
    	<div style="margin-top: 10px;margin-left: 10px;width:75px;font-family: 黑体;">
    		<img src="images/cook_java.jpg" style="height: 100px;"><br/>
    	</div>
    </div>   
    <div data-options="region:'south'" style="height:auto;"><div align="center">BlackRay版权所有</div></div>      
    <div data-options="region:'west',title:'菜单项',split:false" style="width:200px;">
    	<ul id="tt" class="easyui-tree" data-options="url:'menu/loadmenu.do'"></ul>  
    </div>   
    <div data-options="region:'center'" style="padding:0px;background:#eee;">
    	<div id="tabs" class="easyui-tabs" data-options="fit:true">   
		    <div id="tab0" title="主页" style="padding:20px;text-align: center;background-position: center;background-repeat: no-repeat;"><!-- background-image: url('images/lizhi.jpg'); -->
		        <font size="4" color="green">欢迎来到知识的海洋！ </font>
		    </div>  
		</div> 
		
    </div>  --%>  
    <nav class="navbar navbar-default" role="navigation">
   <div class="navbar-header">
      <a class="navbar-brand" href="#">W3Cschool</a>
   </div>
   <div>
      <!--向左对齐-->
      <ul class="nav navbar-nav navbar-left">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               Java 
               <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a href="#">jmeter</a></li>
               <li><a href="#">EJB</a></li>
               <li><a href="#">Jasper Report</a></li>
               <li class="divider"></li>
               <li><a href="#">分离的链接</a></li>
               <li class="divider"></li>
               <li><a href="#">另一个分离的链接</a></li>
            </ul>
         </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
         <button type="submit" class="btn btn-default">
            向左对齐-提交按钮  
         </button>
      </form> 
      <p class="navbar-text navbar-left">向左对齐-文本</p>
      <!--向右对齐-->
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               Java <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a href="#">jmeter</a></li>
               <li><a href="#">EJB</a></li>
               <li><a href="#">Jasper Report</a></li>
               <li class="divider"></li>
               <li><a href="#">分离的链接</a></li>
               <li class="divider"></li>
               <li><a href="#">另一个分离的链接</a></li>
            </ul>
         </li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
         <button type="submit" class="btn btn-default">
            向右对齐-提交按钮
         </button>
      </form> 
      <p class="navbar-text navbar-right">向右对齐-文本</p>
   </div>
</nav>
</body> 
</html>