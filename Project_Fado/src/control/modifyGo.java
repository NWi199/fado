package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserDAO;

@WebServlet("/profile/modifyGo")
public class modifyGo extends HttpServlet {
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
		
		String userID = null;
		PrintWriter script = response.getWriter();
		HttpSession session = request.getSession();
		
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		UserDAO db = new UserDAO();
		
		String pw = request.getParameter("pw");
		String id = userID;
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String sido = request.getParameter("sido1");
		String gugun = request.getParameter("gugun");
		String exp = request.getParameter("exp");
		
		
		int result = db.update(id, pw, name, email, sido, gugun, exp);
		
		if(!pw.equals("") && !pw.equals(id)) {
			if (result == -1) {
				System.out.println("����");
			}else {
				
				script.println("<script>");
				script.println("alert('�α����� �ٽ� ���ּ���')");
				script.println("location.href='../logoutGo'");
				script.println("</script>");
			}
		}else {
			script.println("<script>");
			script.println("alert('�߸��� �Է��Դϴ�')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	}

}
