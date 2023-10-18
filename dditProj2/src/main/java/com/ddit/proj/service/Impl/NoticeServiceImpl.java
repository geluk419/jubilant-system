package com.ddit.proj.service.Impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ddit.proj.mapper.NoticeMapper;
import com.ddit.proj.service.NoticeService;
import com.ddit.proj.vo.AttachVO;
import com.ddit.proj.vo.CodeVO;
import com.ddit.proj.vo.NoticeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private String uploadPath;
	
	public List<CodeVO> noticeSelect(String groupId) {
		return noticeMapper.noticeSelect(groupId);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		log.info("넘어온 값 확인 : " + noticeVO);

		int result = noticeMapper.insertNotice(noticeVO);
		//1) notice테이블에 insert -> noticeVO의 fileId 멤버변수에 값이 세팅됨
		
		String attResult="";
		if(noticeVO.getFileId() != null) {
			attResult = insOrUpdateAttach(noticeVO,5);
		}
		 if(attResult.equals("OK")) return result;
		 return 0;
	}

	@Override
	public int insertAttach(AttachVO attachVO) {
		return noticeMapper.insertAttach(attachVO);
	}

	@Override
	public List<NoticeVO> listNotice(Map<String, Object> map) {
		return noticeMapper.listNotice(map);
	}

	@Override
	public NoticeVO getNotice(NoticeVO noticeVO) {
		return noticeMapper.getNotice(noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		 log.debug("체킁:{}", noticeVO);
		 log.debug("파일아이디롱: " + noticeVO.getFileId() + "pppp");
		 // 경우의 수 4가지 
	
		 boolean isFileIdNull = false;  // fileId
		 boolean isExistFile = false;   // 파일선택 여부
		 if(noticeVO.getFileId() == null || noticeVO.getFileId().equals("")) {
			 log.debug("fileId없음");
			 isFileIdNull = true;
		 }

		 //log.debug("최종확인:{}", noticeVO.getNoticeFiles().length);
		 if(noticeVO.getNoticeFiles() != null &&  noticeVO.getNoticeFiles().length != 0) {
			 log.debug("첨부파일있음");
			 isExistFile = true;
		 }
		 
		 int kjCase = 1;
		 int result = 0;
		 String attResult ="";
		 if( isFileIdNull && !isExistFile) {
			 log.debug("설마 요기망1");
			 // 그냥 notice만 update
			 kjCase = 1;
			 result = noticeMapper.updateNotice(noticeVO);
		 }else if(isFileIdNull && isExistFile) {
			 log.debug("설마 요기망2");
			 // noticeVO에 fileId 발생하고, notice update
			 // 부여한 fileId가지고 attach insert
			 kjCase = 2;
			 attResult = insOrUpdateAttach(noticeVO,kjCase);
			 
		 }else if(!isFileIdNull && !isExistFile) {
			 log.debug("설마 요기망3");
			 //notice update 하고 attach delete
			 kjCase = 3;
			 attResult = insOrUpdateAttach(noticeVO,kjCase);
		 }else {
			 log.debug("설마 요기망4");
			 // notice update, attach도 update
			 kjCase = 4;
			 attResult = insOrUpdateAttach(noticeVO,kjCase);
		 }
		 
		 if(attResult.equals("OK")) return result;
		 return 0;
	}
	
	public int updateAttach(AttachVO attachVO) {
		return noticeMapper.updateAttach(attachVO);
	}
	
	public int deleteAttach(AttachVO attachVO) {
		return noticeMapper.deleteAttach(attachVO);
	}

	
	
	// Attach 테이블 insert 또는 Update
	public String insOrUpdateAttach(NoticeVO noticeVO, int kjCase) {
		log.info("넘어온 값 확인2 : " + noticeVO + " " + kjCase);
		String fileId = noticeVO.getFileId();
		 log.debug("설마 요기망  llll" + kjCase);

		MultipartFile[] files = noticeVO.getNoticeFiles();
		
		AttachVO attachVO = new AttachVO();
		UUID uuid = UUID.randomUUID();
		
		log.info("files : " + files);
				
		//첨부파일이 있을 때만 실행
		if(files != null) {
			for(MultipartFile file : files) {
				String originName = file.getOriginalFilename(); //업로드 네임
				
				//첨부파일이 없으면 stop
				if(originName.length()<1) {
					break;
				}
				
				String uploadFileName = uuid.toString() + "_" + originName; //저장네임, 현재 안 사용
				long size = file.getSize(); //사이즈
				String ContentType = file.getContentType(); //확장자
				String savePath = uploadPath + "\\" + originName; //저장경로
				
				log.info("savePath:" + savePath);
				log.info("size:" + size);
				attachVO.setFileOriNm(originName);
				attachVO.setFileNm(uploadFileName);
				attachVO.setFileSize(size);
				attachVO.setFileExtsn(ContentType);
				attachVO.setFilePath("/files/" + originName);
				attachVO.setFileId(noticeVO.getFileId());
				log.info("attachVO : " + attachVO);
				
				if (!file.isEmpty()) {
					try {
						file.transferTo(new File(savePath));
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		// 일부러 가독성을 위해서 기럭지 길고 길겡.. 나중에 리팩토링 할껏
		if(kjCase == 2) {
			 log.debug("요기왜 안함!"+kjCase +"임");
			 // noticeVO에 fileId 발생하고, notice update
			 // 부여한 fileId가지고 attach insert
			 noticeVO.setFileId(noticeMapper.genFileId(noticeVO));
			 noticeVO.setFileDelYn("N");
			 noticeMapper.updateNotice(noticeVO);
			 attachVO.setFileId(noticeVO.getFileId());
			 noticeMapper.insertAttach(attachVO);
		}
		
		if(kjCase == 3) {
			 log.debug("요기왜 안함!"+kjCase +"임");
			 //notice update 하고 attach delete
			 attachVO.setFileId(noticeVO.getFileId());							 
			 noticeMapper.deleteAttach(attachVO);
			 noticeVO.setFileId(null);
			 noticeVO.setFileDelYn("Y");
			 noticeMapper.updateNotice(noticeVO);
		}
		
		if(kjCase == 4) {
			 log.debug("요기왜 안함!"+kjCase +"임");
			 // notice update, attach도 update
			 
			 noticeMapper.updateNotice(noticeVO);
			 attachVO.setFileId(noticeVO.getFileId());							 
			 noticeMapper.updateAttach(attachVO);							
		}
		
		if(kjCase == 5) {
			 log.debug("요기왜 안함!"+kjCase +"임");
			 //attach만 insert
			 attachVO.setFileId(noticeVO.getFileId());							 
			 noticeMapper.insertAttach(attachVO);							
		}
		
		return "OK";
	}

	@Override
	public String genFileId(NoticeVO noticeVO) {
		return noticeMapper.genFileId(noticeVO);
	}

	@Override
	public int deleteNotice1(String fileId) {
		return noticeMapper.deleteNotice1(fileId);
	}

	@Override
	public int deleteNotice12(String fileId) {
		return noticeMapper.deleteNotice12(fileId);
	}

	@Override
	public int deleteNotice2(String ntcCode) {
		return noticeMapper.deleteNotice2(ntcCode);
	}

	@Override
	public int hitNotice(String ntcCode) {
		return noticeMapper.hitNotice(ntcCode);
	}

	@Override
	public int getNoticeTotal(Map<String, Object> map) {
		return noticeMapper.getNoticeTotal(map);
	}

	@Override
	@Transactional
	public int kjFileUp(String fileId) {
		int rs =  noticeMapper.deleteNotice1(fileId);
		rs += noticeMapper.deleteNotice12(fileId);
		return rs;
	}

	@Override
	public List<NoticeVO> search(Map<String, Object> map) {
		return noticeMapper.search(map);
	}

	@Override
	public List<NoticeVO> getMainNotice() {
		return noticeMapper.getMainNotice();
	}


}
