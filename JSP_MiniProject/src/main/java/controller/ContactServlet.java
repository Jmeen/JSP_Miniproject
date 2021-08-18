
package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhoneBookDAO;
import dao.PhoneBookDAOImpl;
import vo.PhoneBookVO;


@WebServlet(name = "contact", urlPatterns = "/con")
public class ContactServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");

		if ("insert".equals(actionName)) {
			// a = form이면
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/addform.jsp");
			// 전달
			rd.forward(req, resp);

		} else {
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.getlist();
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String actionName = req.getParameter("a");
		if ("add".equals(actionName)) {
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String tel = req.getParameter("tel");

			PhoneBookVO vo = new PhoneBookVO();

			System.out.printf("%s-%s-%s", name, hp, tel);

			vo.setName(name);
			vo.setHp(hp);
			vo.setTel(tel);

			PhoneBookDAO dao = new PhoneBookDAOImpl();
			boolean insertbl = dao.insert(vo);
			System.out.print(insertbl);

			resp.sendRedirect(req.getContextPath() + "/con");
		}
		
		else if("delete".equals(actionName)) {
			Long id;
			id = Long.valueOf(req.getParameter("id"));
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			boolean deletebl = dao.delete(id);
			System.out.println(deletebl);
			resp.sendRedirect(req.getContextPath() + "/con");
			
		}

	}

}
