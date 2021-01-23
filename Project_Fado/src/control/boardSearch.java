package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Board;
import model.BoardDAO;

@WebServlet("/board/boardSearch")
public class boardSearch extends HttpServlet {
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
		
		BoardDAO db = new BoardDAO();
		
		ArrayList<Board> search = db.search(request.getParameter("col"), request.getParameter("word"));
		System.out.print("글작성 성공");
		response.sendRedirect("search_result.jsp");
		
	}
	

}
