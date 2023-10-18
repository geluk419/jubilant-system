package com.ddit.proj.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuildingVO {
	
	private String bldNm;
	private String colCode;
	private String bldCode;
	
	private List<RoomVO> roomVO;
	
}
