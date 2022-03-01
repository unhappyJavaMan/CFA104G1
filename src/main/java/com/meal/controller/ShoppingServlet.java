package com.meal.controller;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;import javax.swing.plaf.basic.BasicOptionPaneUI.ButtonActionListener;

import com.meal.model.*;

public class ShoppingServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		// res.setContentType("text/html; charset=UTF-8");
		// PrintWriter out = res.getWriter();

		HttpSession session = req.getSession();
		Vector<Meal> buylist = (Vector<Meal>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");
		if (!action.equals("CHECKOUT")) {

			// �R���ʪ����������y
			if (action.equals("DELETE")) {
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				buylist.removeElementAt(d);
			}
			// �s�W���y���ʪ�����
			else if (action.equals("ADD")) {
				boolean match = false;

				// ���o��ӷs�W�����y
				Meal aMeal = getMeal(req);
				// �s�W�Ĥ@�����y���ʪ�����
				if (buylist == null) {
					buylist = new Vector<Meal>();
					buylist.add(aMeal);
				} else {
					for (int i = 0; i < buylist.size(); i++) {
						Meal Meal = buylist.get(i);

						// ���Y�s�W�����y�M�ʪ��������y�@�ˮ�
						if (Meal.getMeal_name().equals(aMeal.getMeal_name())) {
							Meal.setMeal_quantity(Meal.getMeal_quantity()
									+ aMeal.getMeal_quantity());
							buylist.setElementAt(Meal, i);
							match = true;
						} // end of if name matches
					} // end of for

					// ���Y�s�W�����y�M�ʪ��������y���@�ˮ�
					if (!match)
						buylist.add(aMeal);
				}
			}else if(action.equals("login")) {
				String roomid = req.getParameter("roomid");
				session.setAttribute("roomid", roomid);
			}

			session.setAttribute("shoppingcart", buylist);
			String url = "front-end/roomservice/service.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

		// ���b�A�p���ʪ������y�����`��
		else if (action.equals("CHECKOUT")) {
//			float total = 0;
//			for (int i = 0; i < buylist.size(); i++) {
//				Meal order = buylist.get(i);
//				float price = order.getPrice();
//				int quantity = order.getQuantity();
//				total += (price * quantity);
//			}
			
			double total = buylist.stream()
						          .mapToDouble(b -> b.getMeal_price() * b.getMeal_quantity())
						          .sum();

			String amount = String.valueOf(total);
			req.setAttribute("amount", amount);
			String url = "front-end/roomservice/Checkout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
//			session.invalidate();
		}
		
	}

	private Meal getMeal(HttpServletRequest req) {
		String meal_id = req.getParameter("meal_id");
		String meal_name = req.getParameter("meal_name");
		String meal_description = req.getParameter("meal_description");
		String meal_quantity = req.getParameter("meal_quantity");
		String meal_price = req.getParameter("meal_price");

		Meal bk = new Meal();
		bk.setMeal_id(new Integer(meal_id).intValue());
		bk.setMeal_name(meal_name);
		bk.setMeal_description(meal_description);
		bk.setMeal_price((new Integer(meal_price)).intValue());
		bk.setMeal_quantity((new Integer(meal_quantity)).intValue());
		return bk;
	}
}
