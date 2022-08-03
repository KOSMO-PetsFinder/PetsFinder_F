package petsfinder.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
 
	// 파일 업로드 처리
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		
		try {
			/*
				MultipartRequest(request 내장객체, 디렉토리의 물리적 경로, 업로드 제한 용량, 인코딩 방식);
				위와 같은 형태로 객체를 생성함과 동시에 파일은 업로드가 완료된다.
				업로드에 성공하면 객체의 참조값을 반환한다.
				만약 실패했다면 디렉토리 경로나 파일용량을 확인해본다.
			 */
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 파일 다운로드 처리
	/*
		download(
		HttpServletRequest req, : request 내장객체
		HttpServletResponse resp, : response 내장객체
		String directory, : 파일이 저장된 서버의 물리적 경로( 절대 경로 )
		String sfileName, : 서버에 저장된 파일명
	    String ofileName : 원본 파일명
	    )
	 */
	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName, String ofileName) {
		
		// 디렉토리의 물리적 경로 얻어오기
		String sDirectory = req.getServletContext().getRealPath(directory);
		
		try {
			
			// 서버에 저장된 파일을 찾아 File 객체 생성
			File file = new File(sDirectory, sfileName);
			
			// 입력 스트림 생성
			InputStream iStream = new FileInputStream(file);
			
			// request 헤더를 통해 해당 웹 브라우저의 종류를 얻어온다.
			String client = req.getHeader("User-Agent");
			if(client.indexOf("WOW64") == -1) {
				//인터넷 익스플로러가 아닌경우 한글파일명 인코딩( 깨짐 방지 )
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				//인터넷 익스플로러일 때 한글파일명 인코딩
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}
			
			// 다운로드를 위한 response 헤더 설정
			resp.reset();
			resp.setContentType("application/octet-stream");
			// 여기에서 파일 다운로드 시 파일명 변경
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + sfileName + "\"");
			resp.setHeader("Content-Length", "" + file.length() );
			
			//out.clear();
			// response 내장객체를 통해 새로운 출력 스트림 생성
			OutputStream oStream = resp.getOutputStream();
			
			// 출력 스트림을 통해 파일 내용을 출력한다. [ read => write ]
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while ( (readBuffer = iStream.read(b)) > 0 ) {
				oStream.write(b, 0, readBuffer);
			}
			
			//입출력 스트림을 닫아준다.( 자원해제 )
			iStream.close();
			oStream.close();
			
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}
	}
	
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		if (file.exists()) {
			file.delete();
		}
	}
}
