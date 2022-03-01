package com.roomServiceOrderList.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.roomServiceOrderList.model.RoomServiceOrderListService;
import com.roomServiceOrderList.model.RoomServiceOrderListVO;

public class RoomServiceOrderListServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("service_order_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/RoomServiceOrderList/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer service_order_id = null;
				try {
					service_order_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/RoomServiceOrderList/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
				RoomServiceOrderListVO RoomServiceOrderListVO = rsolsSvc.getOneRoomServiceOrderList(service_order_id);
				if (RoomServiceOrderListVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/RoomServiceOrderList/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("RoomServiceOrderListVO", RoomServiceOrderListVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/RoomServiceOrderList/listOneRoomServiceOrderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/RoomServiceOrderList/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display2".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("service_order_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/RoomServiceOrderList/listOneRoomServiceOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer service_order_id = null;
				try {
					service_order_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/roomservice/listOneRoomServiceOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
				RoomServiceOrderListVO RoomServiceOrderListVO = rsolsSvc.getOneRoomServiceOrderList(service_order_id);
				if (RoomServiceOrderListVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/roomservice/listOneRoomServiceOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("RoomServiceOrderListVO", RoomServiceOrderListVO); // 資料庫取出的empVO物件,存入req
				String url = "/front-end/roomservice/listOneRoomServiceOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/roomservice/listOneRoomServiceOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer service_order_id = new Integer(req.getParameter("service_order_id"));
				
				/***************************2.開始查詢資料****************************************/
				RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
				RoomServiceOrderListVO RoomServiceOrderListVO = rsolsSvc.getOneRoomServiceOrderList(service_order_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("RoomServiceOrderListVO", RoomServiceOrderListVO);         // 資料庫取出的empVO物件,存入req
				String url = "/back-end/RoomServiceOrderList/update_RoomServiceOrderList_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/RoomServiceOrderList/listAllRoomServiceOrderList.jsp");
				failureView.forward(req, res);
			}
		}
		
		
if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer service_order_id = new Integer(req.getParameter("service_order_id").trim());

				
				Integer meal_id = null;
				try {
					meal_id = new Integer(req.getParameter("meal_id").trim());
				} catch (NumberFormatException e) {
					meal_id = 0;
					errorMsgs.add("餐點編號請填數字.");
				}

				Integer meal_price = null;
				try {
					meal_price = new Integer(req.getParameter("meal_price").trim());
				} catch (NumberFormatException e) {
					meal_price = 0;
					errorMsgs.add("餐點價格請填數字.");
				}
				
				Integer meal_quantity = null;
				try {
					meal_quantity = new Integer(req.getParameter("meal_quantity").trim());
				} catch (NumberFormatException e) {
					meal_quantity = 0;
					errorMsgs.add("餐點數量請填數字.");
				}

				Integer meal_total = null;
				try {
					meal_total = new Integer(req.getParameter("meal_total").trim());
				} catch (NumberFormatException e) {
					meal_total = 0;
					errorMsgs.add("餐點總計請填數字.");
				}

				RoomServiceOrderListVO RoomServiceOrderListVO = new RoomServiceOrderListVO();
				RoomServiceOrderListVO.setService_order_id(service_order_id);
				RoomServiceOrderListVO.setMeal_id(meal_id);
				RoomServiceOrderListVO.setMeal_price(meal_price);
				RoomServiceOrderListVO.setMeal_quantity(meal_quantity);
				RoomServiceOrderListVO.setMeal_total(meal_total);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("RoomServiceOrderListVO", RoomServiceOrderListVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/RoomServiceOrderList/update_RoomServiceOrderList_input.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始修改資料*****************************************/
				RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
				RoomServiceOrderListVO = rsolsSvc.updateRoomServiceOrderList(service_order_id, meal_id, meal_price, meal_quantity, meal_total);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("RoomServiceOrderListVO", RoomServiceOrderListVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/RoomServiceOrderList/listOneRoomServiceOrderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/RoomServiceOrderList/update_RoomServiceOrderList_input.jsp");
				failureView.forward(req, res);
			}
			
		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
//String mealid = req.getParameter("mealid");
//				String mealidReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (mealid == null || mealid.trim().length() == 0) {
//					errorMsgs.add("餐點編號: 請勿空白");
//				} else if(!mealid.trim().matches(mealidReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("餐點編號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
				
//				Integer service_order_id = null;
//				try {
//					service_order_id = new Integer(req.getParameter("service_order_id").trim());
//				} catch (NumberFormatException e) {
//					service_order_id = 0;
//					errorMsgs.add("服務訂單編號請填數字.");
//				}

				
				Integer meal_id = null;
				try {
					meal_id = new Integer(req.getParameter("meal_id").trim());
				} catch (NumberFormatException e) {
					meal_id = 0;
					errorMsgs.add("餐點編號請填數字.");
				}

				Integer meal_price = null;
				try {
					meal_price = new Integer(req.getParameter("meal_price").trim());
				} catch (NumberFormatException e) {
					meal_price = 0;
					errorMsgs.add("餐點價格請填數字.");
				}
				
				Integer meal_quantity = null;
				try {
					meal_quantity = new Integer(req.getParameter("meal_quantity").trim());
				} catch (NumberFormatException e) {
					meal_quantity = 0;
					errorMsgs.add("餐點數量請填數字.");
				}

				Integer meal_total = null;
				try {
					meal_total = new Integer(req.getParameter("meal_total").trim());
				} catch (NumberFormatException e) {
					meal_total = 0;
					errorMsgs.add("餐點總計請填數字.");
				}

//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate=new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//				
//				Double sal = null;
//				try {
//sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//				
//				Double comm = null;
//				try {
//comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}
				
//Integer deptno = new Integer(req.getParameter("deptno").trim());

				RoomServiceOrderListVO RoomServiceOrderListVO = new RoomServiceOrderListVO();
//				RoomServiceOrderListVO.setService_order_id(service_order_id);
				RoomServiceOrderListVO.setMeal_id(meal_id);
				RoomServiceOrderListVO.setMeal_price(meal_price);
				RoomServiceOrderListVO.setMeal_quantity(meal_quantity);
				RoomServiceOrderListVO.setMeal_total(meal_total);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("RoomServiceOrderListVO", RoomServiceOrderListVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front/service.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始新增資料***************************************/
				RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
				RoomServiceOrderListVO = rsolsSvc.addRoomServiceOrderList(meal_id, meal_price, meal_quantity, meal_total);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/CFA104G1/RoomServiceOrderList/listAllRoomServiceOrderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front/service.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer service_order_id = new Integer(req.getParameter("service_order_id"));
				
				/***************************2.開始刪除資料***************************************/
				RoomServiceOrderListService rsolsSvc = new RoomServiceOrderListService();
				rsolsSvc.deleteRoomServiceOrderList(service_order_id);	
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/RoomServiceOrderList/listAllRoomServiceOrderList.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/RoomServiceOrderList/listAllRoomServiceOrderList.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
