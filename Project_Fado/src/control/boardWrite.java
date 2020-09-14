package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Board;
import model.BoardDAO;

@WebServlet("/board/boardWrite")
public class boardWrite extends HttpServlet {
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
		
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String userID = null;
		
		Board board = new Board();
		BoardDAO db = new BoardDAO();
		
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setType(request.getParameter("type"));
		
		
		if (userID == null) {
			System.out.print("�α��� �ȵǾ�����");
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			response.sendRedirect("../login/login.jsp");
			script.println("</script>");
		} else if(board.getTitle()==""||board.getContent()=="") {
			System.out.print("�Է� �ȵ� ������ ����");
			
		} else {
			int result = db.write(board.getTitle(), userID, board.getContent(), board.getType());
			if (result == -1) {
				System.out.print("���ۼ� ����");
			}else {
				System.out.print("���ۼ� ����");
				response.sendRedirect("board_list.jsp");
			}
			
			
		}
	}
}
