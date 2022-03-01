<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.roomServiceOrder.model.*"%>

<%
RoomServiceOrderVO RoomServiceOrderVO = (RoomServiceOrderVO) request.getAttribute("RoomServiceOrderVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<%@ include file= "/back-end/framework/include.file" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resource/css/styles.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
</head>
<body>
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
<table id="datatablesSimple">
<thead>
	<tr>
		<th>�A�ȭq��s��</th>
		<th>�и�</th>
		<th>�A�ȭq�檬�A</th>
		<th>�A�ȭq����</th>
	</tr>
</thead>
	<tr>
		<td><%=RoomServiceOrderVO.getService_order_id()%></td>
		<td><%=RoomServiceOrderVO.getRoom_id()%></td>
		<td><%=RoomServiceOrderVO.getService_order_status()?"���I��":"�w�I��"%></td>
		<td><%=RoomServiceOrderVO.getService_order_date()%></td>
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
<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
</body>
</html>