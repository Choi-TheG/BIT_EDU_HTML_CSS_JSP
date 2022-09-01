package gntp.model2.lesson1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gntp.model2.lesson1.dao.MemberDAO;
import gntp.model2.lesson1.vo.MemberVO;

public class MyServlet extends HttpServlet {
	// init ctrl space
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
//		super.init();
		System.out.println("init");
	}
	
	// doget ctrl space
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		super.doGet(req, resp);
		System.out.println("doGet");
		// WEB으로 보내기 위한 기본적인 작업 : 밑에 두 줄
		resp.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = resp.getWriter();
//		out.print("<h1>Hola Servlet!</h1>");
//		out.print("Hola!");
		String url = "./member/list.jsp";
		String command = req.getParameter("command");
		MemberDAO dao = new MemberDAO();
		req.setCharacterEncoding("UTF-8");
		
		if(command.equals("list")) {
			////////// 전체 조회///////////////////////
			//MemberDAO dao = new MemberDAO();
			ArrayList<MemberVO> list = null;
			try {
				list = dao.selectAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.setAttribute("list", list);
			//resp.sendRedirect("./member/list.jsp");
		} else if(command.equals("read")) {
			//////////개별 회원정보 조회/////////////////
			String id = req.getParameter("id");
	
			//MemberDAO dao = new MemberDAO();
			MemberVO member = null;
			try {
				member = dao.selectOne(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.setAttribute("member", member);
			// 가야하는 경로 ./member/viewMemberInfo.jsp
			url = "./member/viewMemberInfo.jsp";
			////////개별 회원정보 수정/////////////////
		} else if(command.equals("update")) {
		// 업데이트 준비
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			MemberVO member = new MemberVO(id,pwd,name,email,null);
			
			// 업데이트 로직

				try {
					boolean flag = dao.updateMember(member);
					// 전체 조회
					ArrayList<MemberVO> list = null ;
					if(flag){
						list = dao.selectAll();	
					}
					req.setAttribute("list", list);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// 전체 조회
				url = "./MyServlet?command=list";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	// dopost ctrl space
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		super.doPost(req, resp);
		System.out.println("doPost");
		doGet(req, resp);
	}
	
	// destroy ctrl space
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
//		super.destroy();
		System.out.println("destroy");
	}
}
