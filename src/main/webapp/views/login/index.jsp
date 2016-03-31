<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>笔记管理系统</title>
	</head>
	<style>
		.r_title {
		    font-size: 22px;
		    color: #33455a;
		    font-family: 'Microsoft Yahei', '黑体';
		    overflow: hidden;
		    margin-bottom: 16px;
		}
	</style>
	<body>  
		<!-- 顶部 -->  
	<jsp:include page="../header.jsp" ></jsp:include>
	
	<!-- 左 -->
	<div class="col-lg-2 col-sm-2" align="center">
        <jsp:include page="../left.jsp" ></jsp:include>
    </div>
    <!-- 中 -->
    <div class="col-lg-8 col-sm-8" style="padding-left:50px;">
    	<div  class="r_title">
    		<span>Homepage</span>
    	</div>
    </div>
    <!-- 右 -->
    <div class="col-lg-2 col-sm-2" align="center"></div>
    
	</body> 
</html>