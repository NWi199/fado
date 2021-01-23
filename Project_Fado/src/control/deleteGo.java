package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;

@WebServlet("/profile/deleteGo")
public class deleteGo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String userID = null;
		UserDAO db = new UserDAO();
	
		if (session.getAttribute("id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("id");//유저아이디에 해당 세션값을 넣어준다.
		}
		
		int result = db.delete(userID);
		if (result == -1) {
			script.println("<script>");
			script.println("alert('오류')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('진짜 탈퇴하시겠습니까?')");
			script.println("</script>");
			response.sendRedirect("../index.jsp");
		}
	}
}
