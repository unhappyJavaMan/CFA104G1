<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hotnews.model.*"%>
<%-- 絤策蹦ノ EL 糶猭 --%>

<%
    HotNewsService HotNewsSvc = new HotNewsService();
    List<HotNewsVO> list = HotNewsSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>程穝蝴臔</title>
<%@ include file= "/back-end/framework/include.file" %>
<%@ include file= "/back-end/framework/includeTableCss.file" %>

</head>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">程穝蝴臔</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/hotnews/listAllHotNews.jsp">程穝</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/hotnews/select_page.jsp">程穝琩高</a></li>

            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">
<%-- 岿粇 --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">叫タ岿粇:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>
<div class="card mb-4">
	<div class="card-header">
        <h3 class="card-title">程穝</h3>
    </div>
    <div class="card-body">
    	<div>
    	    	<a href="<%=request.getContextPath()%>/back-end/hotnews/addHotNews.jsp" class="btn btn-outline-info"> 穝糤程穝 </a>
    	</div>
		<table id="datatablesSimple" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>夹肈</th>
				<th>ら戳</th>
				<th>篈</th>
				<th>瓜</th>
				<th>э</th>
				<th>穝瓜</th>
				<th>埃</th>
			</tr>
			</thead>
			<c:forEach var="HotNewsVO" items="${list}" >
				
				<tr>
					<td>${HotNewsVO.hot_news_title}</td>
					<td>${HotNewsVO.hot_news_date}</td>
					<td>${HotNewsVO.hot_news_status? "琜" : "琜"}</td>	
					<td><img src="<%=request.getContextPath()%>/hotnews/DBGifReader4?HotNewsId=${HotNewsVO.hot_news_id}" width = 150px></td>
					<td>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/hotnews/HotNews.do" style="margin-bottom: 0px;">
					     <input type="submit" value="э" class="btn btn-outline-info">
					     <input type="hidden" name="HotNewsId"  value="${HotNewsVO.hot_news_id}">
					     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
					</td>
					<td>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/hotnews/HotNews.do" style="margin-bottom: 0px;">
					     <input type="submit" value="穝" class="btn btn-outline-info">
					     <input type="hidden" name="HotNewsId"  value="${HotNewsVO.hot_news_id}">
					     <input type="hidden" name="action" value="getPhoto_For_Update"></FORM>
					</td>
					<td>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/hotnews/HotNews.do" style="margin-bottom: 0px;">
					     <input type="submit" value="埃" class="btn btn-outline-danger">
					     <input type="hidden" name="HotNewsId"  value="${HotNewsVO.hot_news_id}">
					     <input type="hidden" name="action" value="delete"></FORM>
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
<%@ include file= "/back-end/framework/includeTableJs.file" %>
        
</body>
</html>