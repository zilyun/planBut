package kr.co.planbut.mateBbs;

import java.util.ArrayList;
import java.util.HashMap;

public interface MateBbsMapper {
	/*
		매퍼(mateBbs.xml)에 등록되어 있는 id를 인터페이스의 메소드에 다시 한번 등록함으로써 
		MyBatis3 에서 호출하기 편리하도록 지원
	*/
	
	// <insert id="create">
	public int create(MateBbsDTO dto);
	
	// <select id="list">
	public ArrayList<MateBbsDTO> list();
	
	/*
	// <delete id="delete">
	public int delete(MateBbsDTO dto);
	
	// <select id="read" parameterType="MateBbsDTO" resultType="MateBbsDTO">
	public MateBbsDTO read(MateBbsDTO dto);
	
	// <update id="update">
	public int update(MateBbsDTO dto);

	// <select id="search">
	public ArrayList<MateBbsDTO> search(HashMap searchMap);*/
	
} // interface end