package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserDAO;

@WebServlet("/profile/modifyGo")
public class modifyGo extends HttpServlet {
	UserDAO db = new UserDAO();
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		int result = db.update((String) session.getAttribute("id"), request.getParameter("pw"), request.getParameter("name"), request.getParameter("email"));
		if (result == -1) {
			System.out.println("수정실패");
			response.sendRedirect("../index.jsp");
		} else {
			System.out.println("update success");
			session.invalidate();
			response.sendRedirect("../login/login.jsp");
		}
	}
}
