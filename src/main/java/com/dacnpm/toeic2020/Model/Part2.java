package com.dacnpm.toeic2020.Model;

import java.util.Date;
import java.util.List;
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

@Entity(name = "part2_listening")
public class Part2 {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@OneToMany(mappedBy="part2ListeningQuestion",fetch= FetchType.EAGER)
	Set<Part2Question>  part2Questions;
	
	private String mp3;
	private int type;

	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "exam_id", nullable = true)
	private Examination exam_part2;

	@OneToOne(cascade=CascadeType.ALL,fetch= FetchType.LAZY)
	@JoinColumn(name="id_translate",nullable=true)
	private QuestrionTranslate part2_questrionTranslate;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public Set<Part2Question> getPart2Questions() {
		return part2Questions;
	}

	public void setPart2Questions(Set<Part2Question> part2Questions) {
		this.part2Questions = part2Questions;
	}

	public Examination getExam_part2() {
		return exam_part2;
	}

	public void setExam_part2(Examination exam_part2) {
		this.exam_part2 = exam_part2;
	}

	public String getMp3() {
		return mp3;
	}

	public void setMp3(String mp3) {
		this.mp3 = mp3;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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
	public Part2(Integer id, Set<Part2Question> part2Questions, String mp3, int type, int activeFlag, Date createDate,
			Date updateDate) {
		super();
		this.id = id;
		this.part2Questions = part2Questions;
		this.mp3 = mp3;
		this.type = type;
		this.activeFlag = activeFlag;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public Part2() {
		
	}

	public QuestrionTranslate getPart2_questrionTranslate() {
		return part2_questrionTranslate;
	}

	public void setPart2_questrionTranslate(QuestrionTranslate part2_questrionTranslate) {
		this.part2_questrionTranslate = part2_questrionTranslate;
	}
	
	
	

}
