package com.dacnpm.toeic2020.DAO;

public interface Part1ResutDAO<E> extends BaseDAO<E> {
	public int countCorrectAnswerPart1(int idResult);
}
