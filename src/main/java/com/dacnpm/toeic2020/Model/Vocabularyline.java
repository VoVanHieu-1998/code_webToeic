package com.dacnpm.toeic2020.Model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity(name = "vocabularyline")
public class Vocabularyline {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer idvocabulary;
	
	String namevocabulary;
	String imagevocabulary;
	int activeFlag;
	String content;
	@OneToMany(fetch =  FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "idvocabulary")
	Set<Vocabularycontent> vocabularycontent;
	
	
	@Transient
	private MultipartFile multipartFile;
	
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	public int getActiveFlag() {
		return activeFlag;
	}
	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}
	public Set<Vocabularycontent> getVocabularycontent() {
		return vocabularycontent;
	}
	public void setVocabularycontent(Set<Vocabularycontent> vocabularycontent) {
		this.vocabularycontent = vocabularycontent;
	}
	public Integer getIdvocabulary() {
		return idvocabulary;
	}
	public void setIdvocabulary(Integer idvocabulary) {
		this.idvocabulary = idvocabulary;
	}
	public String getNamevocabulary() {
		return namevocabulary;
	}
	public void setNamevocabulary(String namevocabulary) {
		this.namevocabulary = namevocabulary;
	}
	public String getImagevocabulary() {
		return imagevocabulary;
	}
	public void setImagevocabulary(String imagevocabulary) {
		this.imagevocabulary = imagevocabulary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
