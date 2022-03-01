<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.roomServiceOrderList.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
RoomServiceOrderListVO RoomServiceOrderListVO = (RoomServiceOrderListVO) request.getAttribute("RoomServiceOrderListVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>���Ӹ�� - listOneMeal.jsp</title>
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
            <h1 class="m-0">�ȩЪA�ȭq����Ӹ��</h1>
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

<table id="datatablesSimple">
<thead>
	<tr>
		<th>�q��s��</th>
		<th>�\�I�s��</th>
		<th>�\�I����</th>
		<th>�\�I�ƶq</th>
		<th>�\�I�`�p</th>
	</tr>
	</thead>
	<tr>
		<td><%=RoomServiceOrderListVO.getService_order_id()%></td>
		<td><%=RoomServiceOrderListVO.getMeal_id()%></td>
		<td><%=RoomServiceOrderListVO.getMeal_price()%></td>
		<td><%=RoomServiceOrderListVO.getMeal_quantity()%></td>
		<td><%=RoomServiceOrderListVO.getMeal_total()%></td>
	</tr>
</table>

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