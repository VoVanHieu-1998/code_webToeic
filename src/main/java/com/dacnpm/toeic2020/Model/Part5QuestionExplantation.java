package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="part5_reading_ques_explantation")
public class Part5QuestionExplantation {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;


	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part5_reading_questions",nullable=false)
	private Part5Question part5Question_explantation;
		
	@Column(name="mean_content")
	private String meanContent;
	
	private String mean_op1;
	private String mean_op2;
	private String mean_op3;
	private String mean_op4;
	private String explantation;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	
	public Part5QuestionExplantation() {
		super();
	}
	public Part5QuestionExplantation(Integer id, String meanContent, String mean_op1, String mean_op2, String mean_op3,
			String mean_op4, String explantation) {
		super();
		this.id = id;
		this.meanContent = meanContent;
		this.mean_op1 = mean_op1;
		this.mean_op2 = mean_op2;
		this.mean_op3 = mean_op3;
		this.mean_op4 = mean_op4;
		this.explantation = explantation;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Part5Question getPart5Question_explantation() {
		return part5Question_explantation;
	}
	public void setPart5Question_explantation(Part5Question part5Question_explantation) {
		this.part5Question_explantation = part5Question_explantation;
	}
	public String getMeanContent() {
		return meanContent;
	}
	public void setMeanContent(String meanContent) {
		this.meanContent = meanContent;
	}
	public String getMean_op1() {
		return mean_op1;
	}
	public void setMean_op1(String mean_op1) {
		this.mean_op1 = mean_op1;
	}
	public String getMean_op2() {
		return mean_op2;
	}
	public void setMean_op2(String mean_op2) {
		this.mean_op2 = mean_op2;
	}
	public String getMean_op3() {
		return mean_op3;
	}
	public void setMean_op3(String mean_op3) {
		this.mean_op3 = mean_op3;
	}
	public String getMean_op4() {
		return mean_op4;
	}
	public void setMean_op4(String mean_op4) {
		this.mean_op4 = mean_op4;
	}
	public String getExplantation() {
		return explantation;
	}
	public void setExplantation(String explantation) {
		this.explantation = explantation;
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
