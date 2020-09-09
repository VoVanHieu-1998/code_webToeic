package com.dacnpm.toeic2020.Model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="part7_reading_question_translate")
public class Part7ReadingTranslate {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@OneToOne()
	@JoinColumn(name="id_part7_reading",nullable=false)
	private Part7 part7_translate;
	
	private String content1;
	private String content2;
	
	private int activeFlag;
	private Date createDate;
	private Date updateDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Part7 getPart7_translate() {
		return part7_translate;
	}
	public void setPart7_translate(Part7 part7_translate) {
		this.part7_translate = part7_translate;
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
	public Part7ReadingTranslate() {
		super();
	}
	public Part7ReadingTranslate(Integer id, String content1, String content2) {
		super();
		this.id = id;
		this.content1 = content1;
		this.content2 = content2;
	}

	
	
	
}
