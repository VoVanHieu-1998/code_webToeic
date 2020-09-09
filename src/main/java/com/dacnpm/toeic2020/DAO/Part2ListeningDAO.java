package com.dacnpm.toeic2020.DAO;

import java.util.List;
import java.util.Map;

import com.dacnpm.toeic2020.Model.Pagging;

public interface Part2ListeningDAO<E> extends BaseDAO<E> {
	public List<E> getListPart2(String queryStr,Map<String, Object> queryParams,Pagging pagging);
}
