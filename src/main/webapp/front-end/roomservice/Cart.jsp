<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* , com.meal.model.Meal" %>
<%@ page import="com.meal.model.*"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor="#FFFFFF">
<%
	Meal meal = new Meal();
%>
<%
Vector<Meal> buylist = (Vector<Meal>) session.getAttribute("shoppingcart");
%>
<%
if (buylist != null && (buylist.size() > 0)) {
%>

<font size="+3">�ثe�z�ʪ��������e�p�U�G</font><p>
<table border="1" width="740">
	<tr bgcolor="#999999">
		<th width="200">�W��</th><th width="100">�y�z</th><th width="100">����</th><th width="100">�ƶq</th>
		<th width="120"></th>
	</tr>
	<%
		for (int index = 0; index < buylist.size(); index++) {
				Meal order = buylist.get(index);
		%>
	<tr>
		<td width="200"><div align="center"><b><%=order.getMeal_name()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getMeal_description()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getMeal_price()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getMeal_quantity()%></b></div></td>
		
		<td width="100"><div align="center">
          <form name="deleteForm" action="<%=request.getContextPath()%>/Shopping.do" method="POST">
              <input type="hidden" name="action" value="DELETE">
              <input type="hidden" name="del" value="<%= index %>">
              <input type="submit" value="�R��"></div>
        </td></form>
	</tr>
	<%}%>
</table>
<p>
          <form name="checkoutForm" action="<%=request.getContextPath()%>/Shopping.do" method="POST">
             <input type="hidden" name="meal_id" value="${meal.meal_id}">
			 <input type="hidden" name="meal_price" value="${mealVO.meal_price}">
		     <input type="hidden" name="meal_quantity" value="${mealVO.quantity}">
              <input type="hidden" name="action"	value="CHECKOUT"> 
              <input type="submit" value="�I�ڵ��b">
          </form>
<%}%>
</body>
</html>