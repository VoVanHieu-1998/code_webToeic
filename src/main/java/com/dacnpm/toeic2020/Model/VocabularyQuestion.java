package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "vocabulary_question")
public class VocabularyQuestion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idvocabularycontent")
	Vocabularycontent vocabularycontent;
	String mean_content;
	int activeFlag;
	Date createDate;
	Date updateDate;
	public int getId() {
		return id;
	}
	public void setIdvocabularytrue(int id) {
		this.id = id;
	}
	public Vocabularycontent getVocabularycontent() {
		return vocabularycontent;
	}
	public void setVocabularycontent(Vocabularycontent vocabularycontent) {
		this.vocabularycontent = vocabularycontent;
	}
	public String getMean_content() {
		return mean_content;
	}
	public void setMean_content(String mean_content) {
		this.mean_content = mean_content;
	}
	public int getActiveFlag() {
		return activeFlag;
	}
	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
