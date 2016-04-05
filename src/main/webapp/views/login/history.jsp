<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>笔记管理系统</title>
	</head>
	
	<!-- <p>通过spring自动切换数据源至ext扩展数据源：</p> -->
	<style>
		.r_title {
		    font-size: 22px;
		    color: #33455a;
		    font-family: 'Microsoft Yahei', '黑体';
		    overflow: hidden;
		    margin-bottom: 16px;
		}
		.search_form {
		    vertical-align: top;
		    border: 1px solid #ccc;
		    border-radius: 3px;
		    display: inline-block;
		    overflow: hidden;
		    height: 33px;
		}
		.search_wrap {
		    float: right;
		    height: 38px;
		}
		.search_input {
		    color: #4b4b4b;
		    font-size: 12px;
		    padding: 9px;
		    width: 148px;
		    vertical-align: top;
		    border: none;
		}
		.search_btn {
		    display: inline-block;
		    width: 32px;
		    height: 36px;
		    background: url(imgs/search_input_bg.png) no-repeat center center;
		    cursor: pointer;
		    border: none;
		    vertical-align: top;
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
    		<span>登陆日志查询</span>
    		<div class="search_wrap">
	            <form action="" class="search_form">
	                <input type="text" name="key" value="" placeholder="输入关键字查询" class="search_input fi_1" maxlength="16" data-hint="商品名称">
	                <button class="search_btn"></button>
	            </form>
	        </div>
    	</div>
    	
      <div style="">
		 <table class="table table-striped table-bordered">
	       <thead>
	         <tr>
				<th>登录名</th>
				<th>登录时间</th>
				<th>登录IP地址</th>
		  		<th>详情</th>
	         </tr>
	       </thead>
	       <tbody>
			<c:forEach items="${page.items }" var="item" >
				<tr>
					<td width="15%">${item.loginName}</td>
					<td width="20%">${item.lastLoginTime}</td>
					<td width="15%">${item.ipAdd}</td>
					<td>${item.remark}</td>
			  	</tr>
		  	</c:forEach>
	       </tbody>
		 </table>
      </div>
      <ul class="pagination" style="float:right">
		 <li><a href="#" data-current='${page.currentPage-1 }'>&laquo;</a></li>
		 <c:forEach var="i" begin="1" end="${page.totalPage }">
		 	<c:if test="${page.currentPage==i }">
		 		<li class="active"><a href="#" data-current='${i }'>${i }</a></li>
		 	</c:if>
		 	<c:if test="${page.currentPage!=i }">
		 		<li><a href="#" data-current='${i }'>${i }</a></li>
		 	</c:if>
		 </c:forEach>
		 <li><a href="#" data-current='${page.currentPage+1 }'>&raquo;</a></li>
		 
		 <script>
		 	$(document).ready(function(){
		 		$(".pagination li").click(function(){
		 			var currentPageEle = "<input type='hidden' name='currentPage' value='"+$(this).children('a').data('current')+"' />";
		 			$(".search_form").append(currentPageEle);
		 			$(".search_form").submit();
		 		});
		 	});
		 </script>
	  </ul>
    </div>
     <!-- 右 -->
     <div class="col-lg-2 col-sm-2" align="center"></div>
	</body> 
</html>