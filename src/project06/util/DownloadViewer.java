package project06.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadViewer extends AbstractView {
	
	//현재 다운로드할 파일의 위치, 프로젝트에 맞춰 수정이 필요
	@Value("${upload}")
	private String upload;
	
	@Value("${upload2}")
	private String upload2;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 1. controller에서 전달되어온 파일명으로 파일객체 할당
		String fname = (String)model.get("downloadFile");
		//		1) 파일을 객체로 생성 처리하여 전달 준비
		File file = new File(upload+fname);
		File file2 = new File(upload2+fname);
		// 2. 다운로드 처리를 위한 response 객체 설정
		//	1) 파일다운을 처리하기 위한 contentType설정
		response.setContentType("application/download; charset=UTF-8");
		//	2) 파일의 길이와 파일명 설정
		response.setContentLength((int)file.length());
		response.setContentLength((int)file2.length());
		//		-한글파일명을 위한 encoding처리
		fname = URLEncoder.encode(fname,"utf-8").replaceAll("\\+", " ");
		// 3. Header 정보 설정
		response.setHeader("Content-Disposition", 
				"attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 4. 파일을 InputStream으로 전환하여 response의 OutStream에 탑재하여 전송
		FileInputStream fis = new FileInputStream(file);
		//FileInputStream fis2 = new FileInputStream(file2);
		
		OutputStream out = response.getOutputStream();
		//	1) FileCopyUils의 copy 메서드를 동해서 전달
		FileCopyUtils.copy(fis, out);
		//FileCopyUtils.copy(fis2, out);
		//	2) 전송 완료 처리
		out.flush();
//		springweb.z02.util.DownloadViewer
	}
	
	
	

}
/*
# 사용자정의 downloadViewer 처리
1. 상속
	1) overriding 메서드 재정의
	- renderMergedOutputModel
		매개변수
		Map<String, Object> model,
		HttpServletRequest request,
		HttpServletResponse response,
2. 다운로드 처리
	1) upload된 파일 가져오기(서버가 가지고 있는 파일)
		-현재 viewer를 호출시..
	2) 모델과 함께 있는 File객체 가져오기.(서버가 가지고 있는 파일)
	3) 반응 객체(response)로 전달 처리(클라이언트에 파일) 
	- 전체 파일명
	- 파일명
	- 파일의 길이
	- setContentType 설정 : application/download;charset-utf-8
	- setContentLength로 파일의 길이 설정
	- 한글명된 파일은 Encoding처리
	- 파일을 response에 탑재를 위한 header부분 설정
		Content-Disposition으로 attachment로 파일 설정
		Content-Transfer-Encoding 설정 binary 설정
	- 파일을 network으로 전송하기위해 Stream객체로 변환
		InputStream(읽어오는 객체) ==> OupStream(보내는 객체)
		FileInputStream(파일 객체)
		FileCopyUtils.copy(inputstream, outstream)
		outstream의 flush를 통해서 자원을 해제		
*/