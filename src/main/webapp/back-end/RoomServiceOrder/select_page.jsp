<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Meal: Home</title>
<%@ include file= "/back-end/framework/include.file" %>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">�ȩЪA�ȭq��d��</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/RoomServiceOrder/listAllRoomServiceOrder.jsp">�ȩЪA�ȭq��C��</a></li>

            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllRoomServiceOrder.jsp'>List</a> all Meal.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do" >
        <b>��J�A�ȭq��s�� (�p1):</b>
        <input type="text" name="service_order_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="rsosSvc" scope="page" class="com.roomServiceOrder.model.RoomServiceOrderService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do" >
       <b>��ܪA�ȭq��s��:</b>
       <select size="1" name="service_order_id">
         <c:forEach var="RoomServiceOrderVO" items="${rsosSvc.all}" > 
          <option value="${RoomServiceOrderVO.service_order_id}">${RoomServiceOrderVO.service_order_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RoomServiceOrder/RoomServiceOrder.do" >
       <b>��ܩж��s���W��:</b>
       <select size="1" name="service_order_id">
         <c:forEach var="RoomServiceOrderVO" items="${rsosSvc.all}" > 
          <option value="${RoomServiceOrderVO.service_order_id}">${RoomServiceOrderVO.room_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


		</div>
    </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>


</body>
</html>