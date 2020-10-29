package control;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.User;

@WebServlet("/login/joinGo")
public class joinGo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO db = new UserDAO();

	public joinGo() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			script.println("<script>");
			script.println("alert('�̹� �α��� �Ǿ��ֽ��ϴ�')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
		
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setSido(request.getParameter("sido1"));
		user.setGun(request.getParameter("gugun1"));
		user.setExp(request.getParameter("exp"));
		
		int result = db.join(user);
		if (result == -1) {
			System.out.println("�ߺ��Ǵ� ���̵�");
			response.sendRedirect("join.jsp");
		} else if(user.getId().equals("")||user.getPw().equals("")||user.getName().equals("")) {
			System.out.print("�Է� �ȵ� ������ ����");
			response.sendRedirect("join.jsp");
		}else {
			System.out.println("insert success");
			response.sendRedirect("joinResult.jsp?id="+user.getId());

		}
	}
}
