package com.ddit.proj.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.ddit.proj.vo.MemberVO;

@ExtendWith(SpringExtension.class)  // Junit5
@ContextConfiguration("classpath:config/spring/root-context.xml")
public class MemberMapperTest {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Test
	@DisplayName("경진짱")
	@Disabled
	public void selTest() {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemNo("202208S002");
		assertEquals("202208S002", memberMapper.getMember(memberVO).getMemNo());
	}
	
	@Test
	@DisplayName("경진짱")
	public void updatePassword() {
		
		String encPass = passwordEncoder.encode("123");
		assertEquals(32, memberMapper.pwUpdateAll(encPass));
	}

	
}
