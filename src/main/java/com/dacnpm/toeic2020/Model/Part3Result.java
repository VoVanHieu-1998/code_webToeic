package com.dacnpm.toeic2020.Model;

import java.util.Date;
import java.util.List;
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
@Table(name="part3_listening_result")
public class Part3Result {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_result",nullable=false)
	private Results result_Part3Result;
	
	@ManyToOne()
	@JoinColumn(name="id_part3_listening",nullable=false)
	private Part3 part3_PartResult;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@OneToMany(mappedBy = "part3Result_part3ResultQuestion", fetch = FetchType.LAZY)
    Set<Part3ResultQuestion> part3ResultQuestions;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public Results getResult_Part3Result() {
		return result_Part3Result;
	}

	public void setResult_Part3Result(Results result_Part3Result) {
		this.result_Part3Result = result_Part3Result;
	}

	public Part3 getPart3_PartResult() {
		return part3_PartResult;
	}

	public void setPart3_PartResult(Part3 part3_PartResult) {
		this.part3_PartResult = part3_PartResult;
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

	public Set<Part3ResultQuestion> getPart3ResultQuestions() {
		return part3ResultQuestions;
	}

	public void setPart3ResultQuestions(Set<Part3ResultQuestion> part3ResultQuestions) {
		this.part3ResultQuestions = part3ResultQuestions;
	}


	
	
}
