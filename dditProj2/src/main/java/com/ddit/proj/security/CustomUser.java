package com.ddit.proj.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.ddit.proj.vo.MemberVO;


public class CustomUser extends User{

	//멤버변수 선언
	private MemberVO memberVO;
	
	//User의 생성자를 처리해주는 생성자
	public CustomUser(String username, String password
			, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
//	return memberVO==null?null:new CustomUser(memberVO);
	//List<MemberAuthVO> -> Collection<? extends GrantedAuthority> 필요함
	public CustomUser(MemberVO memberVO) {
		//사용자가 정의한(select한) memberVO객체를 
		//스프링 시큐리티에서 제공해주고 있는 UserDetails 타입으로 변환
		//회원 정보를 보내줄 테니 이제부터 프링이 너가 인증/인가 처리 및 관리를 해줘
		super(memberVO.getMemNo()+"", memberVO.getMemPass(),
			memberVO.getAuthVOList().stream()
			.map(auth->new SimpleGrantedAuthority(auth.getAuthor()))
			.collect(Collectors.toList())
				);
		
		this.memberVO = memberVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	
}
