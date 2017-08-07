<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="description" content=""/>
<meta name="author" content=""/>

<title>学生列表</title>


<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"/>
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"/>
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css"/>



</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">川农学生管理系统 v2.0</a>
		</div>


		<ul class="nav navbar-top-links navbar-right">
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
					<li class="divider"></li>
					<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a></li>
				</ul> 
		</ul>
		
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容..."/>
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
						</div> 
					</li>
					<li><a href="customer.action" class="active"><i
							class="fa fa-edit fa-fw"></i>学生管理</a></li>
					
				</ul>
			</div>
		</div>
	 </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">学生管理系统</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/student/list.action" method="post">
						<div class="form-group">
							<label for="studentName">学生姓名</label> 
							<input type="text" class="form-control" id="studentName" value="${studentName }" name="studentName"/>
						</div>
						<div class="form-group">
							<label for="studentSex">学生性别</label> 
							<select	class="form-control" id="studentSex" placeholder="学生性别" name="studentSex">
								<option value="">--请选择--</option>
								<c:forEach items="${sexType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == studentSex}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="studentCollege">所属学院</label> 
							<select	class="form-control" id="studentCollege"  name="studentCollege">
								<option value="">--请选择--</option>
								<c:forEach items="${collegeType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == studentCollege}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="studentGrade">学生年级</label>
							<select	class="form-control" id="studentGrade" name="studentGrade">
								<option value="">--请选择--</option>
								<c:forEach items="${gradeType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == studentGrade}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<a href="#" class="btn btn-primary " data-toggle="modal" data-target="#studentInsertDialog" ">添加</a>
						
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">学生信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped" align="center" style="text-align:center">
							<thead>
								<tr>
									<th>ID</th>
									<th>学生姓名</th>
									<th>学生学号</th>
									<th>学生性别</th>
									<th>所属学院</th>
									<th>学生年级</th>
									<th>联系方式</th>
									<th>操作选择</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.stu_id}</td>
										<td>${row.stu_name}</td>
										<td>${row.stu_number}</td>
										<td>${row.stu_sex}</td>
										<td>${row.stu_college}</td>
										<td>${row.stu_grade}</td>
										<td>${row.stu_phone}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studentEditDialog" onclick="editStudent(${row.stu_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteStudent(${row.stu_id})">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/student/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 学生编辑对话框 -->
	<div class="modal fade" id="studentEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_student_form">
						<input type="hidden" id="edit_stu_id" name="stu_id"/>
						<div class="form-group">
							<label for="edit_studentName" class="col-sm-2 control-label">学生名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studentName" placeholder="学生名称" name="stu_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studentNumber" class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studentNumber" placeholder="学号" name="stu_number">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studentSex" style="float:left;padding:7px 15px 0 27px;">学生性别</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_studentSex" placeholder="学生性别" name="stu_sex">
									<option value="">--请选择--</option>
									<c:forEach items="${sexType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == studentSex}"> selected</c:if>>${item.dict_item_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studentCollege" style="float:left;padding:7px 15px 0 27px;">所属学院</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_studentCollege"  name="stu_college">
									<option value="">--请选择--</option>
									<c:forEach items="${collegeType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == studentCollege}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_studentGrade" style="float:left;padding:7px 15px 0 27px;">学生年级</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_studentGrade" name="stu_grade">
									<option value="">--请选择--</option>
									<c:forEach items="${gradeType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == studentGrade}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					
						<div class="form-group">
							<label for="edit_studentPhone" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_studentPhone" placeholder="移动电话" name="stu_phone"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateStudent()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
		<!-- 学生添加对话框 -->
	<div class="modal fade" id="studentInsertDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_student_form">
						<input type="hidden" id="add_stu_id" name="stu_id"/>
						<div class="form-group">
							<label for="add_studentName" class="col-sm-2 control-label">学生名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_studentName" placeholder="学生名称" name="stu_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="add_studentNumber" class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_studentNumber" placeholder="学号" name="stu_number"/>
							</div>
						</div>
						<div class="form-group">
							<label for="add_studentSex" style="float:left;padding:7px 15px 0 27px;">学生性别</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="add_studentSex" placeholder="学生性别" name="stu_sex">
									<option value="">--请选择--</option>
									<c:forEach items="${sexType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == studentSex}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_studentCollege" style="float:left;padding:7px 15px 0 27px;">所属学院</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="add_studentCollege"  name="stu_college">
									<option value="">--请选择--</option>
									<c:forEach items="${collegeType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == studentCollege}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_studentGrade" style="float:left;padding:7px 15px 0 27px;">学生年级</label>
							<div class="col-sm-10">
								<select	class="form-control" id="add_studentGrade" name="stu_grade">
									<option value="">--请选择--</option>
									<c:forEach items="${gradeType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == studentGrade}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					
						<div class="form-group">
							<label for="add_studentPhone" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_studentPhone" placeholder="移动电话" name="stu_phone"/>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="insertStudent()">保存修改</button>
				</div>
			</div>
		</div>
	</div>




	<script src="<%=basePath%>js/jquery.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editStudent(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>student/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_stu_id").val(data.stu_id);
					$("#edit_studentName").val(data.stu_name);
					$("#edit_studentNumber").val(data.stu_number);
					$("#edit_studentSex").val(data.stu_sex)
					$("#edit_studentCollege").val(data.stu_college)
					$("#edit_studentGrade").val(data.stu_grade)
					$("#edit_studentPhone").val(data.stu_phone);
					
				}
			});
		}
		
		function updateStudent() {
			$.post("<%=basePath%>student/update.action",$("#edit_student_form").serialize(),function(data){
				alert("学生信息更新成功！");
				window.location.reload();
			});
		}
		function insertStudent() {
			$.post("<%=basePath%>student/insert.action",$("#add_student_form").serialize(),function(data)
					{
				        alert("学生信息添加成功！");
				        window.location.reload();
			});
		}
		
		
		function deleteStudent(id) {
			if(confirm('确实要删除该学生吗?')) {
				$.post("<%=basePath%>student/delete.action",{"id":id},function(data){
					alert("学生删除成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
