package com.cbt.question;

public class QuestionVO {
	
	
	
	// 7/2 생성    -재용
	private String questionId;
	private String questionContent;
	private String example1;
	private String example2;
	private String example3;
	private String example4;
	private String rightAnswer;
	private String rightCommentary;
	private String levelOfDifficulty;
	private int categoryId;
	private String questionType;
	
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getExample1() {
		return example1;
	}
	public void setExample1(String example1) {
		this.example1 = example1;
	}
	public String getExample2() {
		return example2;
	}
	public void setExample2(String example2) {
		this.example2 = example2;
	}
	public String getExample3() {
		return example3;
	}
	public void setExample3(String example3) {
		this.example3 = example3;
	}
	public String getExample4() {
		return example4;
	}
	public void setExample4(String example4) {
		this.example4 = example4;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public String getRightCommentary() {
		return rightCommentary;
	}
	public void setRightCommentary(String rightCommentary) {
		this.rightCommentary = rightCommentary;
	}
	public String getLevelOfDifficulty() {
		return levelOfDifficulty;
	}
	public void setLevelOfDifficulty(String levelOfDifficulty) {
		this.levelOfDifficulty = levelOfDifficulty;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	
	@Override
	public String toString() {
		return "QuestionVO [questionId=" + questionId + ", questionContent=" + questionContent + ", example1="
				+ example1 + ", example2=" + example2 + ", example3=" + example3 + ", example4=" + example4
				+ ", rightAnswer=" + rightAnswer + ", rightCommentary=" + rightCommentary + ", levelOfDifficulty="
				+ levelOfDifficulty + ", categoryId=" + categoryId + ", questionType=" + questionType + "]";
	}

}
