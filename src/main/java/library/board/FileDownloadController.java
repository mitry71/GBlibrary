package library.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class FileDownloadController extends HttpServlet {
	private static String ART_IMAGE_REPO="/Users/chasaebyeol/Document/noitce_image";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String articleNo=request.getParameter("articleNo");
		String imageFileName=request.getParameter("imageFileName");
		System.out.println(imageFileName);
		OutputStream out=response.getOutputStream();
		String path=ART_IMAGE_REPO + "/" + imageFileName;
		File imageFile=new File(path);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName=" + imageFileName);
		FileInputStream fis=new FileInputStream(imageFile);
		byte[] buffer=new byte[1024*8];
		while(true) {
			int count=fis.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		fis.close();
		out.close();
	}
}
