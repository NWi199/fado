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
import model.UserDAO;
import model.User;

@WebServlet("/schedule/scheWrite")
public class scheWrite extends HttpServlet {
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
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String userID = null;
		
		Schedule sche = new Schedule();
		ScheDAO db = new ScheDAO();
		UserDAO userdb = new UserDAO();
		
		if (session.getAttribute("id") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("id");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		
		User user = userdb.info(userID);
		
		if (userID == null) {
			System.out.print("�α��� �ȵǾ�����");
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			response.sendRedirect("../login/login.jsp");
			script.println("</script>");
		}
		System.out.println("�������2");
		
		if(user.getPart().equals("busker")) {
			sche.setTitle(request.getParameter("title"));
			sche.setWriter(userID);
			if(!request.getParameter("busker").equals("")) {
				sche.setBusker(request.getParameter("busker"));
			}
			else {
				sche.setBusker(user.getName());
			}
			sche.setDate(request.getParameter("date"));
			sche.setStart(request.getParameter("start"));
			sche.setEnd(request.getParameter("end"));
			sche.setPlace(request.getParameter("place"));
			sche.setDetail(request.getParameter("detail"));
			sche.setExp(request.getParameter("exp"));
			sche.setOpen(Integer.parseInt(request.getParameter("open")));
			System.out.println(sche.getTitle() +","+sche.getWriter()+","+sche.getBusker()+","+sche.getDate()+","+sche.getStart()+","+sche.getEnd()+","+sche.getPlace()+","+sche.getDetail()+","+sche.getExp()+","+ sche.getOpen());
			
			
			if(sche.getTitle().equals("")||sche.getDate().equals("")||sche.getStart().equals("")||sche.getEnd().equals("")||sche.getPlace().equals("")) {
				System.out.print("�Է� �ȵ� ������ ����");
				script.println("<script>");
				script.println("alert('�Է� �ȵ� ������ �ֽ��ϴ�');");
				script.println("location.href='scheInsert.jsp'");
				script.println("</script>");
			} else {
				int result = db.write(sche.getTitle(), sche.getWriter(), sche.getBusker(), sche.getDate(), sche.getStart(), sche.getEnd(), sche.getPlace(), sche.getDetail(), sche.getExp(), sche.getOpen());
				if (result == -1) {
					System.out.print("�����ۼ� ����");
				}else {
					System.out.print("�����ۼ� ����");
					response.sendRedirect("scheList.jsp");
				}
			}
		}else {
			script.println("<script> alert('������ �����ϴ�') </script>");
			response.sendRedirect("schedule.jsp");
		}
		
	}		
}
