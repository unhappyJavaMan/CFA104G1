<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*" %>

<!-- 前台_付款成功頁面 -->
<!DOCTYPE html>
<html>
<head>
<%@ include file= "/front-end/framework/include.file" %>
	<!--*******************	
		Start Include CSS File  
		******************* -->
        <%@ include file="../front_include_page/CSS_link.jsp"%>
	<!--*******************	
		End Include CSS File  
		******************* -->        
		
		<style>
		.card{
			display:inline; 
 			text-align:center;/*信用卡卡號文字置中 */
		}
		
		</style>
        
        <title>商城</title>

        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/front-end/front_CSS_JS/assets/img/favicon.png">
</head>
<body>
<%@ include file= "/front-end/framework/header.file" %>
	    <!-- Start Preloader Area 載入畫面(圈圈)-->
        <div class="preloader">
            <div class="loader">
                <div class="sbl-half-circle-spin">
                    <div></div>
                </div>
            </div>
        </div>
        <!-- End Preloader Area 載入畫面(圈圈)-->	
		
	


	<!--*******************	
		Start Top Head Area  
		******************* -->
		<%@ include file="../front_include_page/Top_head.jsp"%>
	<!--*******************	
		End Top Head Area  
		******************* -->	

	<!--*******************	
		Start Navbar Area  
		******************* -->		
		<%@ include file="../front_include_page/navbar.jsp"%>
	<!--*******************	
		End Navbar Area  
		******************* -->



	 <!-- Start Page Banner -->
        <div class="page-title-area">
            <div class="container">
                <div class="page-title-content">
                    <h2>付款成功</h2>
                </div>
            </div>
        </div>
        <!-- End Page Banner -->

        <!-- Start Login Area -->
        <section class="login-area ptb-50">
            <div class="container">
                <div class="login-form">
                    <h2>付款成功</h2>

                    <form method="post" action="<%=request.getContextPath()%>/product/Product.do">
						<div class="form-group">
                        	<h4>已收到您的款項</h4>
                        </div>             
                    	<hr>
                        <div class="form-group">
                        	<h4>訂單編號 : ${productOrderVO.o_no}</h4>
                        </div>   
                        <button type="submit">回到商品頁面</button>
                        <input type="hidden" name="action" value="showAllProduct">
                    </form>
                </div>
            </div>
        </section>
        <!-- End Login Area -->

	<!--*******************	
		Start Footer Area  
		******************* -->			
		<%@ include file="../front_include_page/footer.jsp"%>
	<!--*******************	
		End Footer Area  
		******************* -->	
	
	<!--*******************	
		Start Go Top Area  
		******************* -->				
		<%@ include file="../front_include_page/startGoTop.jsp"%>
	<!--*******************	
		End Go Top Area  
		******************* -->			

	<!--*******************	
		Start Include JS File  
		******************* -->	
		<%@ include file="../front_include_page/JavaScript_Include.jsp"%>
	<!--*******************	
		End Include JS File  
		******************* -->	
<%@ include file= "/front-end/framework/footer.file" %>
</body>
</html>