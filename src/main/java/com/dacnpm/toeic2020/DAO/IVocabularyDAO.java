package com.dacnpm.toeic2020.DAO;

import java.util.List;

import com.dacnpm.toeic2020.Model.Vocabularyline;

public interface IVocabularyDAO<E> extends BaseDAO<E>{
	public List<Vocabularyline> layDanhSachTuVungLimit(int tuvungbatdau);
	public Vocabularyline layDanhSachTuVungTheoMa(int idvocabulary);

}
