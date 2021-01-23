package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Schedule;
import model.ScheDAO;

@WebServlet("/schedule/scheModify")
public class scheModify extends HttpServlet {
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
			sche.setTitle(request.getParameter("title"));
			sche.setWriter(userID);
			if(request.getParameter("bukser")!="") {
				sche.setBusker(request.getParameter("busker"));
			}
			else {
				sche.setBusker(userID);
			}
			sche.setDate(request.getParameter("date"));
			sche.setStart(request.getParameter("start"));
			sche.setEnd(request.getParameter("end"));
			sche.setPlace(request.getParameter("place"));
			sche.setDetail(request.getParameter("detail"));
			sche.setExp(request.getParameter("exp"));
			sche.setOpen(Integer.parseInt(request.getParameter("open")));
			
			if(sche.getTitle()==""||sche.getDate()==""||sche.getStart()==""||sche.getEnd()==""||sche.getPlace()=="") {
				System.out.print("입력 안된 사항이 있음");
				script.println("<script>");
				script.println("alert('입력 안된 사항이 있습니다');");
				script.println("location.href='history.back()';");
				script.println("</script>");
			} else {
				int result = db.update(idx, sche.getTitle(), sche.getBusker(), sche.getDate(), sche.getStart(), sche.getEnd(), sche.getPlace(), sche.getDetail(), sche.getExp(), sche.getOpen());
				
				if (result == -1) {
					System.out.print("일정수정 실패");
				}else {
					System.out.print("일정수정 성공");
					response.sendRedirect("scheView.jsp?idx=" + idx);
				}
			}
		}
	}
}
