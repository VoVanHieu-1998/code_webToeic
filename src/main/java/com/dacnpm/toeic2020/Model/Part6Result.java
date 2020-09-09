package com.dacnpm.toeic2020.Model;

import java.util.Date;
import java.util.Set;

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
@Table(name="part6_reading_result")
public class Part6Result {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne()
	@JoinColumn(name="id_result",nullable=false)
	private Results result_Part6Result;
	
	@ManyToOne()
	@JoinColumn(name="id_part6_listening",nullable=false)
	private Part6 part6_PartResult;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@OneToMany(mappedBy = "part6Result_part6ResultQuestion", fetch = FetchType.LAZY)
    Set<Part6ResultQuestion> part6ResultQuestions;

	public Part6Result(Integer id, Results result_Part6Result, Part6 part6_PartResult, int activeFlag, Date createDate,
			Date updateDate, Set<Part6ResultQuestion> part6ResultQuestions) {
		super();
		this.id = id;
		this.result_Part6Result = result_Part6Result;
		this.part6_PartResult = part6_PartResult;
		this.activeFlag = activeFlag;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.part6ResultQuestions = part6ResultQuestions;
	}

	public Part6Result() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Results getResult_Part6Result() {
		return result_Part6Result;
	}

	public void setResult_Part6Result(Results result_Part6Result) {
		this.result_Part6Result = result_Part6Result;
	}

	public Part6 getPart6_PartResult() {
		return part6_PartResult;
	}

	public void setPart6_PartResult(Part6 part6_PartResult) {
		this.part6_PartResult = part6_PartResult;
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

	public Set<Part6ResultQuestion> getPart6ResultQuestions() {
		return part6ResultQuestions;
	}

	public void setPart6ResultQuestions(Set<Part6ResultQuestion> part6ResultQuestions) {
		this.part6ResultQuestions = part6ResultQuestions;
	}
	
	
}
