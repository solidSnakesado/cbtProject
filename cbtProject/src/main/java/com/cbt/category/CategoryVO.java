package com.cbt.category;

public class CategoryVO {
	/*19 07 03 재홍 DB맞게 수정*/
	private String categoryId;
	private int mainCategory;
	private int middleCategory;
	private int smallCategory;
	
	
	public String getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}


	public int getMainCategory() {
		return mainCategory;
	}


	public void setMainCategory(int mainCategory) {
		this.mainCategory = mainCategory;
	}


	public int getMiddleCategory() {
		return middleCategory;
	}


	public void setMiddleCategory(int middleCategory) {
		this.middleCategory = middleCategory;
	}


	public int getSmallCategory() {
		return smallCategory;
	}


	public void setSmallCategory(int smallCategory) {
		this.smallCategory = smallCategory;
	}


	@Override
	public String toString() {
		return "CategoryVO [mainCategory=" + mainCategory + ", middleCategory=" + middleCategory + ", smallCategory="
				+ smallCategory + ", categoryId=" + categoryId + "]";
	}
	
	
}
