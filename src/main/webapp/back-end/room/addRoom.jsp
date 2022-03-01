<%@page import="java.util.List"%>
<%@page import="com.room.model.RoomVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.room.model.*"%>
<%@ page import="com.roomType.model.*"%>

<%
RoomVO roomVO = (RoomVO) request.getAttribute("roomVO");
%>
<%
RoomTypeService roomTypeService = new RoomTypeService();
List<RoomTypeVO> list = roomTypeService.getAll();
pageContext.setAttribute("list", list);
%>

<!-- ���t�@�MDAO�X�ӦA�� -->
<%-- <%= empVO == null %>--${empVo.deptno}--  --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�ж��s�W - addRoom.jsp</title>
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
select {
  width: 250px;
}
input[type='number']{
    width: 250px;
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
            <h1 class="m-0">�ж��s�W</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/room/listAllRoom.jsp">�ж��޲z</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">



	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/room/room.do" name="form1" >
		<table class="table">
			<tr>
				<td>�Ы��W��:</td>
				<td>
					<select name="room_type_id">
					<c:forEach var="roomTypeVO" items="${list}">
						
						<option value="${roomTypeVO.room_type_id}">${roomTypeVO.room_type_name}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>�ж��ɦ�:</td>
				<td><input type="number" name="qtyofbeds" size="45"
					value="<%=(roomVO == null) ? "2" : roomVO.getQtyofbeds()%>" /></td>
			</tr>
			
			<tr>
				<td>�W�[	���A:</td>
				<td>
				<select name="room_sale_status" >
					<option value="true" selected>�W�[</option>
					<option value="false">�U�[</option>
				</select>
				
				
				
			</tr>
			<tr>
				<td>�ж����A:</td>
				<td>
				<select name="room_status">
					<option value="0" selected>���J��</option>
					<option value="1">�w�J��</option>
					<option value="2">�ݲM��</option>
				</select>
				
				
<!-- 				<input type="TEXT" name="room_status" size="45" -->
<%-- 					value="<%=(roomVO == null) ? "1" : roomVO.getRoom_status()%>" /></td> --%>
			</tr>

			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="�e�X�s�W">
	</FORM>

		</div>
    </section>
    <!-- /.content -->
<%@ include file= "/back-end/framework/footer.file" %>

</body>
</html>