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
import javax.persistence.OneToOne;

@Entity(name = "vocabularycontent")
public class Vocabularycontent {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idvocabularycontent;
	String namevocabularycontent;
	String transcribe;
	String imagevocabularycontent;
	String audiomp3;
	String audioogg;
	String mean;
	String question;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idvocabulary")
	Vocabularyline vocabularyline;
	
	@OneToMany(fetch =  FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "idvocabularycontent")
	Set<VocabularyTrue> vocabularyTrue;
	
	@OneToMany(fetch =  FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "idvocabularycontent")
	Set<VocabularyQuestion> vocabularyQuestion;
	
	int activeFlag;
	
	
	public Set<VocabularyQuestion> getVocabularyQuestion() {
		return vocabularyQuestion;
	}
	public void setVocabularyQuestion(Set<VocabularyQuestion> vocabularyQuestion) {
		this.vocabularyQuestion = vocabularyQuestion;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getActiveFlag() {
		return activeFlag;
	}
	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}
	public int getIdvocabularycontent() {
		return idvocabularycontent;
	}
	public void setIdvocabularycontent(int idvocabularycontent) {
		this.idvocabularycontent = idvocabularycontent;
	}
	public String getNamevocabularycontent() {
		return namevocabularycontent;
	}
	public void setNamevocabularycontent(String namevocabularycontent) {
		this.namevocabularycontent = namevocabularycontent;
	}
	public String getTranscribe() {
		return transcribe;
	}
	public void setTranscribe(String transcribe) {
		this.transcribe = transcribe;
	}
	public String getAudiomp3() {
		return audiomp3;
	}
	public void setAudiomp3(String audiomp3) {
		this.audiomp3 = audiomp3;
	}
	public String getAudioogg() {
		return audioogg;
	}
	public void setAudioogg(String audioogg) {
		this.audioogg = audioogg;
	}
	public Vocabularyline getVocabularyline() {
		return vocabularyline;
	}
	public void setVocabularyline(Vocabularyline vocabularyline) {
		this.vocabularyline = vocabularyline;
	}
	public String getImagevocabularycontent() {
		return imagevocabularycontent;
	}
	public void setImagevocabularycontent(String imagevocabularycontent) {
		this.imagevocabularycontent = imagevocabularycontent;
	}
	public String getMean() {
		return mean;
	}
	public void setMean(String mean) {
		this.mean = mean;
	}
	public Set<VocabularyTrue> getVocabularyTrue() {
		return vocabularyTrue;
	}
	public void setVocabularyTrue(Set<VocabularyTrue> vocabularyTrue) {
		this.vocabularyTrue = vocabularyTrue;
	}
	

}
