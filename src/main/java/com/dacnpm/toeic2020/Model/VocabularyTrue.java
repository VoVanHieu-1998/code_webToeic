package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "vocabulary_true")
public class VocabularyTrue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idvocabularytrue;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idvocabularycontent")
	Vocabularycontent vocabularycontent;
	String mean_content;
	String op1;
	String op2;
	String op3;
	String op4;
	int activeFlag;
	Date createDate;
	Date updateDate;
	public int getIdvocabularytrue() {
		return idvocabularytrue;
	}
	public void setIdvocabularytrue(int idvocabularytrue) {
		this.idvocabularytrue = idvocabularytrue;
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
	public String getOp1() {
		return op1;
	}
	public void setOp1(String op1) {
		this.op1 = op1;
	}
	public String getOp2() {
		return op2;
	}
	public void setOp2(String op2) {
		this.op2 = op2;
	}
	public String getOp3() {
		return op3;
	}
	public void setOp3(String op3) {
		this.op3 = op3;
	}
	public String getOp4() {
		return op4;
	}
	public void setOp4(String op4) {
		this.op4 = op4;
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
