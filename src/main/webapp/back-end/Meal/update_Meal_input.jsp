<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.meal.model.*"%>

<%
  MealVO mealVO = (MealVO) request.getAttribute("mealVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�\�I��ƭק� - update_Meal_input.jsp</title>
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
</style>

</head>
<body bgcolor='white'>
<%@ include file= "/back-end/framework/header.file" %>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">�\�I��ƭק�</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/Meal/listAllMeal.jsp">�\�I�C��</a></li>
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/back-end/Meal/select_page.jsp">�\�I�d��</a></li>

            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="col-lg-12">
<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Meal/meal.do" name="form1" enctype="multipart/form-data">
<table>
<!-- 	<tr> -->
<!-- 		<td>�\�I�s��:<font color=red><b>*</b></font></td> -->
<%-- 		<td><%=mealVO.getMeal_id()%></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>�\�I�W��:</td>
		<td><input type="TEXT" name="meal_id" size="45" value="<%=mealVO.getMeal_id()%>" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>�\�I���O:</td> -->
<%-- 		<td><input type="TEXT" name="meal_category_id" size="45" value="<%=mealVO.getMeal_category_id()%>" /></td> --%>
<!-- 	</tr> -->
<jsp:useBean id="categorySvc" scope="page" class="com.mealCategory.model.MealCategoryService" />
	<tr>
		<td>�\�I���O:<font color=red><b>*</b></font></td>
		<td><select size="1" name="meal_category_id">
			<c:forEach var="mealcategoryVO" items="${categorySvc.all}">
				<option value="${mealcategoryVO.meal_category_id}" ${(mealVO.meal_category_id==mealcategoryVO.meal_category_id)? 'selected':'' } >${mealcategoryVO.meal_category_name}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>�\�I�y�z:</td>
		<td><input type="TEXT" name="meal_description" size="45"	value="<%=mealVO.getMeal_description()%>" /></td>
	</tr>
	<tr>
		<td>�\�I����:</td>
		<td><input type="TEXT" name="meal_price" size="45"	value="<%=mealVO.getMeal_price()%>" /></td>
	</tr>
	<tr>
		<td>�\�I�W��:</td>
		<td><input type="TEXT" name="meal_name" size="45" value="<%=mealVO.getMeal_name()%>" /></td>
	</tr>
	<tr>
		<td>�\�I�ƶq:</td>
		<td><input type="TEXT" name="meal_quantity" size="45" value="<%=mealVO.getMeal_quantity()%>" /></td>
	</tr>
	<tr>
		<td>�\�I���A:</td>
		<td><select name="meal_status" size="0" >
			<option value="<%=mealVO.getMeal_status()%>">
			<option value="true">�W�[</option>
			<option value="false">�U�[</option>
		</select></td>
	</tr>
	<tr>
		<td>�\�I�ۤ�:</td>
		<td><input type="file" name="meal_photo" size="45" id="flie" value="<%=mealVO.getMeal_photo()%>"/></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>����:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="meal_id" value="<%=mealVO.getMeal_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
		</div>
    </section>
    <!-- /.content -->
	<!--*******************
		Start Include JS File
		******************* -->
<%@ include file= "/back-end/framework/footer.file" %>
<script src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.full.js"></script>


</body>

<script>
         $.datetimepicker.setLocale('zh');
         $('#f_date1').datetimepicker({
            theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%--  		   value: '<%=empVO.getHiredate()%>',  value:   new Date(), --%> --%>
            disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           startDate:	            '2017/07/10',  // �_�l��
           minDate:               '-1970-01-01', // �h������(���t)���e
           maxDate:               '+1970-01-01'  // �h������(���t)����
         });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
        function show(thisimg) {
	var file = thisimg.files[0];
	if(window.FileReader) {
		var fr = new FileReader();
		
		var showimg = document.getElementById('showimg');
		fr.onloadend = function(e) {
		showimg.src = e.target.result;
	};
	fr.readAsDataURL(file);
	showimg.style.display = 'block';
	}
}
      
</script>
</html>