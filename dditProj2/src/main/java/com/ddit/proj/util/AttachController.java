package com.ddit.proj.util;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddit.proj.service.AttachService;
import com.ddit.proj.vo.AttachVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/attach")
@Controller
public class AttachController {
	
	@Autowired
	AttachService attachService;
	
	@Autowired
	String uploadPath;
	
	//ATTACH 테이블에서 fileId를 받으면 List<fileVO>를 리턴
	@ResponseBody
	@PostMapping("/getAttachVOList")
	public List<AttachVO> getAttachVOList(@RequestBody AttachVO attachVO) {
		log.info("attachVO : " + attachVO);
		
		List<AttachVO> attachVOList = this.attachService.getAttachVOList(attachVO);
		
		log.info("attachVOList : " + attachVOList);
		
		return attachVOList;
		
	}
	
   //파일 다운로드
   @ResponseBody
   @GetMapping("/download")
   public ResponseEntity<Resource> download(@RequestParam String fileName){
      log.info("fileName : " + fileName);
      
      Resource resource = new FileSystemResource(
    		uploadPath + "\\" +fileName
            );
      String resourceName = resource.getFilename();
     
      HttpHeaders headers = new HttpHeaders();
      try {
         headers.add("Content-Disposition", "attachment;filename="+
               new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
      } catch (UnsupportedEncodingException e) {
         log.info(e.getMessage());
      }
      
      return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
   }
   
   
	
}
