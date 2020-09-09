package com.dacnpm.toeic2020.Model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="part3_listening_question_result")
public class Part3ResultQuestion {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_part3_listening_result",nullable=true)
	private Part3Result part3Result_part3ResultQuestion;
	
	@ManyToOne()
	@JoinColumn(name="id_part3_listening_question",nullable=true)
	private Part3Question part3Question_part3ResultQuestion;
	
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
	
	
	public Part3Result getPart3Result_part3ResultQuestion() {
		return part3Result_part3ResultQuestion;
	}
	public void setPart3Result_part3ResultQuestion(Part3Result part3Result_part3ResultQuestion) {
		this.part3Result_part3ResultQuestion = part3Result_part3ResultQuestion;
	}
	public Part3Question getPart3Question_part3ResultQuestion() {
		return part3Question_part3ResultQuestion;
	}
	public void setPart3Question_part3ResultQuestion(Part3Question part3Question_part3ResultQuestion) {
		this.part3Question_part3ResultQuestion = part3Question_part3ResultQuestion;
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
