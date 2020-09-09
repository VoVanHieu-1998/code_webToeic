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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "examination")
public class Examination {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Integer id;
	private String img;
	private String tittle;
	private int activeFlag;
	private Date createDate;
	private Date updateDate;

	@Transient
	private MultipartFile multipartFile;
	
	@OneToMany(mappedBy = "exam_part1", fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	private Set<Part1> part1Lists;

	@OneToMany(mappedBy = "exam_part2", fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	private Set<Part2> part2s;

	@OneToMany(mappedBy = "exam_part3", fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	private Set<Part3> part3s;
	
	@OneToMany(mappedBy = "exam_part4", fetch = FetchType.LAZY,cascade=CascadeType.ALL)
	private Set<Part4> part4s;
	
	@OneToMany(mappedBy = "exam_part5", fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<Part5Question> part5Questions;
	

	@OneToMany(mappedBy = "exam_part6", fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	private Set<Part6> part6s;
	
	@OneToMany(mappedBy = "exam_part7", fetch = FetchType.LAZY)
	private Set<Part7> part7s;
	
	@OneToMany(mappedBy = "examination_result", fetch = FetchType.LAZY)
	private Set<Results> results;

	
	public Set<Part6> getPart6s() {
		return part6s;
	}

	public void setPart6s(Set<Part6> part6s) {
		this.part6s = part6s;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public Set<Part7> getPart7s() {
		return part7s;
	}

	public void setPart7s(Set<Part7> part7s) {
		this.part7s = part7s;
	}

	public Set<Part5Question> getPart5Questions() {
		return part5Questions;
	}

	public void setPart5Questions(Set<Part5Question> part5Questions) {
		this.part5Questions = part5Questions;
	}

	public Set<Part4> getPart4s() {
		return part4s;
	}

	public void setPart4s(Set<Part4> part4s) {
		this.part4s = part4s;
	}

	public Set<Part1> getPart1Lists() {
		return part1Lists;
	}

	public void setPart1Lists(Set<Part1> part1Lists) {
		this.part1Lists = part1Lists;
	}

	public Set<Results> getResults() {
		return results;
	}

	public void setResults(Set<Results> results) {
		this.results = results;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	
	

	public Set<Part2> getPart2s() {
		return part2s;
	}

	public void setPart2s(Set<Part2> part2s) {
		this.part2s = part2s;
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

	public Set<Part3> getPart3s() {
		return part3s;
	}

	public void setPart3s(Set<Part3> part3s) {
		this.part3s = part3s;
	}

}
