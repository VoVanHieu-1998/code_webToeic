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
@Entity
@Table(name="part7_reading")
public class Part7 {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_exam",nullable=true)
	private Examination exam_part7;
	private int type;
	private int order;
	
	private String content1;
	private String content2;	
	
	@ManyToOne()
	@JoinColumn(name="id_part7_lesson",nullable= true)
	private Part7Lesson part7Lesson_part7Reading;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@OneToOne(mappedBy="part7_translate")
	private Part7ReadingTranslate part7ReadingTranslate;

	@OneToMany(mappedBy="part7Reading_question",fetch= FetchType.LAZY)
    Set<Part7ReadingQuestion>  part7ReadingQuestions;
	
	@OneToMany(mappedBy = "part7_PartResult", fetch = FetchType.LAZY)
	Set<Part7Result> part7Results;

	
	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Examination getExam_part7() {
		return exam_part7;
	}

	public void setExam_part7(Examination exam_part7) {
		this.exam_part7 = exam_part7;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public Part7Lesson getPart7Lesson_part7Reading() {
		return part7Lesson_part7Reading;
	}

	public void setPart7Lesson_part7Reading(Part7Lesson part7Lesson_part7Reading) {
		this.part7Lesson_part7Reading = part7Lesson_part7Reading;
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

	public Set<Part7ReadingQuestion> getPart7ReadingQuestions() {
		return part7ReadingQuestions;
	}

	public void setPart7ReadingQuestions(Set<Part7ReadingQuestion> part7ReadingQuestions) {
		this.part7ReadingQuestions = part7ReadingQuestions;
	}

	public Set<Part7Result> getPart7Results() {
		return part7Results;
	}

	public void setPart7Results(Set<Part7Result> part7Results) {
		this.part7Results = part7Results;
	}

	public Part7() {
		super();
	}

	public Part7ReadingTranslate getPart7ReadingTranslate() {
		return part7ReadingTranslate;
	}

	public void setPart7ReadingTranslate(Part7ReadingTranslate part7ReadingTranslate) {
		this.part7ReadingTranslate = part7ReadingTranslate;
	}

	public Part7(Integer id, String content1, String content2, Part7ReadingTranslate part7ReadingTranslate,
			Set<Part7ReadingQuestion> part7ReadingQuestions) {
		super();
		this.id = id;
		this.content1 = content1;
		this.content2 = content2;
		this.part7ReadingTranslate = part7ReadingTranslate;
		this.part7ReadingQuestions = part7ReadingQuestions;
	}

	
	
	
}
