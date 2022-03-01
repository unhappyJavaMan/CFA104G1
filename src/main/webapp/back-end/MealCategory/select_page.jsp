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
            <h1 class="m-0">��Ƭd��</h1>
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
<ul>
  <li><a href='listAllMealCategory.jsp'>List</a> all Meal.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MealCategory/mealcategory.do" >
        <b>��J���O�s�� (�p1):</b>
        <input type="text" name="meal_category_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="mealcategorySvc" scope="page" class="com.mealCategory.model.MealCategoryService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MealCategory/mealcategory.do" >
       <b>������O�s��:</b>
       <select size="1" name="meal_category_id">
         <c:forEach var="mealCategoryVO" items="${mealcategorySvc.all}" > 
          <option value="${mealCategoryVO.meal_category_id}">${mealCategoryVO.meal_category_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MealCategory/mealcategory.do" >
       <b>������O�W��:</b>
       <select size="1" name="meal_category_id">
         <c:forEach var="mealCategoryVO" items="${mealcategorySvc.all}" > 
          <option value="${mealCategoryVO.meal_category_id}">${mealCategoryVO.meal_category_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���O�޲z</h3>

<ul>
  <li><a href='addMealCategory.jsp'>Add</a> a new Meal.</li>
</ul>
		</div>
    </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>



	
<%-- ���~��C --%>
<%-- <c:if test="${n	ot empty errorMsgs}"> --%>
<!-- 	<font style="color:red">�Эץ��H�U���~:</font> -->
<!-- 	<ul> -->
<%-- 	    <c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>



</body>
</html>