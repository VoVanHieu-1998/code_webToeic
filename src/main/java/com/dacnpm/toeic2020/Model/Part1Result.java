package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="part1_listening_result")
public class Part1Result {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_result",nullable=false)
	private Results result_Part1Result;
	
	@ManyToOne()
	@JoinColumn(name="id_part1_question",nullable=false)
	private Part1Question part1Question_Result;
	
	private int result_ques;
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public Results getResult_Part1Result() {
		return result_Part1Result;
	}
	public void setResult_Part1Result(Results result_Part1Result) {
		this.result_Part1Result = result_Part1Result;
	}
	
	
	public Part1Question getPart1Question_Result() {
		return part1Question_Result;
	}
	public void setPart1Question_Result(Part1Question part1Question_Result) {
		this.part1Question_Result = part1Question_Result;
	}
	public int getResult_ques() {
		return result_ques;
	}
	public void setResult_ques(int result_ques) {
		this.result_ques = result_ques;
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
