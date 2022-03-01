<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.roomServiceOrder.model.*"%>

<%
RoomServiceOrderService rsosSvc = new RoomServiceOrderService();
    List<RoomServiceOrderVO> list = rsosSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�ȩЪA�ȭq��</title>
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
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/CFA104G1/resource/css/styles.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
</head>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">�ȩЪA�ȭq��</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/RoomServiceOrder/listAllRoomServiceOrder.jsp">�ȩЪA�ȭq��C��</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/RoomServiceOrder/select_page.jsp">�ȩЪA�ȭq��d��</a></li>

            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">

<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div class="card mb-4">
    <div class="card-body">
<table id="datatablesSimple">
<thead>
	<tr>
		<th>�A�ȭq��s��</th>
		<th>�и�</th>
		<th>�A�ȭq�檬�A</th>
		<th>�A�ȭq����</th>
		<th>�ק�</th>
		<th>�R��</th>
		<th>����</th>
	</tr>
	</thead>
	<c:forEach var="RoomServiceOrderVO" items="${list}" >
		
		<tr>
			<td>${RoomServiceOrderVO.service_order_id}</td>
			<td>${RoomServiceOrderVO.room_id}</td>
			<td>${RoomServiceOrderVO.service_order_status? "���I��" : "�w�I��"}</td>
			<td>${RoomServiceOrderVO.service_order_date}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="service_order_id"  value="${RoomServiceOrderVO.service_order_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="service_order_id"  value="${RoomServiceOrderVO.service_order_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do" style="margin-bottom: 0px;">
			  	 <input type="submit" value="����">
			     <input type="hidden" name="service_order_id"  value="${RoomServiceOrderVO.service_order_id}">
			     <input type="hidden" name="action" value="checkout"></FORM>
			  </form>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>

		</div>
    </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
<script src="/CFA104G1/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/CFA104G1/resources/js/datatables-simple-demo.js"></script>
</body>
</html>