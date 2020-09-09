package com.dacnpm.toeic2020.Model;

public class CommentForm {
	private String name;
    private String sdt;
    private String email;
    private int grammarId;
    private String cmtContent;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getGrammarId() {
		return grammarId;
	}
	public void setGrammarId(int grammarId) {
		this.grammarId = grammarId;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
    

}
