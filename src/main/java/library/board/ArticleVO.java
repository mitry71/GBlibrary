package library.board;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

public class ArticleVO {
	private int articleNo;
	private String title;
	private String content;
	private String imageFileName;
	private Date writeDate;
	
	public ArticleVO() {
		
	}
	public ArticleVO(int articleNo, String title, String content, String imageFileName) {
		this.articleNo=articleNo;
		this.title=title;
		this.content=content;
		this.writeDate=writeDate;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageFileName() {
		try {
			if(imageFileName != null && imageFileName.length() != 0) {
				imageFileName=URLDecoder.decode(imageFileName, "utf-8");
			}
		} catch (Exception e) {
			System.out.println("이미지 로딩 중 에러");
		}
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName != null && imageFileName.length() != 0) {				
				this.imageFileName = URLEncoder.encode(imageFileName,"utf-8");		
			}
		} catch (Exception e) {
			System.out.println("이미지 저장 중 에러");
		}
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
}
