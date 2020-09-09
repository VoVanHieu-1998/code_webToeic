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
@Entity(name="part6_reading")
public class Part6 {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "exam_id", nullable = true)
	private Examination exam_part6;
	
	private String content;
	private int type;
	private int oderIndex;
	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@OneToMany(mappedBy="part6ReadingQuestion",fetch= FetchType.EAGER)
	Set<Part6Question>  part6Questions;

	@OneToMany(mappedBy = "part6_PartResult", fetch = FetchType.LAZY)
	Set<Part6Result> part6Results;

	public Part6() {
		super();
	}

	public Part6(Integer id, String content, int type, int oderIndex) {
		super();
		this.id = id;
		this.content = content;
		this.type = type;
		this.oderIndex = oderIndex;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Examination getExam_part6() {
		return exam_part6;
	}

	public void setExam_part6(Examination exam_part6) {
		this.exam_part6 = exam_part6;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getOderIndex() {
		return oderIndex;
	}

	public void setOderIndex(int oderIndex) {
		this.oderIndex = oderIndex;
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

	public Set<Part6Question> getPart6Questions() {
		return part6Questions;
	}

	public void setPart6Questions(Set<Part6Question> part6Questions) {
		this.part6Questions = part6Questions;
	}

	public Set<Part6Result> getPart6Results() {
		return part6Results;
	}

	public void setPart6Results(Set<Part6Result> part6Results) {
		this.part6Results = part6Results;
	}
	
	
	
}
