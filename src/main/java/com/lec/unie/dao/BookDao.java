package com.lec.unie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.unie.dto.Book;

public interface BookDao {
	public List<Book> mainList();
	public List<Book> bookList(Book book);
	public int totCntBook(Book book);
	public Book getDetailBook(int bnum);
	public int registerBook(Book book);
	public int modifyBook(Book book);
}
