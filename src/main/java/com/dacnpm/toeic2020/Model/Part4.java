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

@Entity(name="part4_listening")
public class Part4 {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_exam",nullable=false)
	private Examination exam_part4;
	
	@OneToOne(cascade=CascadeType.ALL,fetch= FetchType.EAGER)
	@JoinColumn(name="id_translate",nullable=false)
	private QuestrionTranslate part4_questrionTranslate;
	
	private int type;
	private int oderIndex;
	private String mp3;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@OneToMany(mappedBy="part4Listening_question",fetch= FetchType.EAGER)
    Set<Part4Question>  part4Questions;
	
	@OneToMany(mappedBy = "part4_PartResult", fetch = FetchType.LAZY)
	Set<Part4Result> part4Results;

	
	
	

	public Part4() {
		super();
	}

	public Part4(Integer id, QuestrionTranslate part4_questrionTranslate, Set<Part4Question> part4Questions) {
		super();
		this.id = id;
		this.part4_questrionTranslate = part4_questrionTranslate;
		this.part4Questions = part4Questions;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Examination getExam_part4() {
		return exam_part4;
	}

	public void setExam_part4(Examination exam_part4) {
		this.exam_part4 = exam_part4;
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

	public String getMp3() {
		return mp3;
	}

	public void setMp3(String mp3) {
		this.mp3 = mp3;
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

	public Set<Part4Question> getPart4Questions() {
		return part4Questions;
	}

	public void setPart4Questions(Set<Part4Question> part4Questions) {
		this.part4Questions = part4Questions;
	}

	public Set<Part4Result> getPart4Results() {
		return part4Results;
	}

	public void setPart4Results(Set<Part4Result> part4Results) {
		this.part4Results = part4Results;
	}

	public QuestrionTranslate getPart4_questrionTranslate() {
		return part4_questrionTranslate;
	}

	public void setPart4_questrionTranslate(QuestrionTranslate part4_questrionTranslate) {
		this.part4_questrionTranslate = part4_questrionTranslate;
	}
	
	
	
	
}
