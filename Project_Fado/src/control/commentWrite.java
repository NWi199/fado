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
import model.Comment;

@WebServlet("/board/commentWrite")
public class commentWrite extends HttpServlet {
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
		
		Comment com = new Comment();
		BoardDAO db = new BoardDAO();	
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		com.setComment(request.getParameter("comment"));
		com.setBoard_id(Integer.parseInt(request.getParameter("boardIDX")));
		com.setUser_id(request.getParameter("userID"));
		com.setUser_name(request.getParameter("userName"));
		Board board = db.getBD(com.getBoard_id());
		if (userID == null) {
			System.out.print("�α��� �ȵǾ�����");
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			response.sendRedirect("../login/login.jsp");
			script.println("</script>");
		} else if(com.getComment()=="") {
			System.out.print("�Է� �ȵ� ������ ����");
			
		} else {
			int result = db.com_write(com.getComment(), com.getBoard_id(), com.getUser_id(), com.getUser_name());
			if (result == -1) {
				System.out.print("����ۼ� ����");
			}else {
				System.out.print("����ۼ� ����");
				db.com_count(com.getBoard_id(), board.getComment());
				response.sendRedirect("view.jsp?idx="+com.getBoard_id());
			}
		}
	}

}
