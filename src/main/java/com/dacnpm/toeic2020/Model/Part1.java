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


@Entity
@Table(name="part1_listening")
public class Part1 {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	
	@OneToMany(mappedBy="part1ListeningQuestion",fetch= FetchType.EAGER,cascade=CascadeType.ALL)
    Set<Part1Question>  part1Questions;
	
	private String mp3;
	private int type;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="exam_id",nullable=true)
	private Examination exam_part1;

	
	public Part1(Integer id, Set<Part1Question> part1Questions, String mp3, int type, int activeFlag, Date createDate,
			Date updateDate) {
		super();
		this.id = id;
		this.part1Questions = part1Questions;
		this.mp3 = mp3;
		this.type = type;
		this.activeFlag = activeFlag;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Part1() {
		super();
	}

	public Part1(Integer id, Set<Part1Question> part1Questions, String mp3, int type) {
		super();
		this.id = id;
		this.part1Questions = part1Questions;
		this.mp3 = mp3;
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
	public Set<Part1Question> getPart1Questions() {
		return part1Questions;
	}

	public void setPart1Questions(Set<Part1Question> part1Questions) {
		this.part1Questions = part1Questions;
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

	public Examination getExam_part1() {
		return exam_part1;
	}

	public void setExam_part1(Examination exam_part1) {
		this.exam_part1 = exam_part1;
	}
	

	
}
