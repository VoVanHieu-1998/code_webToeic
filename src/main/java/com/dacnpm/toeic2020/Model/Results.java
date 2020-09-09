package com.dacnpm.toeic2020.Model;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name="results")
public class Results {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_exam",nullable=false)
	private Examination examination_result;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_user",nullable=false)
	private User user_result;
	
	private int score;
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@OneToMany(mappedBy="result_Part1Result",fetch= FetchType.EAGER,cascade=CascadeType.ALL)
    Set<Part1Result>  result_part1Result;	
	
	@OneToMany(mappedBy="result_Part2Result",fetch= FetchType.EAGER)
    List<Part2Result>  result_part2Result;	
	
	@OneToMany(mappedBy="result_Part3Result",fetch= FetchType.EAGER)
    Set<Part3Result>  result_part3Result;	
	
	@OneToMany(mappedBy="result_Part4Result",fetch= FetchType.EAGER)
    Set<Part4Result>  result_part4Result;	
	
	@OneToMany(mappedBy="result_Part5Result",fetch= FetchType.EAGER)
    Set<Part5QuestionResult> part5QuestionResults;
	
	@OneToMany(mappedBy="result_Part6Result",fetch= FetchType.EAGER)
    Set<Part6Result> result_part6Result;
	
	@OneToMany(mappedBy="result_Part7Result",fetch= FetchType.LAZY)
    Set<Part7Result> result_part7Results;
	
	

	
	
	
	public Set<Part6Result> getResult_part6Result() {
		return result_part6Result;
	}
	public void setResult_part6Result(Set<Part6Result> result_part6Result) {
		this.result_part6Result = result_part6Result;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	
	
	public Set<Part7Result> getResult_part7Results() {
		return result_part7Results;
	}
	public void setResult_part7Results(Set<Part7Result> result_part7Results) {
		this.result_part7Results = result_part7Results;
	}
	public Set<Part5QuestionResult> getPart5QuestionResults() {
		return part5QuestionResults;
	}
	public void setPart5QuestionResults(Set<Part5QuestionResult> part5QuestionResults) {
		this.part5QuestionResults = part5QuestionResults;
	}
	public Set<Part4Result> getResult_part4Result() {
		return result_part4Result;
	}
	public void setResult_part4Result(Set<Part4Result> result_part4Result) {
		this.result_part4Result = result_part4Result;
	}
	public Set<Part3Result> getResult_part3Result() {
		return result_part3Result;
	}
	public void setResult_part3Result(Set<Part3Result> result_part3Result) {
		this.result_part3Result = result_part3Result;
	}
	public Set<Part1Result> getResult_part1Result() {
		return result_part1Result;
	}
	public void setResult_part1Result(Set<Part1Result> result_part1Result) {
		this.result_part1Result = result_part1Result;
	}
	
	
	public List<Part2Result> getResult_part2Result() {
		return result_part2Result;
	}
	public void setResult_part2Result(List<Part2Result> result_part2Result) {
		this.result_part2Result = result_part2Result;
	}
	public Examination getExamination_result() {
		return examination_result;
	}
	public void setExamination_result(Examination examination_result) {
		this.examination_result = examination_result;
	}
	public User getUser_result() {
		return user_result;
	}
	public void setUser_result(User user_result) {
		this.user_result = user_result;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
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
