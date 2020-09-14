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
		
		if (session.getAttribute("id") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("id");//유저아이디에 해당 세션값을 넣어준다.
		}
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setType(request.getParameter("type"));
		
		
		if (userID == null) {
			System.out.print("로그인 안되어있음");
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			response.sendRedirect("../login/login.jsp");
			script.println("</script>");
		} else if(board.getTitle()==""||board.getContent()=="") {
			System.out.print("입력 안된 사항이 있음");
			
		} else {
			int result = db.write(board.getTitle(), userID, board.getContent(), board.getType());
			if (result == -1) {
				System.out.print("글작성 실패");
			}else {
				System.out.print("글작성 성공");
				response.sendRedirect("board_list.jsp");
			}
			
			
		}
	}
}
