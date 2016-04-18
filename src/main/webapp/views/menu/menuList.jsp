<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	td {
		width: 80px;
		text-align: left;
	}
	.input_td {
		width: 200px;
	}
	.com-btn {
		color: black;
		background: linear-gradient(to bottom, #FFF 0px, #EEE 100%) repeat-x scroll 0% 0% transparent;
		border: 1px solid #BBB;
		border-radius: 0px;
		cursor: pointer;
		height:40px;width:80px;
	}
	
	
</style>
<body>
<!-- 	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',split:true" style="width: 250px;">
			<div id="menupanel">
				<ul id="emenus" class="easyui-tree"
					data-options="url:'menu/loadmenu.do',animate:true,lines:true,dnd:true,checkbox:true"></ul>
			</div>
		</div>
		<div></div>
	</div> -->
	<!-- 顶部 -->  
	<%@ include file="/views/header.jsp" %>
	
	<!-- 左 -->
	<div class="col-lg-2 col-sm-2" align="center">
        <%@ include file="/views/left.jsp" %>
    </div>
    <!-- 中 -->
    <div class="col-lg-8 col-sm-8" style="padding-left:50px;">
    
    	<div class="panel panel-default">
		   <div class="panel-body">
		      <fieldset id="dataset" style="width: 100%;">
				<legend>详情</legend>
				<br />
				<br />
				<form id="menuform" onsubmit="return false;" class="form-horizontal">
					<!-- 左区域 -->
					<div class="col-sm-6">
						<div class="form-group">
							<label for="text" class="col-sm-5 control-label">名称</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="mtitle" name="text" />
							</div>
						</div>
						<div class="form-group">
							<label for="text" class="col-sm-5 control-label">上级目录</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="mparenttext" />
							</div>
						</div>
						<div class="form-group">
							<label for="text" class="col-sm-5 control-label">模板</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="mparenttext" />
							</div>
						</div>
					</div>
					<!-- 右区域 -->
					<div class="col-sm-6">
						<div class="form-group">
							<label for="text" class="col-sm-5 control-label">是否目录</label>
							<div class="col-lg-7">
								<select class="form-control ">
							         <option value="">请选择</option>
							         <option value="">是</option>
							         <option value="">否</option>
							      </select>
							</div>
					   </div>
						<div class="form-group">
							<label for="text" class="col-sm-5 control-label">URL</label>
							<div class="col-lg-5">
								<div><input type="text" class="form-control " id="murl" name="url" /></div>
							</div>
							<div class="col-sm-2" style="padding-top:7px">
								<a  href="#">文章</a>
							</div>
						</div>
						
						<div class="form-group">
							<label for="text" class="col-sm-5 control-label">打开方式</label>
							<div class="col-lg-7">
								<select class="form-control ">
							         <option value="">请选择</option>
							         <option value="">当前页面</option>
							         <option value="">新页面</option>
							      </select>
							</div>
					   </div>
					</div>
					
					<p align="center">
						<button type="button" style="margin-top:100px;width:20%" class="btn btn-primary btn-lg">保存</button>
					</p>
				</form>
			</fieldset>
		   </div>
		</div>
		
	</div>
     <!-- 右 -->
     <div class="col-lg-2 col-sm-2" align="center"></div>
</body>
