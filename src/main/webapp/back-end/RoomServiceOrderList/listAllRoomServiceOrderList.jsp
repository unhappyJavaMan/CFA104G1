<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.roomServiceOrderList.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
    List<RoomServiceOrderListVO> list = rsolsSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�ȩЪA�ȭq�����</title>
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
    <link href="<%=request.getContextPath()%>/resource/css/styles.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">�ȩЪA�ȭq�����</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/RoomServiceOrder/listAllRoomServiceOrder.jsp">�ȩЪA�ȭq��C��</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/RoomServiceOrder/select_page.jsp">�ȩЪA�ȭq��d��</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/RoomServiceOrderList/select_page.jsp">�ȩЪA�ȭq����Ӭd��</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table id="datatablesSimple">
<thead>
	<tr>
		<th>�q��s��</th>
		<th>�\�I�s��</th>
		<th>�\�I����</th>
		<th>�\�I�ƶq</th>
		<th>�\�I�`�p</th>
		<th>�R��</th>
	</tr>
		</thead>
<%-- 	<%@ include file="page1.file" %>  --%>
	<c:forEach var="RoomServiceOrderListVO" items="${list}" >
		
		<tr>
			<td>${RoomServiceOrderListVO.service_order_id}</td>
			<td>${RoomServiceOrderListVO.meal_id}</td>
			<td>${RoomServiceOrderListVO.meal_price}</td>
			<td>${RoomServiceOrderListVO.meal_quantity}</td>
			<td>${RoomServiceOrderListVO.meal_total}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrderList/RoomServiceOrderList.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="service_order_id"  value="${RoomServiceOrderListVO.service_order_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
		</div>
    </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>

<%-- <%@ include file="page2.file" %> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>