package library.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public MemberDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//회원가입 시 ID 중복체크
	public boolean overlappedID(String id) {
		boolean result=false;
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*),1,'true','false') as result from membertbl2 where id=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("DB 처리 중 에러 발생");
		}
		return result;
	}
	
	//회원등록
	public void addMember(MemberVO memberVO) {
		try {
			conn=dataFactory.getConnection();
			String id=memberVO.getId();
			String pwd=memberVO.getPwd();
			String name=memberVO.getName();
			String hp=memberVO.getHp();
			String address=memberVO.getAddress();
			String email=memberVO.getEmail();
			String expire=memberVO.getExpire();
			String query="insert into membertbl2(name,id,pwd,hp,address,email,expire) values(?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pwd);
			pstmt.setString(4, hp);
			pstmt.setString(5, address);
			pstmt.setString(6, email);
			pstmt.setString(7, expire);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("등록 중 오류 발생");
		}
	}
	
	//로그인 시 회원정보 확인
	public boolean exists(MemberVO memberVO) {
		boolean result=false;
		String id=memberVO.getId();
		String pwd=memberVO.getPwd();
		try {
			conn=dataFactory.getConnection();
			String query="select decode(count(*), 1, 'true', 'false') as result from membertbl2 where id=? and pwd=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			result=Boolean.parseBoolean(rs.getString("result"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("로그인 회원정보 확인 중 오류 발생");
		}
		return result;
	}
	
	//수정할 회원정보 찾기
	public MemberVO findMember(String _id) {
		MemberVO memFindInfo=null;
		try {
			conn=dataFactory.getConnection();
			String query="select * from membertbl2 where id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, _id);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			String name=rs.getString("name");
			String id=rs.getString("id");
			String pwd=rs.getString("pwd");
			String hp=rs.getString("hp");
			String address=rs.getString("address");
			String email=rs.getString("email");
			String expire=rs.getString("expire");
			memFindInfo=new MemberVO(name, id, pwd, hp, address, email, expire);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("수정할 자료 찾는 중 에러");
		}
		return memFindInfo;
	}
	
	//회원정보 수정
	public void modMember(MemberVO memberVO) {
		String name=memberVO.getName();
		String id=memberVO.getId();
		String pwd=memberVO.getPwd();
		String address=memberVO.getAddress();
		String hp=memberVO.getHp();
		String email=memberVO.getEmail();
		String expire=memberVO.getExpire();
		if(email.equals("@")) email=null;
		try {
			conn=dataFactory.getConnection();
			String query="update membertbl2 set name=?, pwd=?, hp=?, address=?, email=?, expire=? where id=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, pwd);
			pstmt.setString(3, hp);
			pstmt.setString(4, address);
			pstmt.setString(5, email);
			pstmt.setString(6, expire);
			pstmt.setString(7, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("회원정보 수정 중 에러");
		}
	}
}
