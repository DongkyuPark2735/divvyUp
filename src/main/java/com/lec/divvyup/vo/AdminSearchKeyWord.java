package com.lec.divvyup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminSearchKeyWord {
	private String searchWord;
	private String searchResultOrderBy;
	private String searchSelectItems;
	private String mid;
	private int startRow;
	private int endRow;
	public AdminSearchKeyWord(String searchWord, String searchResultOrderBy, String searchSelectItems) {
		this.searchWord = searchWord;
		this.searchResultOrderBy = searchResultOrderBy;
		this.searchSelectItems = searchSelectItems;
	}
	public AdminSearchKeyWord(String mid, int startRow, int endRow) {
		super();
		this.mid = mid;
		this.startRow = startRow;
		this.endRow = endRow;
	}
}