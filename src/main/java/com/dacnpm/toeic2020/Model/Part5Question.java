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
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="part5_reading_question")
public class Part5Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_exam",nullable=true)
	private Examination exam_part5;
	private String content;
	private String op1;
	private String op2;
	private String op3;
	private String op4;
	private String op_true;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part5_lesson",nullable= true)
	private Part5Lesson part5Lesson_part5Question;
	
	
	private int order;
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@Transient
	private String opSelected;
	
	@Transient
	private int isTrue;
	@OneToMany(mappedBy="part5Question_Result",fetch= FetchType.LAZY)
	Set<Part5QuestionResult>  part5QuestionResults;
	
	@OneToOne(mappedBy="part5Question_explantation",cascade=CascadeType.ALL)
	private Part5QuestionExplantation part5QuestionExplantaion;

	
	
	public Part5Question() {
		super();
	}

	public Part5Question(Integer id, String content, String op1, String op2, String op3, String op4, String op_true,
			int order, String opSelected, Part5QuestionExplantation part5QuestionExplantaion,int isTrue) {
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
		this.part5QuestionExplantaion = part5QuestionExplantaion;
		this.isTrue = isTrue;
	}

	
	public Part5Question(Integer id, Examination exam_part5, String content, String op1, String op2, String op3,
			String op4, String op_true, Part5Lesson part5Lesson_part5Question, int order, int activeFlag,
			Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.exam_part5 = exam_part5;
		this.content = content;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
		this.part5Lesson_part5Question = part5Lesson_part5Question;
		this.order = order;
		this.activeFlag = activeFlag;
		this.createDate = createDate;
		this.updateDate = updateDate;
		
	}
	

	public Part5Question(Integer id, String content, String op1, String op2, String op3, String op4, String op_true,
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

	public int getIsTrue() {
		return isTrue;
	}

	public void setIsTrue(int isTrue) {
		this.isTrue = isTrue;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Examination getExam_part5() {
		return exam_part5;
	}

	public void setExam_part5(Examination exam_part5) {
		this.exam_part5 = exam_part5;
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

	public Part5Lesson getPart5Lesson_part5Question() {
		return part5Lesson_part5Question;
	}

	public void setPart5Lesson_part5Question(Part5Lesson part5Lesson_part5Question) {
		this.part5Lesson_part5Question = part5Lesson_part5Question;
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

	public Set<Part5QuestionResult> getPart5QuestionResults() {
		return part5QuestionResults;
	}

	public void setPart5QuestionResults(Set<Part5QuestionResult> part5QuestionResults) {
		this.part5QuestionResults = part5QuestionResults;
	}

	public Part5QuestionExplantation getPart5QuestionExplantaion() {
		return part5QuestionExplantaion;
	}

	public void setPart5QuestionExplantaion(Part5QuestionExplantation part5QuestionExplantaion) {
		this.part5QuestionExplantaion = part5QuestionExplantaion;
	}
	
	
	
}
