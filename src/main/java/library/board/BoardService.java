package library.board;

import java.util.List;

public class BoardService {
	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO=new BoardDAO();
	}
	
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articleList=boardDAO.selectAllArticles();
		return articleList;
	}

	public void addArticle(ArticleVO articleVO) {
		boardDAO.insertNewArticle(articleVO);
	}

	public ArticleVO viewArticle(int articleNo) {
		ArticleVO article=null;
		article=boardDAO.selectArticle(articleNo);
		return article;
	}

	public void modArticle(ArticleVO articleVO) {
		boardDAO.updateArticle(articleVO);
	}
	
	public void removeArticle(int articleNo) {
		boardDAO.deleteArticle(articleNo);
	}
}
