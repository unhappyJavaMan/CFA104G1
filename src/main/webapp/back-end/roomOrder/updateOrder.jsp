<%@page import="com.room.model.RoomVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomOrder.model.*"%>

<%
RoomOrderVO roomOrderVo = (RoomOrderVO) request.getAttribute("roomOrderVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�q���ƭק�</title>
<%@ include file= "/back-end/framework/include.file" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css" />
<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
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
	width: 550px;
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
  input{
  	margin-right: 250px;
  }
  select {
  width: 190px;
}
</style>

</head>
<body bgcolor='white'>
<body class="sb-nav-fixed">
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">��J�q��޲z</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/roomOrder/listAllOrder.jsp">��J�q��޲z</a></li>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/roomOrder/RoomOrderServlet.do" name="form1">
<table class="table">
	<tr>
		<td>��Эq��s��:<font color=red><b>*</b></font></td>
		<td><%=roomOrderVo.getRoom_order_id()%></td>
	</tr>
	<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><%=roomOrderVo.getMem_id()%></td>
	</tr>
	<tr>
		<td>�q����:</td>
		<td><%=roomOrderVo.getOrder_date()%></td>
	</tr>
	<tr>
		<td>�q���`���B:</td>
		<td><%=roomOrderVo.getRoom_charge()%></td>
	</tr>
	<tr>
		<td>�q�檬�A:</td>
		<td><select name="room_order_status">
					<option value="0" ${(roomOrderVO.room_order_status== 0)? 'selected':'' }>�q�����</option>
					<option value="1" ${(roomOrderVO.room_order_status== 1)? 'selected':'' }>���J��</option>
					<option value="2" ${(roomOrderVO.room_order_status== 2)? 'selected':'' }>�w�J��</option>
					<option value="3" ${(roomOrderVO.room_order_status== 3)? 'selected':'' }>�w����</option>
		</select></td>		
		

	</tr>
	<tr>
		<td>��J����:</td>
		<td><input type="number" name="room_review" size="20 "	
		value="<%=(roomOrderVo == null) ? "0" : roomOrderVo.getRoom_review()%>" /></td>
	</tr>
		<tr>
		<td>��Ф��:</td>
		<td><input name=arrival_date id="f_date1" type="text"></td>
	</tr>
		<tr>
		<td>�h�Ф��:</td>
		<td><input name="departure_date" id="f_date2" type="text"></td>
	</tr>

	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="room_charge" value="<%=roomOrderVo.getRoom_charge()%>">
<input type="hidden" name="order_date" value="<%=roomOrderVo.getOrder_date()%>">
<input type="hidden" name="mem_id" value="<%=roomOrderVo.getMem_id()%>">
<input type="hidden" name="room_order_id" value="<%=roomOrderVo.getRoom_order_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
        
		</div>
    </section>
    <!-- /.content -->
<%@ include file= "/back-end/framework/footer.file" %>
 <script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>
        
<script>
$.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=roomOrderVo.getArrival_date()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           minDate:               new Date(), // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
$.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
           theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=roomOrderVo.getDeparture_date()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           minDate:               new Date(), // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
</script>    
</body>
</html>