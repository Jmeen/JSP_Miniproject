
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

// 인코팅 설정때문에 web.xml 사용
//@WebServlet(name = "contact", urlPatterns = "/con")
public class ContactServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");

		if ("insert".equals(actionName)) {
			// a = form이면 회원가입으로 이동
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/addform.jsp");
			rd.forward(req, resp);

		} else {
			// 신규 가입 아니면, 리스트 불러오기. 인덱스의 reset도 동일하게 리스트 불러오기.
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.getlist();
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 등록
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
		// 삭제
		else if("delete".equals(actionName)) {
			Long id	= Long.valueOf(req.getParameter("id"));
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			boolean deletebl = dao.delete(id);
			System.out.println(deletebl);
			resp.sendRedirect(req.getContextPath() + "/con");
			
		}
		// 검색 
		else if ("search".equals(actionName)) {
			String search = req.getParameter("search");
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.search(search);
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);
		}
		else if ("reset".equals(actionName)) {
			String search = req.getParameter("search");
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.search(search);
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(req, resp);
		}
	}

}
