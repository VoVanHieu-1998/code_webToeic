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
@Table(name="part7_reading_result")
public class Part7Result {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_result",nullable=false)
	private Results result_Part7Result;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part7_reading",nullable=false)
	private Part7 part7_PartResult;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	
	@OneToMany(mappedBy = "part7Result_part7ResultQuestion", fetch = FetchType.LAZY)
    Set<Part7ReadingQuestionResult> part7ReadingQuestionResults;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Results getResult_Part7Result() {
		return result_Part7Result;
	}


	public void setResult_Part7Result(Results result_Part7Result) {
		this.result_Part7Result = result_Part7Result;
	}


	public Part7 getPart7_PartResult() {
		return part7_PartResult;
	}


	public void setPart7_PartResult(Part7 part7_PartResult) {
		this.part7_PartResult = part7_PartResult;
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


	public Set<Part7ReadingQuestionResult> getPart7ReadingQuestionResults() {
		return part7ReadingQuestionResults;
	}


	public void setPart7ReadingQuestionResults(Set<Part7ReadingQuestionResult> part7ReadingQuestionResults) {
		this.part7ReadingQuestionResults = part7ReadingQuestionResults;
	}
	
	
}
