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
@Table(name="part4_listening_question_result")
public class Part4ResultQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_part4_listening_result",nullable=false)
	private Part4Result part4Result_part4ResultQuestion;
	
	@ManyToOne()
	@JoinColumn(name="id_part4_listening_question",nullable=false)
	private Part4Question part4Question_part4ResultQuestion;
	
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
	public Part4Result getPart4Result_part4ResultQuestion() {
		return part4Result_part4ResultQuestion;
	}
	public void setPart4Result_part4ResultQuestion(Part4Result part4Result_part4ResultQuestion) {
		this.part4Result_part4ResultQuestion = part4Result_part4ResultQuestion;
	}
	public Part4Question getPart4Question_part4ResultQuestion() {
		return part4Question_part4ResultQuestion;
	}
	public void setPart4Question_part4ResultQuestion(Part4Question part4Question_part4ResultQuestion) {
		this.part4Question_part4ResultQuestion = part4Question_part4ResultQuestion;
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
