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
import java.io.PrintWriter;

@WebServlet("/login/loginGo")
public class loginGo extends HttpServlet {
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
		
		User user = new User();
		
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		
		int result = db.login(user.getId(), user.getPw());
		if (result == 1) {
			if(session != null) 
				session.setAttribute("id", user.getId());
			System.out.println("login success");
            response.sendRedirect("../index.jsp");
		} else if(result==0) {
			System.out.println("비밀번호 미일치");
		} else if(result==-1) {
			System.out.println("아이디 존재 안함");
		} else if(result==-2) {
			System.out.println("디비 오류");
		}
	}
}
