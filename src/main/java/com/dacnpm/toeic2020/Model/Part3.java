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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name="part3_listening")
public class Part3 {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_exam",nullable=true)
	private Examination exam_part3;
	
	
	@OneToOne(cascade=CascadeType.ALL,fetch= FetchType.EAGER)
	@JoinColumn(name="id_translate",nullable=true)
	private QuestrionTranslate part3_questrionTranslate;
	
	private int type;
	private int oderIndex;
	private String mp3;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@OneToMany(mappedBy="part3Listening_question",fetch= FetchType.EAGER)
    Set<Part3Question>  part3Questions;
	
	@OneToMany(mappedBy = "part3_PartResult", fetch = FetchType.LAZY)
	Set<Part3Result> part3Results;

	
	public Part3() {
		super();
	}

	
	public Part3(Integer id, Set<Part3Question> part3Questions, QuestrionTranslate part3_questrionTranslate,
			int activeFlag, Date createDate, Date updateDate) {
		super();
		this.id = id;
		this.part3Questions = part3Questions;
		this.part3_questrionTranslate = part3_questrionTranslate;
		this.activeFlag = activeFlag;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	

	

	public Set<Part3Result> getPart3Results() {
		return part3Results;
	}


	public void setPart3Results(Set<Part3Result> part3Results) {
		this.part3Results = part3Results;
	}


	public int getOderIndex() {
		return oderIndex;
	}


	public void setOderIndex(int oderIndex) {
		this.oderIndex = oderIndex;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public Examination getExam_part3() {
		return exam_part3;
	}

	public void setExam_part3(Examination exam_part3) {
		this.exam_part3 = exam_part3;
	}

	

	public Set<Part3Question> getPart3Questions() {
		return part3Questions;
	}

	public void setPart3Questions(Set<Part3Question> part3Questions) {
		this.part3Questions = part3Questions;
	}

	public QuestrionTranslate getPart3_questrionTranslate() {
		return part3_questrionTranslate;
	}

	public void setPart3_questrionTranslate(QuestrionTranslate part3_questrionTranslate) {
		this.part3_questrionTranslate = part3_questrionTranslate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	
}
