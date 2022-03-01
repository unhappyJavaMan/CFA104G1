package filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.emplyee.model.EmplyeeVO;

public class EmpLoginRole2Filter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {
		
		System.out.println("12345");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此emp的角色權限是否擁有】
		EmplyeeVO staff = (EmplyeeVO)session.getAttribute("staff");
		System.out.println(staff.getRoles_id());
		if ( staff.getRoles_id() != 1 && staff.getRoles_id() != 2) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/back-end/admin/dashboard.jsp?xxx=true");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}
}