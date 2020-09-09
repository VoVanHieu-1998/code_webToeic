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
@Table(name="part6_reading_question_result")
public class Part6ResultQuestion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_part6_reading_result",nullable=true)
	private Part6Result part6Result_part6ResultQuestion;
	
	@ManyToOne()
	@JoinColumn(name="id_part6_reading_question",nullable=true)
	private Part6Question part6Question_part6ResultQuestion;
	
	private int result;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	public Part6ResultQuestion() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Part6Result getPart6Result_part6ResultQuestion() {
		return part6Result_part6ResultQuestion;
	}
	public void setPart6Result_part6ResultQuestion(Part6Result part6Result_part6ResultQuestion) {
		this.part6Result_part6ResultQuestion = part6Result_part6ResultQuestion;
	}
	
	public Part6Question getPart6Question_part6ResultQuestion() {
		return part6Question_part6ResultQuestion;
	}
	public void setPart6Question_part6ResultQuestion(Part6Question part6Question_part6ResultQuestion) {
		this.part6Question_part6ResultQuestion = part6Question_part6ResultQuestion;
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
