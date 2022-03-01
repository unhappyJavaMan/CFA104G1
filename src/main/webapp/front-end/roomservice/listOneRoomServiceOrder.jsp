<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.roomServiceOrder.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>



<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�ȩЪA�ȭq��</title>
<%@ include file= "/front-end/framework/include.file" %>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resource/css/styles.css" rel="stylesheet"
	type="text/css" />

</head>
<body bgcolor=#FFFFFF>
<%@ include file= "/front-end/framework/header.file" %>
     <div class="section-header">
         <h2>�ȩЪA�ȭq��d��</h2>
     </div>
	<div class="container">
<FORM METHOD="post"
	ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do">
	<b>��J�A�ȩж��s�� (�p200):</b> <input type="text" name="room_id" value="">
	<input type="hidden" name="action" value="getOne_For_Display2">
	<input type="submit" value="�e�X">
</FORM>


<nav aria-label="breadcrumb">
					<ol class="breadcrumb justify-content-center text-uppercase">
						<li class="breadcrumb-item">
						<a href="<%=request.getContextPath()%>/front-end/roomservice/service.jsp">�^�ȩЪA��</a></li>
					</ol>
				</nav>
				<%
					RoomServiceOrderService list = new RoomServiceOrderService();
				%>
				<%
					String roomid = request.getParameter("room_id");
					if (roomid != null) {
						Integer room_id = Integer.parseInt(roomid);
			     %>

	<table id="datatablesSimple">
		<thead>
			<tr>
				<th>�A�ȭq��s��</th>
				<th>�и�</th>
				<th>�A�ȭq�檬�A</th>
				<th>�A�ȭq����</th>
				<th>�d�ݭq�����</th>
			</tr>
		</thead>
		
		<%
		for (RoomServiceOrderVO RoomServiceOrderVO : list.getAllOrderByPK(room_id)) {
			if (RoomServiceOrderVO.getService_order_status() == true) {
		%>
		<tr>
			<td><%=RoomServiceOrderVO.getService_order_id()%></td>
			<td><%=RoomServiceOrderVO.getRoom_id()%></td>
			<td><%=RoomServiceOrderVO.getService_order_status() ? "���I��" : "�w�I��"%></td>
			<td><%=RoomServiceOrderVO.getService_order_date()%></td>
			<td><input type="submit" value="�d�ݭq�����"
				onclick="Open<%=RoomServiceOrderVO.getService_order_id()%>();">
			</td>
		</tr>
		<script>
	function Open<%=RoomServiceOrderVO.getService_order_id()%>(){
		window.open("<%=request.getContextPath()%>/front-end/roomservice/listOneRoomServiceOrderList.jsp?service_order_id="+ <%=RoomServiceOrderVO.getService_order_id()%> ,"","width=600,height=200,top=500,left=500");
	}
 </script>
		<%}%>
		<%}%>
		<%}%>
	</table>
</div>
	
<%@ include file= "/front-end/framework/footer.file" %>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
			crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>

</html>