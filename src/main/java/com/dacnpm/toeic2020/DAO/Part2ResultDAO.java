package com.dacnpm.toeic2020.DAO;

public interface Part2ResultDAO<E> extends BaseDAO<E>{

	public int countCorrectAnswerPart2(int idResult);
}
