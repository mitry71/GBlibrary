package library.member;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

@WebServlet("/member/*")
public class memberController extends HttpServlet {
	MemberDAO memberDAO;
	MemberVO memberVO;
	
	@Override
	public void init() throws ServletException {
		memberDAO=new MemberDAO();
		memberVO=new MemberVO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage=null;
//		String contextPath="http://localhost:8080/library/";
		String ctx=request.getContextPath();
//		System.out.println("경로: " + ctx);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw;
		String action=request.getPathInfo();
		System.out.println("요청매핑이름:" + action);
		if(action.equals("/idCheck.do")) { //ID 중복체크
			PrintWriter out=response.getWriter();
			String id=(String)request.getParameter("id");
			boolean overlappedID=memberDAO.overlappedID(id);
			if(overlappedID==true) {
				out.print("not_usable");
			}else {
				out.print("usable");
			}
		}else if(action.equals("/join.do")) { //회원가입
			String _name=request.getParameter("name");
			String _id=request.getParameter("id");
			String _pwd=request.getParameter("pass");
			String _hp1=request.getParameter("phoneNumber1");
			String _hp2=request.getParameter("phoneNumber2");
			String _hp3=request.getParameter("phoneNumber3");
			String _hp=_hp1 + "-" + _hp2 + "-" + _hp3;
			String _address=request.getParameter("address");
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			String _email=null;
			if(email1 != null && email1.length() != 0 && email2 != null && email2.length() != 0) {
				_email=request.getParameter("email1") + "@" + request.getParameter("email2");					
			}
			String _expire=request.getParameter("time");
			memberVO.setName(_name);
			memberVO.setId(_id);
			memberVO.setPwd(_pwd);
			memberVO.setHp(_hp);
			memberVO.setAddress(_address);
			memberVO.setEmail(_email);
			memberVO.setExpire(_expire);
			memberDAO.addMember(memberVO);
			request.setAttribute("msg", "joined");
			nextPage="/login.jsp";
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}else if(action.equals("/loginForm.do")) { //로그인폼 이동
			HttpSession session=request.getSession(false);
			if(session != null) {
				Boolean isLogin=(Boolean)session.getAttribute("isLogin");
				if(isLogin == true) {
					response.sendRedirect(ctx + "/index.html");
//					response.sendRedirect(contextPath + "index.html");
				}else {
					nextPage="/login.jsp";
					RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
					dispatcher.forward(request, response);
				}
			}else {
				nextPage="/login.jsp";
				RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
			}
		}else if(action.equals("/login.do")) { //로그인
			String _id=request.getParameter("id");
			String _pwd=request.getParameter("pass");
			memberVO.setId(_id);
			memberVO.setPwd(_pwd);
			Boolean result=memberDAO.exists(memberVO);
			if(result) { //회원정보 존재
				HttpSession session=request.getSession();
				session.setAttribute("isLogin", true);
				session.setAttribute("log_id", _id);
				response.sendRedirect(ctx + "/index.html");
			}else { //회원정보 없음
				request.setAttribute("msg", "login_failed");
				nextPage="/login.jsp";
				RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
			}
		}else if(action.equals("/isLoggedIn")) { //index.html에 ajax로 로그인여부 전달
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession(false);
			if(session != null) {
				Boolean isLogin=(Boolean)session.getAttribute("isLogin");
				if(isLogin == true) {
					out.print(true);
				}else {
					out.print(false);
				}
			}
		}else if(action.equals("/modinfoForm.do")) {  //로그인된 상태에서 회원정보수정 클릭 시 호출
			HttpSession session=request.getSession(false);
			String id=(String) session.getAttribute("log_id");
			MemberVO memFindInfo=memberDAO.findMember(id);
			session.setAttribute("memFindInfo", memFindInfo);
			response.sendRedirect(ctx + "/modinfo.jsp");
		}else if(action.equals("/modMember.do")) {  //회원정보수정
			String _name=request.getParameter("name");
			String _id=request.getParameter("_id");
			String _pwd=request.getParameter("pass");
			String _hp1=request.getParameter("phoneNumber1");
			String _hp2=request.getParameter("phoneNumber2");
			String _hp3=request.getParameter("phoneNumber3");
			String _hp=_hp1 + "-" + _hp2 + "-" + _hp3;
			String _address=request.getParameter("address");
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			String _email=request.getParameter("email1") + "@" + request.getParameter("email2");
			String _expire=request.getParameter("time");
			memberVO.setName(_name);
			memberVO.setId(_id);
			memberVO.setPwd(_pwd);
			memberVO.setHp(_hp);
			memberVO.setAddress(_address);
			memberVO.setEmail(_email);
			memberVO.setExpire(_expire);
			memberDAO.modMember(memberVO);
			HttpSession session=request.getSession(false);
			session.removeAttribute("memFindInfo");
			MemberVO newMemInfo=memberDAO.findMember(_id);
			session.setAttribute("memFindInfo", newMemInfo);
			pw=response.getWriter();
			pw.print("<script>"
					+ "alert('회원정보가 수정되었습니다.');"
					+ "location.href='" + request.getContextPath() + "/modinfo.jsp';"
					+ "</script>");
		}else if(action.equals("/logout.do")) {  //로그아웃
			HttpSession session=request.getSession(false);
			session.invalidate();
			pw=response.getWriter();
			pw.print("<script>"
					+ "location.href='" + request.getContextPath() + "/index.html';"
					+ "</script>");
		}
//		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
//		dispatcher.forward(request, response);
	}
	
}
