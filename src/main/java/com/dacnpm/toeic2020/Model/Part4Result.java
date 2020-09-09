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
@Table(name="part4_listening_result")
public class Part4Result {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_result",nullable=false)
	private Results result_Part4Result;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part4_listening",nullable=false)
	private Part4 part4_PartResult;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@OneToMany(mappedBy = "part4Result_part4ResultQuestion", fetch = FetchType.LAZY)
    Set<Part4ResultQuestion> part4ResultQuestions;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Results getResult_Part4Result() {
		return result_Part4Result;
	}

	public void setResult_Part4Result(Results result_Part4Result) {
		this.result_Part4Result = result_Part4Result;
	}

	public Part4 getPart4_PartResult() {
		return part4_PartResult;
	}

	public void setPart4_PartResult(Part4 part4_PartResult) {
		this.part4_PartResult = part4_PartResult;
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

	public Set<Part4ResultQuestion> getPart4ResultQuestions() {
		return part4ResultQuestions;
	}

	public void setPart4ResultQuestions(Set<Part4ResultQuestion> part4ResultQuestions) {
		this.part4ResultQuestions = part4ResultQuestions;
	}
	
	

	
}
