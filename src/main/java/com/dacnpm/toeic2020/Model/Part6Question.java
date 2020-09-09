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
import javax.persistence.OneToOne;
import javax.persistence.Transient;
@Entity(name="part6_reading_questions")
public class Part6Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part6_reading",nullable=false)
	private Part6 part6ReadingQuestion;
	
	private String content;
	private String op1;
	private String op2;
	private String op3;
	private String op4;
	private String op_true;
	private int order;
	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@Transient
	private String opSelected;
	
	@Transient
	private int isTrue;
	
	@OneToMany(mappedBy="part6Question_part6ResultQuestion",fetch= FetchType.LAZY)
	Set<Part6ResultQuestion>  part6ResultQuestion_part6Questions;

	public Part6Question() {
		super();
	}

	public Part6Question(Integer id, String content, String op1, String op2, String op3, String op4, String op_true,
			int order, String opSelected, int isTrue) {
		super();
		this.id = id;
		this.content = content;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
		this.order = order;
		this.opSelected = opSelected;
		this.isTrue = isTrue;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Part6 getPart6ReadingQuestion() {
		return part6ReadingQuestion;
	}

	public void setPart6ReadingQuestion(Part6 part6ReadingQuestion) {
		this.part6ReadingQuestion = part6ReadingQuestion;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOp1() {
		return op1;
	}

	public void setOp1(String op1) {
		this.op1 = op1;
	}

	public String getOp2() {
		return op2;
	}

	public void setOp2(String op2) {
		this.op2 = op2;
	}

	public String getOp3() {
		return op3;
	}

	public void setOp3(String op3) {
		this.op3 = op3;
	}

	public String getOp4() {
		return op4;
	}

	public void setOp4(String op4) {
		this.op4 = op4;
	}

	public String getOp_true() {
		return op_true;
	}

	public void setOp_true(String op_true) {
		this.op_true = op_true;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
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

	public String getOpSelected() {
		return opSelected;
	}

	public void setOpSelected(String opSelected) {
		this.opSelected = opSelected;
	}

	public int getIsTrue() {
		return isTrue;
	}

	public void setIsTrue(int isTrue) {
		this.isTrue = isTrue;
	}

	public Set<Part6ResultQuestion> getPart6ResultQuestion_part6Questions() {
		return part6ResultQuestion_part6Questions;
	}

	public void setPart6ResultQuestion_part6Questions(Set<Part6ResultQuestion> part6ResultQuestion_part6Questions) {
		this.part6ResultQuestion_part6Questions = part6ResultQuestion_part6Questions;
	}
	
	
	
}
