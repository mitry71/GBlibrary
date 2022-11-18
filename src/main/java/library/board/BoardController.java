package library.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static String ART_IMAGE_REPO="/Users/chasaebyeol/Document/noitce_image";
	BoardService boardService;
	ArticleVO articleVO;
	
	public void init(ServletConfig config) throws ServletException {
		boardService=new BoardService();
		articleVO=new ArticleVO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw;
		String action=request.getPathInfo();
		System.out.println("요청 이름 : " + action);
		try {
			List<ArticleVO> articleList=new ArrayList<ArticleVO>();
			if(action == null || action.equals("/listArticles.do")) {  //글 목록보기
				articleList=boardService.listArticles();
				request.setAttribute("articleList", articleList);
				nextPage="/boardinfo/notice.jsp";
			}else if(action.equals("/articleForm.do")) {  //새 글쓰기 폼
				HttpSession session=request.getSession();
				String id=(String) session.getAttribute("log_id");
				if(id.equals("haejune")) {
					nextPage="/boardinfo/articleForm.jsp";					
				}else {
					nextPage="/listArticles.do";
				}
			}else if(action.equals("/viewArticle.do")) {  //글 상세보기
				String articleNo=request.getParameter("articleNo");
				ArticleVO article=boardService.viewArticle(Integer.parseInt(articleNo));
				request.setAttribute("article", article);
				nextPage="/boardinfo/viewArticle.jsp";
			}else if(action.equals("/addArticle.do")) {  //새 글 작성
				Map<String, String> articleMap=upload(request, response);
				String title=articleMap.get("title");
				String content=articleMap.get("content");
				String imageFileName=articleMap.get("imageFileName");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				boardService.addArticle(articleVO);
				nextPage="/board/listArticles.do";
			}else if(action.equals("/modArticle.do")) {
				Map<String, String> articleMap=upload(request, response);
				int articleNo=Integer.parseInt(articleMap.get("articleNo"));
				System.out.println(articleNo);
				articleVO.setArticleNo(articleNo);
				String title=articleMap.get("title");
				String content=articleMap.get("content");
				String imageFileName=articleMap.get("imageFileName");
				System.out.println(imageFileName);
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				boardService.modArticle(articleVO);
				if(imageFileName != null && imageFileName.length() != 0) {
					String originalFileName=articleMap.get("originalFileName");
					File oldFile=new File(ART_IMAGE_REPO + "/" + originalFileName);
					oldFile.delete();
					File file=new File(ART_IMAGE_REPO + "/" + imageFileName);
				}
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('글을 수정했습니다.');"
						+ "location.href='" + request.getContextPath() + "/board/viewArticle.do?articleNo=" + articleNo + "';"
						+ "</script>");
				return;
			}else if(action.equals("/removeArticle.do")) {
				int articleNo=Integer.parseInt(request.getParameter("articleNo"));
				boardService.removeArticle(articleNo);
				pw=response.getWriter();
				pw.print("<script>"
						+ "alert('글을 삭제했습니다.');"
						+ "location.href='" + request.getContextPath() + "/board/listArticles.do" + "';"
						+ "</script>");
				return;
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("요청 처리 중 에러" + e.getMessage());
		}
	} //doHandle 메서드 끝
	
	//이미지 파일 업로드
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> articleMap=new HashMap<String, String>();
		String encoding="utf-8";
		File currentDirPath=new File("/Users/chasaebyeol/Document/noitce_image");
		DiskFileItemFactory factory=new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload=new ServletFileUpload(factory);
		try {
			List items=upload.parseRequest(request);
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem=(FileItem)items.get(i);
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				}else {
					System.out.println("파라미터이름 : " + fileItem.getFieldName());
					System.out.println("파일이름 : " + fileItem.getName());
					System.out.println("파일크기 : " + fileItem.getSize());
					if(fileItem.getSize() > 0) {
						int idx=fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx=fileItem.getName().lastIndexOf("/");							
						}
						String fileName=fileItem.getName().substring(idx+1);
						articleMap.put(fileItem.getFieldName(), fileName);
						File uploadFile=new File(currentDirPath + "/" + fileName);
						fileItem.write(uploadFile);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("파일 업로드 중 에러");
		}
		return articleMap;
	}
}
