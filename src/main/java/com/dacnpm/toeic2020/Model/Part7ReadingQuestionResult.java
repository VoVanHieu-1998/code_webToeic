package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="part7_reading_question_result")
public class Part7ReadingQuestionResult {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_part7_reading_result",nullable=false)
	private Part7Result part7Result_part7ResultQuestion;
	
	@ManyToOne()
	@JoinColumn(name="id_part7_reading_question",nullable=false)
	private Part7ReadingQuestion part7Question_part7ResultQuestion;
	
	private int result;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Part7Result getPart7Result_part7ResultQuestion() {
		return part7Result_part7ResultQuestion;
	}
	public void setPart7Result_part7ResultQuestion(Part7Result part7Result_part7ResultQuestion) {
		this.part7Result_part7ResultQuestion = part7Result_part7ResultQuestion;
	}
	public Part7ReadingQuestion getPart7Question_part7ResultQuestion() {
		return part7Question_part7ResultQuestion;
	}
	public void setPart7Question_part7ResultQuestion(Part7ReadingQuestion part7Question_part7ResultQuestion) {
		this.part7Question_part7ResultQuestion = part7Question_part7ResultQuestion;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
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
