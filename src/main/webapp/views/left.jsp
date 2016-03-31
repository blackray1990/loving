<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String contextPath = request.getContextPath();
%>

<body>
	<!-- 左侧菜单 -->
	<div class="panel panel-default" style="margin:3% 0 0 3%;width:180px;padding:3px">
	<div class="panel-group" id="accordion">
	  	<c:forEach items="${menus }" var="item" varStatus="status">
	  		<div class="panel panel-default folder">
			    <div class="panel-heading">
			      <h4 class="panel-title">
			        <a data-toggle="collapse" data-parent="#accordion" href="#collapse-${status.index }">
			          	${item.text }
			        </a>
			      </h4>
			    </div>
			    
			    <div id="collapse-${status.index }" class="panel-collapse collapse">
				    <c:forEach items="${item.children }" var="submenu">
				      <div class="panel-body">
				        ${submenu.text }
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
