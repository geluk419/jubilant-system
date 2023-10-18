package com.ddit.proj.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class MemberVO {
	private int rnum;
	private String memNo; //사용자번호
	private String memType; //사용자구분	
	private String memPass; //비밀번호
	private String memDelYn; //삭제여부
	private String memNm; //한글명
	private String memNme; //영어명
	private String memTel; //전화번호
	private String memTel2; //비상연락처
	private int    memZip; //우편번호
	private String memAddr1; //기본주소
	private String memAddr2; //상세주소
	private String memPic; //증명사진_경로
	private String memDepo; //예금주
	private String memBankCode; //공통코드_은행코드
	private String memAccount;	//계좌번호
	private String memMl; //이메일
	private String memBir; //생년월일
	private String memColCode; //공통코드_단과대
	private String memDepCode; //공통코드_학과
	private String memEmpDv; //공통코드_부서
	private String memEmpSe; //공통코드_재직구분
	private String codeNm; //공통코드_은행명
	
	private String depNm;
	
	//private String codeId; //공통코드_코드아이디
	
	private MultipartFile uploadFile;
	
	//1 : N
	private List<AuthVO> authVOList;
	//1 : 1
	private List<ProfessorVO> professorVO;
	
	private List<DepartmentVO> departmentVO;
	
}
