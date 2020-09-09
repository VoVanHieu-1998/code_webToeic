package com.dacnpm.toeic2020.Model;

import java.util.Date;
import java.util.List;

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
@Table(name = "part2_question")
public class Part2Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_part2_listening", nullable = true)
	private Part2 part2ListeningQuestion;

	@OneToOne()
	@JoinColumn(name = "id_question_explantation", nullable = true)
	private QuestionExplantation questionExplantation_part2;
	
	private String content;
	private int indexQ;
	private String mp3;
	private String op1;
	private String op2;
	private String op3;
	private String op_true;

	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@OneToMany(mappedBy = "part2Question_Result", fetch = FetchType.LAZY)
	List<Part2Result> part2Results;
	
	

	@Transient
	private String opSelected;
	
	@Transient
	private int isTrue;
	
	public Part2Question(Integer id, QuestionExplantation questionExplantation_part2, String content, String op1,
			String op2, String op3, String op_true, int isTrue) {
		super();
		this.id = id;
		this.questionExplantation_part2 = questionExplantation_part2;
		this.content = content;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op_true = op_true;
		this.isTrue = isTrue;
	}
	public int getIsTrue() {
		return isTrue;
	}

	public void setIsTrue(int isTrue) {
		this.isTrue = isTrue;
	}
	public QuestionExplantation getQuestionExplantation_part2() {
		return questionExplantation_part2;
	}

	public void setQuestionExplantation_part2(QuestionExplantation questionExplantation_part2) {
		this.questionExplantation_part2 = questionExplantation_part2;
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

	public Part2 getPart2ListeningQuestion() {
		return part2ListeningQuestion;
	}

	public void setPart2ListeningQuestion(Part2 part2ListeningQuestion) {
		this.part2ListeningQuestion = part2ListeningQuestion;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMp3() {
		return mp3;
	}

	public void setMp3(String mp3) {
		this.mp3 = mp3;
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

	public List<Part2Result> getPart2Results() {
		return part2Results;
	}

	public void setPart2Results(List<Part2Result> part2Results) {
		this.part2Results = part2Results;
	}

	public String getOpSelected() {
		return opSelected;
	}

	public void setOpSelected(String opSelected) {
		this.opSelected = opSelected;
	}

	public Part2Question(Integer id, String content, String mp3, String op1, String op2, String op3, String op_true,
			String opSelected) {
		super();
		this.id = id;
		this.content = content;
		this.mp3 = mp3;
		this.op1 = op1;
		this.op2 = op2;
		this.op3 = op3;
		this.op_true = op_true;
		this.opSelected = opSelected;
	}

	public Part2Question() {
		super();
	}
	
	
	
	

}
