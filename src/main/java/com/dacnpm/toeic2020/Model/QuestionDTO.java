package com.dacnpm.toeic2020.Model;

public class QuestionDTO {

	int idPart;
	int idQuestion;
	String answer;
	
	
	public QuestionDTO() {
		super();
	}
	
	
	
	
	public QuestionDTO(int idPart, int idQuestion, String answer) {
		super();
		this.idPart = idPart;
		this.idQuestion = idQuestion;
		this.answer = answer;
	}




	public int getIdPart() {
		return idPart;
	}
	public void setIdPart(int idPart) {
		this.idPart = idPart;
	}
	public int getIdQuestion() {
		return idQuestion;
	}
	public void setIdQuestion(int idQuestion) {
		this.idQuestion = idQuestion;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
