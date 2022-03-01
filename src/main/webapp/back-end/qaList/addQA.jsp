<%@page import="com.qalist.model.QAListVO"%>
<%@page import="com.room.model.RoomVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.room.model.*"%>

<%
QAListVO qaListVO = (QAListVO) request.getAttribute("qaListVO");
%>

<!-- ���t�@�MDAO�X�ӦA�� -->
<%-- <%= empVO == null %>--${empVo.deptno}--  --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>QA�s�W </title>
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
  width: 338px;
}
input[type='number']{
    width: 338px;
} 
textarea {
  resize: none;
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
            <h1 class="m-0">QA�޲z</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()+"/back-end/qaList/listAllQA.jsp" %>">QA�޲z</a></li>
              <li class="breadcrumb-item active">QA�s�W</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<h3>��Ʒs�W:</h3>
			</div>
			<div class="card-body">
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/qaList/qaList.do" name="form1">
		<table>
			<tr>
				<td>��ܶ���:</td>
				<td><input type="number" name="no" size="45"
					value="<%=(qaListVO == null) ? "3" : qaListVO.getNo()%>" /></td>
			</tr>
			<tr>
				<td>���D:</td>
				<td><input type="TEXT" name="question" size="40"
					value="<%=(qaListVO == null) ? "���D?" : qaListVO.getQuestion() %>" /></td>
			</tr>
			
			<tr>
				<td>����:</td>
				<td><textarea  name="answer" rows="4" cols="43"><%=(qaListVO == null) ? "�Ц^��" : qaListVO.getAnswer()%></textarea>
				
</td>
			</tr>
			<tr>
				<td>���A:</td>
				<td>
				<select name="status" >
					<option value="true" selected>�W�[</option>
					<option value="false">�U�[</option>
				</select>
				
				</td>
			</tr>

			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="�e�X�s�W">
	</FORM>

			</div>
		</div>
		</div>

    </section>

<%@ include file= "/back-end/framework/footer.file" %>
</body>
</html>