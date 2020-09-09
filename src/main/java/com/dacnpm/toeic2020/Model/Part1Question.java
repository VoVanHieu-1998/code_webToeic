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
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="part1_question")
public class Part1Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_part1_listening",nullable=false)
	private Part1 part1ListeningQuestion;
	
	private int indexQ;
	private String img;
	private String op1;
	private String op2;
	private String op3;
	private String op4;
	private String op_true;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@Transient
	private int isTrue;
	
	@Transient
	private String opSelected;
	@OneToMany(mappedBy="part1Question_Result",fetch= FetchType.LAZY)
    Set<Part1Result>  part1Results;

	
	public String getOpSelected() {
		return opSelected;
	}



	public void setOpSelected(String opSelected) {
		this.opSelected = opSelected;
	}



	public Part1Question() {
		super();
	}

	
	
	public int getIsTrue() {
		return isTrue;
	}



	public void setIsTrue(int isTrue) {
		this.isTrue = isTrue;
	}






	public Part1Question(Integer id, int indexQ, String img, String op1, String op2, String op3, String op4,
			String op_true, int isTrue) {
		super();
		this.id = id;
		this.indexQ = indexQ;
		this.img = img;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
		this.isTrue = isTrue;
	}



	public Part1Question(Integer id, int indexQ, String img, String op1, String op2, String op3, String op4,
			String op_true, int isTrue, String opSelected) {
		super();
		this.id = id;
		this.indexQ = indexQ;
		this.img = img;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
		this.isTrue = isTrue;
		this.opSelected = opSelected;
	}



	public Part1Question(Integer id, Part1 part1ListeningQuestion, int indexQ, String img, String op1, String op2,
			String op3, String op4, String op_true) {
		super();
		this.id = id;
		this.part1ListeningQuestion = part1ListeningQuestion;
		this.indexQ = indexQ;
		this.img = img;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op4 = op4;
		this.op_true = op_true;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	

	public int getIndexQ() {
		return indexQ;
	}

	public void setIndexQ(int indexQ) {
		this.indexQ = indexQ;
	}

	public Part1 getPart1ListeningQuestion() {
		return part1ListeningQuestion;
	}

	public void setPart1ListeningQuestion(Part1 part1ListeningQuestion) {
		this.part1ListeningQuestion = part1ListeningQuestion;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public Set<Part1Result> getPart1Results() {
		return part1Results;
	}

	public void setPart1Results(Set<Part1Result> part1Results) {
		this.part1Results = part1Results;
	}

	
	
	
	
	
}
