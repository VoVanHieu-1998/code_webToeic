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

@Entity(name="part4_listening_questions")
public class Part4Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part4_listening",nullable=false)
	private Part4 part4Listening_question;
	
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
	
	@OneToOne(mappedBy="part4Question_explantation",cascade=CascadeType.ALL)
	private Part4QuestionExplantation part4QuestionExplantation;
	
	@Transient
	private int isTrue;
	
	@Transient
	private String opSelected;
	
	@OneToMany(mappedBy="part4Result_part4ResultQuestion",fetch= FetchType.LAZY)
	Set<Part4ResultQuestion>  part4ResultQuestion_part4Questions;

	
	
	public Part4Question() {
		super();
	
	}

	
	public String getOpSelected() {
		return opSelected;
	}


	public void setOpSelected(String opSelected) {
		this.opSelected = opSelected;
	}


	public Part4Question(Integer id, String content, String op1, String op2, String op3, String op4, String op_true,
			int order, Part4QuestionExplantation part4QuestionExplantation, int isTrue) {
		super();
		this.id = id;
		this.content = content;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
		this.order = order;
		this.part4QuestionExplantation = part4QuestionExplantation;
		this.isTrue = isTrue;
	}

	

	public Part4Question(Integer id, String content, String op1, String op2, String op3, String op4, String op_true,
			int order, int isTrue, String opSelected) {
		super();
		this.id = id;
		this.content = content;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
		this.order = order;
		this.isTrue = isTrue;
		this.opSelected = opSelected;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Part4 getPart4Listening_question() {
		return part4Listening_question;
	}

	public void setPart4Listening_question(Part4 part4Listening_question) {
		this.part4Listening_question = part4Listening_question;
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

	public Part4QuestionExplantation getPart4QuestionExplantation() {
		return part4QuestionExplantation;
	}

	public void setPart4QuestionExplantation(Part4QuestionExplantation part4QuestionExplantation) {
		this.part4QuestionExplantation = part4QuestionExplantation;
	}

	public int getIsTrue() {
		return isTrue;
	}

	public void setIsTrue(int isTrue) {
		this.isTrue = isTrue;
	}

	public Set<Part4ResultQuestion> getPart4ResultQuestion_part4Questions() {
		return part4ResultQuestion_part4Questions;
	}

	public void setPart4ResultQuestion_part4Questions(Set<Part4ResultQuestion> part4ResultQuestion_part4Questions) {
		this.part4ResultQuestion_part4Questions = part4ResultQuestion_part4Questions;
	}
	
	
	
}
