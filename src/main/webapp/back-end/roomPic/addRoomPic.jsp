<%@page import="com.room.model.RoomVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomType.model.*"%>
<%@ page import="com.roomTypePic.model.*"%>

<%
RoomTypePicVO roomTypePicVO = (RoomTypePicVO) request.getAttribute("roomTypePicVO");
%>

<!-- ���t�@�MDAO�X�ӦA�� -->
<%-- <%= empVO == null %>--${empVo.deptno}--  --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�Ӥ��s�W</title>
<%@ include file= "/back-end/framework/include.file" %>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">�Ӥ��޲z</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/roomPic/listAllRoomPic.jsp">�Ӥ��޲z</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/roomtype/listAllRoomType.jsp">�Ы��޲z</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
		<div class="card mb-4">
			<div class="card-body">
	<h3>�Ӥ��s�W:</h3>

	<%-- ���~���C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data" ACTION="<%=request.getContextPath()%>/roomType/roomTypePicServlet.do" name="form1">
		<table>
			<tr>
				<td>�Ы��W��:</td>
				<td><input type="TEXT" name="room_type_id" size="45"
					value="<%= roomTypePicVO.getRoom_type_id()%>"  /></td>
			</tr>
			<tr>
				<td>�Ы��Ϥ�</td>
				<td><input type="file" name="room_type_pic" size="50" /></td>
			</tr>

			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="�e�X�s�W">
	</FORM>
			</div>
		</div>
    </section>
    <!-- /.content -->
<%@ include file= "/back-end/framework/footer.file" %>


</body>
</html>