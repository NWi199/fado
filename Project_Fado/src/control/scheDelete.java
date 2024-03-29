package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ScheDAO;
import model.Schedule;

@WebServlet("/schedule/scheDelete")
public class scheDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String userID = null;
		int idx = 0;
		
		Schedule sche = new Schedule();
		ScheDAO db = new ScheDAO();
		
		if (session.getAttribute("id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("id");//유저아이디에 해당 세션값을 넣어준다.
		}
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(idx == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='scheList.jsp'");
			script.println("</script>");
		}
		sche = db.getSche(idx);
		if(!userID.equals(sche.getWriter())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='scheList.jsp'");
			script.println("</script>");			
		}else{
				int result = db.delete(idx);
				
				if (result == -1) {
					System.out.print("일정삭제 실패");
				}else {
					System.out.print("일정삭제 성공");
					response.sendRedirect("scheList.jsp");
				}
			}
	}
}
