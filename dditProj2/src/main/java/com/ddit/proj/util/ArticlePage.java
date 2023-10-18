package com.ddit.proj.util;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ArticlePage<T> {
	//전체  수
	private int total;
	//현재 페이지 번호
	private int currentPage;
	//전체 페이지 수
	private int totalPages;
	//시작 페이지 번호
	private int startPage;
	//종료 페이지 번호
	private int endPage;
	private int size;
	//데이터
	private List<T> content;
	
	public ArticlePage(int total, int currentPage, int size, List<T> content) {
		//size : 한 화면에 보여줄 목록의 행의 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.size = size;
	
		//전체 글 수가 0이면?
		if(total==0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		} else { //글이 있다면?
			//전체 글 수(total) / 한 화면에 보여질 목록의 행의 수(size) = 전체 페이지 수
			//=>0이 아니면 (137행). 나머지가 있다면, 페이지를 1증가
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++; //전체 17페이지수
			}
			
			//시작페이지를 구하는 공식!
			//시작 페이지 = 현재 페이지 / 페이지 크기 * 페이지 크기 + 1
			//     6      = 7 / 5 * 5 + 1
			startPage = currentPage / 5 * 5 + 1;
			
			//현재페이지 % 페이지크기 => 0일때 보정
			if(currentPage % 5 ==0) {
				//페이지 크기를 빼줌
				startPage -= 5;
			}
			
			//종료 페이지 번호 = 시작 페이지 번호 + (페이지 크기 -1)
			endPage = startPage + (5-1);
			
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}
			
	//데이터가 없니? 전체 글의 수는 0 => true리턴
	public boolean hasNoArticles() {
		return total == 0;
	}
	
	//데이터가 있니? true를 리턴
	public boolean hasArticles() {
		return total > 0;
	}
	
	
}
