package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@WebServlet("/board/commentDelete")
public class commentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String userID = null;
		int idx = 0;
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		BoardDAO db = new BoardDAO();
		Comment com = db.com_get(idx);
		if(idx == 0) {
			System.out.print("��ȿ���� ���� ���");
			response.sendRedirect("view.jsp?idx=" + com.getBoard_id());
		}
		if(!userID.equals(com.getUser_id())) {
			System.out.print("���� ����");
			response.sendRedirect("view.jsp?idx=" + com.getBoard_id());	

		}else{
			int result = db.com_delete(idx);
			if (result == -1) {
				System.out.print("���� ����");
				response.sendRedirect("view.jsp?idx=" + com.getBoard_id());
			} else {
				System.out.print("���� ����");
				response.sendRedirect("view.jsp?idx=" + com.getBoard_id());
			}
		}
		
		
	}

}
