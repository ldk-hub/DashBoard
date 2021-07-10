package com.com.gentelella.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.com.gentelella.service.DashBoardService;




@Controller
public class FileUploadController {
	
	@Autowired
	DashBoardService dashBoardService;
	
	  @RequestMapping(value = "/requestUpload")
	    public String requestUpload(MultipartHttpServletRequest mtfRequest) throws Exception {
		  
		  SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddhhmmss");
		  Map<String, Object> upload_map = new HashMap<String, Object>();
		  long time =   System.currentTimeMillis();
			String str = dayTime.format(new Date(time));
	        MultipartFile mf = mtfRequest.getFile("file_upload_field");
	        
	        //로컬 경로
	        String path = "C:\\image\\";
	        //리눅스 서버의 경우 path가 다름  
	        //String path = "/upload/";
	        
	        //파일관련 정보저장
	        String gs_guid = mtfRequest.getParameter("gs_guid"); //파일마다 유니크값부여 동일명칭으로업로드되도 문제없음
	        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	        long fileSize = mf.getSize();                     // 파일 사이즈
	        String safeFile = path+ gs_guid +"_" + originFileName;  // 변형된 파일명
	        
	         System.out.println("gs_guid : " + gs_guid);
        	 System.out.println("originFileName : " + originFileName);
	         System.out.println("fileSize : " + fileSize);
	         System.out.println("파일명 : " + safeFile);
	        
	         upload_map.put("gs_guid", gs_guid);
	         upload_map.put("file_name", originFileName);
	         upload_map.put("file_size", fileSize);
	         upload_map.put("file_url", safeFile);
	         
	         //정보전송
	         dashBoardService.insertFileInfo(upload_map);
	        try {
	            mf.transferTo(new File(safeFile));
	        } catch (IllegalStateException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}
