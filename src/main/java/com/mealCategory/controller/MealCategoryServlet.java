package com.mealCategory.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meal.model.MealService;
import com.meal.model.MealVO;
import com.mealCategory.model.MealCategoryService;
import com.mealCategory.model.MealCategoryVO;

public class MealCategoryServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("meal_category_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/MealCategory/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer meal_category_id = null;
				try {
					meal_category_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/MealCategory/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				MealCategoryService mealcategorySvc = new MealCategoryService();
				MealCategoryVO mealCategoryVO = mealcategorySvc.getOneMealCategory(meal_category_id);
				if (mealCategoryVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/MealCategory/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("mealCategoryVO", mealCategoryVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/MealCategory/listOneMealCategory.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/MealCategory/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer meal_category_id = new Integer(req.getParameter("meal_category_id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				MealCategoryService mealcategorySvc = new MealCategoryService();
				MealCategoryVO mealCategoryVO = mealcategorySvc.getOneMealCategory(meal_category_id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("mealCategoryVO", mealCategoryVO);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/MealCategory/update_MealCategory_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/MealCategory/listAllMealCategory.jsp");
				failureView.forward(req, res);
			}
		}
		
		
if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer meal_category_id = null;
				try {
					meal_category_id = new Integer(req.getParameter("meal_category_id").trim());
				} catch (NumberFormatException e) {
					meal_category_id = 0;
					errorMsgs.add("���O�s���A�ж�Ʀr");
				}
				
				
				String meal_category_name = req.getParameter("meal_category_name");
				String meal_category_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (meal_category_name == null || meal_category_name.trim().length() == 0) {
					errorMsgs.add("���O�W��: �ФŪť�");
				} else if(!meal_category_name.trim().matches(meal_category_name)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���O�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				

				MealCategoryVO mealCategoryVO = new MealCategoryVO();
				mealCategoryVO.setMeal_category_id(meal_category_id);
				mealCategoryVO.setMeal_category_name(meal_category_name);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mealCategoryVO", mealCategoryVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/MealCategory/update_MealCategory_input.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.�}�l�ק���*****************************************/
				MealCategoryService mealcategorySvc = new MealCategoryService();
				mealCategoryVO = mealcategorySvc.updateMealCategory(meal_category_id, meal_category_name);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("mealCategoryVO", mealCategoryVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/back-end/MealCategory/listOneMealCategory.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/MealCategory/update_MealCategory_input.jsp");
				failureView.forward(req, res);
			}
			
		}

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
//String mealid = req.getParameter("mealid");
//				String mealidReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (mealid == null || mealid.trim().length() == 0) {
//					errorMsgs.add("�\�I�s��: �ФŪť�");
//				} else if(!mealid.trim().matches(mealidReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
//					errorMsgs.add("�\�I�s��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
//	            }
				
				
				Integer meal_category_id = null;
				try {
					meal_category_id = new Integer(req.getParameter("meal_category_id").trim());
				} catch (NumberFormatException e) {
					meal_category_id = 0;
					errorMsgs.add("���O�s���A�ж�Ʀr");
				}
				
				
				String meal_category_name = req.getParameter("meal_category_name");
				String meal_category_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (meal_category_name == null || meal_category_name.trim().length() == 0) {
					errorMsgs.add("���O�W��: �ФŪť�");
				} else if(!meal_category_name.trim().matches(meal_category_name)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���O�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }
				
				
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate=new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}
//				
//				Double sal = null;
//				try {
//sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("�~���ж�Ʀr.");
//				}
//				
//				Double comm = null;
//				try {
//comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("�����ж�Ʀr.");
//				}
				
//Integer deptno = new Integer(req.getParameter("deptno").trim());

				MealCategoryVO mealCategoryVO = new MealCategoryVO();
				mealCategoryVO.setMeal_category_id(meal_category_id);
				mealCategoryVO.setMeal_category_name(meal_category_name);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mealCategoryVO", mealCategoryVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/MealCategory/addMealCategory.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.�}�l�s�W���***************************************/
				MealCategoryService mealcategorySvc = new MealCategoryService();
				mealCategoryVO = mealcategorySvc.addMealCategory(meal_category_id,meal_category_name );
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/MealCategory/listAllMealCategory.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/MealCategory/addMealCategory.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer meal_category_id = new Integer(req.getParameter("meal_category_id"));
				
				/***************************2.�}�l�R�����***************************************/
				MealCategoryService mealcategorySvc = new MealCategoryService();
				mealcategorySvc.deleteMealCategory(meal_category_id);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/MealCategory/listAllMealCategory.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/MealCategory/listAllMealCategory.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
