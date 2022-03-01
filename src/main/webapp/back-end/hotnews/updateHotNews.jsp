<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.hotnews.model.*"%>

<%
  HotNewsVO HotNewsVO = (HotNewsVO) request.getAttribute("HotNewsVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�̷s������ƭק�</title>
<%@ include file= "/back-end/framework/include.file" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css" />
<link href="<%=request.getContextPath()%>/resources/plugins/summernote/summernote-bs4.min.css" rel="stylesheet">

<style>
   .xdsoft_datetimepicker .xdsoft_datepicker { 
            width:  300px;   /* width:  300px; 
   }
   .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box { 
            height: 151px;    height:  151px; 
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
            <h1 class="m-0">�̷s������ƭק�</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/hotnews/listAllHotNews.jsp">�̷s�����C��</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/hotnews/select_page.jsp">�̷s�����d��</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
			<div class="card">
				<div class="card-body">
				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">�Эץ��H�U���~:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/hotnews/HotNews.do" name="form1" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td>�̷s�������D:</td>
						<td><input type="TEXT" name="hot_news_title" size="45"  placeholder="�п�J�̷s�������D"
							 value="<%=HotNewsVO.getHot_news_title()%>" /></td>
					</tr>
				
					<tr>
						<td>�̷s�������e:</td>
						<td>
							<textarea id="hot_news_description" name="hot_news_description" rows="5" class="form-control">
							<%=HotNewsVO.getHot_news_description()%>
							</textarea>
						</td>
					</tr>
					<tr>
						<td>�̷s�������:</td>
						<td><input type="TEXT" id="hot_news_date" name="hot_news_date" size="45"
							value="<%=HotNewsVO.getHot_news_date()%>" /></td>
					</tr>
					<tr>
						<td>�̷s�������A:</td>
						<td><select name="hot_news_status" size="0">
							<option value="true">�W�[</option>
							<option value="false">�U�[</option>
						</select></td>
					</tr>
				</table>
				</div>
				<div class="card-footer">
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="hot_news_id" value="<%=HotNewsVO.getHot_news_id()%>">
					<input class="btn btn-outline-success" type="submit" value="�e�X�ק�">
					<a class="btn btn-outline-secondary" 
					   href="<%=request.getContextPath()%>/back-end/hotnews/listAllHotNews.jsp">���ק�</a>					
				</FORM>
				</div>
			</div>
   </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- Summernote -->
<script src="<%=request.getContextPath()%>/resources/plugins/summernote/summernote-bs4.min.js"></script>


<script>
$('document').ready(function()
	{
	    $('textarea').each(function(){
            $(this).val($(this).val().trim());
        }
    );
});
$(function () {
    // Summernote
    $('#hot_news_description').summernote({
        height: 180,
        placeholder: '�п�J�̷s�������e'
      });
});

$.datetimepicker.setLocale('zh');
$('#hot_news_date').datetimepicker({
  timepicker:false,       //timepicker:true,
  format:'Y-m-d',         //format:'Y-m-d H:i:s',
});
        
</script>

</body>

</html>