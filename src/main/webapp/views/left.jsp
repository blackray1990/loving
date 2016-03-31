<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String contextPath = request.getContextPath();
%>

<body>
	<!-- 左侧菜单 -->
	<div class="panel panel-default" style="width:200px;padding:5px">
	<div class="panel-group" id="accordion" style="margin-bottom: 0">
	  	<c:forEach items="${menus }" var="item" varStatus="status">
	  	
	  		<c:if test="${item.location == 1}">
	  			<div class="panel panel-info folder ">
	  		</c:if>
	  		<c:if test="${item.location !=1}">
	  			<div class="panel panel-default folder ">
	  		</c:if>
			    <div class="panel-heading" style="text-align: center">
			      <h4 class="panel-title">
			      	<c:if test="${item.isFolder==1 }">
			      		<a data-toggle="collapse" data-parent="#accordion" href="#collapse-${status.index }">
				          	${item.text }
				        </a>
			      	</c:if>
			        <c:if test="${item.isFolder==0 }">
			      		<a href="${item.url }">
				          	${item.text }
				        </a>
			      	</c:if>
			      </h4>
			    </div>
			    
			    <div id="collapse-${status.index }" class="panel-collapse collapse">
				    <c:forEach items="${item.children }" var="submenu">
				      <div class="panel-body">
				        <a href="${submenu.url }">${submenu.text }</a>
				      </div>
				    </c:forEach>
			    </div>
			</div>
		</c:forEach>
	</div>
	</div>
	<script>
		$(document).ready(function(){
			
			$(".folder").click(function(){
				
				if($(this).hasClass('panel-default')){	//未选中状态，点击变为选中
					$(".folder").removeClass('panel-info').addClass('panel-default');
					$(this).removeClass('panel-default').addClass('panel-info');
				}else{
					$(this).removeClass('panel-info').addClass('panel-default');
				}
			});
		});
	</script>
</body>
