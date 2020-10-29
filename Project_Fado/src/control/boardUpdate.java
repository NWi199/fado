package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Board;
import model.BoardDAO;

@WebServlet("/board/boardUpdate")
public class boardUpdate extends HttpServlet {
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
		
		Board board = new Board();
		BoardDAO db = new BoardDAO();
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setType(request.getParameter("type"));
		board.setCom_open(Integer.parseInt(request.getParameter("open")));
		
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(idx == 0) {
			script.println("<script>");
			script.println("alert('��ȿ���� ���� �� �Դϴ�')");
			script.println("location.href='board_list.jsp'");
			script.println("</script>");
		}
		board = new BoardDAO().getBD(idx);
		if(!userID.equals(board.getUserID())) {
			script.println("<script>");
			script.println("alert('������ �����ϴ�')");
			script.println("location.href='board_list.jsp'");
			script.println("</script>");			

		}else{
			if (board.getTitle() == "" || board.getContent() == "") {
				script.println("<script>");
				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				int result = db.update(idx, request.getParameter("title"), request.getParameter("content"), request.getParameter("type"), board.getCom_open());
				if (result == -1) {
					script.println("<script>");
					script.println("alert('�� ������ �����߽��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("alert('�� ������ �����߽��ϴ�')");
					response.sendRedirect("view.jsp?idx=" + idx);
					script.println("</script>");
				}

			}
		}
	}
		
}
