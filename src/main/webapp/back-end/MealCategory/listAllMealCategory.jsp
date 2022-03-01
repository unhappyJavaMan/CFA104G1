<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mealCategory.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	MealCategoryService categorySvc = new MealCategoryService();
    List<MealCategoryVO> list = categorySvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ����O��� - listAllMeal.jsp</title>
<%@ include file= "/back-end/framework/include.file" %>
<%@ include file= "/back-end/framework/includeTableCss.file" %>

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
            <h1 class="m-0">�Ҧ����O���</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/MealCategory/listAllMealCategory.jsp">���O�C��</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/MealCategory/select_page.jsp">���O�d��</a></li>

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

<table id="datatablesSimple" class="table table-bordered table-hover">
<thead>
	<tr>
		<th>���O�s��</th>
		<th>���O�W��</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	</thead>
<%-- 	<%@ include file="page1.file" %>  --%>
	<c:forEach var="mealcategoryVO" items="${list}">
		
		<tr>
			<td>${mealcategoryVO.meal_category_id}</td>
			<td>${mealcategoryVO.meal_category_name}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MealCategory/mealcategory.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="meal_category_id"  value="${mealcategoryVO.meal_category_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MealCategory/mealcategory.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="meal_category_id"  value="${mealcategoryVO.meal_category_id}">
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
<%@ include file= "/back-end/framework/includeTableJs.file" %>


<%-- <%@ include file="page2.file" %> --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
<script src="/CFA104G1/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/CFA104G1/js/datatables-simple-demo.js"></script>
</body>
</html>