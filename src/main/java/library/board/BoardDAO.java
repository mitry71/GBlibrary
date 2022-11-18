package library.board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public BoardDAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context)ctx.lookup("java:/comp/env");
			dataFactory=(DataSource)envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB 연결 오류");
		}
	}
	
	//글목록 조회
	public List<ArticleVO> selectAllArticles() {
		List<ArticleVO> articleList=new ArrayList<ArticleVO>();
		try {
			conn=dataFactory.getConnection();
			String query="select articleNo, title, content, imageFileName, writeDate"
					+ " from boardtbl order by articleNo desc";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int articleNo=rs.getInt("articleNo");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String imageFileName=rs.getString("imageFileName");
				Date writeDate=rs.getDate("writeDate");
				ArticleVO article=new ArticleVO(articleNo, title, content, imageFileName);
				article.setWriteDate(writeDate);
				articleList.add(article);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글목록 조회 중 에러");
		}
		return articleList;
	}

	//새 글 작성 메서드
	public void insertNewArticle(ArticleVO articleVO) {
		try {
			conn=dataFactory.getConnection();
			int articleNo=getNewArticleNo();
			String title=articleVO.getTitle();
			String content=articleVO.getContent();
			String imageFileName=articleVO.getImageFileName();
			String query="insert into boardtbl(articleNo, title, content, imageFileName) values(?,?,?,?)";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, imageFileName);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("새 글 작성 중 에러" + e.getMessage());
		}
	}

	private int getNewArticleNo() {
		try {
			String query="select max(articleNo) from boardtbl";
			pstmt=conn.prepareStatement(query);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println("글번호 생성 중 에러");
		}
		return 0;
	}

	public ArticleVO selectArticle(int articleNo) {
		ArticleVO article=new ArticleVO();
		try {
			conn=dataFactory.getConnection();
			String query="select articleNo, title, content, imageFileName, writeDate from boardtbl where articleNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			int _articleNo=rs.getInt("articleNo");
			String title=rs.getString("title");
			String content=rs.getString("content");
			String imageFileName=rs.getString("imageFileName");
			Date writeDate=rs.getDate("writeDate");
			article.setArticleNo(_articleNo);
			article.setTitle(title);
			article.setContent(content);
			article.setImageFileName(imageFileName);
			article.setWriteDate(writeDate);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("선택된 글 상세 구현 중 에러" + e.getMessage());
		}
		return article;
	}

	public void updateArticle(ArticleVO articleVO) {
		int articleNo=articleVO.getArticleNo();
		String title=articleVO.getTitle();
		String content=articleVO.getContent();
		String imageFileName=articleVO.getImageFileName();
		try {
			conn=dataFactory.getConnection();
			String query="update boardtbl set title=?, content=?";
			if(imageFileName != null && imageFileName.length() != 0) {
				query+=", imageFileName=?";
			}
			query+=" where articleNo=?";
			System.out.println(query);
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			if(imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);
				pstmt.setInt(4, articleNo);
			}else {
				pstmt.setInt(3, articleNo);
			}
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("DB 수정 중 에러" + e.getMessage());
		}
	}

	public void deleteArticle(int articleNo) {
		try {
			conn=dataFactory.getConnection();
			String query="delete from boardtbl where articleNo=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 삭제 처리 중 에러" + e.getMessage());
		}
	}
}
