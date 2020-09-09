package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="part2_listening_result")
public class Part2Result {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_result",nullable=false)
	private Results result_Part2Result;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part2_question",nullable=false)
	private Part2Question part2Question_Result;
	
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
	public Results getResult_Part2Result() {
		return result_Part2Result;
	}
	public void setResult_Part2Result(Results result_Part2Result) {
		this.result_Part2Result = result_Part2Result;
	}
	public Part2Question getPart2Question_Result() {
		return part2Question_Result;
	}
	public void setPart2Question_Result(Part2Question part2Question_Result) {
		this.part2Question_Result = part2Question_Result;
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
