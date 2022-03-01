<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.hotnews.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  HotNewsVO HotNewsVO = (HotNewsVO) request.getAttribute("HotNewsVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>
<head>
<title>�\�I��� - listOneHotNews.jsp</title>
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
  }
</style>
</head>
<body bgcolor='white'>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">�̷s�������</h1>
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
        <div class="col-lg-12">
           	<div>
    	    	<a href="<%=request.getContextPath()%>/back-end/hotnews/listAllHotNews.jsp" class="btn btn-outline-dark border"> �̷s�����C�� </a>
    	    	<a href="<%=request.getContextPath()%>/back-end/hotnews/addHotNews.jsp" class="btn btn-outline-dark border"> �s�W�̷s���� </a>
    		</div>
			<table id="datatablesSimple" class="table">
				<tr>
					<th>���D</th>
					<td align="left"><%=HotNewsVO.getHot_news_title()%></td>
				</tr>	
				<tr>
					<th>���e</th>
					<td>
					<%=HotNewsVO.getHot_news_description()%>
					</td>
				</tr>	
				<tr>
					<th>���</th>
					<td><%=HotNewsVO.getHot_news_date()%></td>
				</tr>	
				<tr>
					<th>���A</th>
					<td><%=HotNewsVO.getHot_news_status()?"�W�[":"�U�["%></td>
				</tr>	
				<tr>
					<th>�Ϥ�</th>
					<td><img src="<%=request.getContextPath()%>/hotnews/DBGifReader4?HotNewsId=${HotNewsVO.hot_news_id}" width = 150px></td>
				</tr>
			</table>
		</div>
    </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>
</body>
</html>