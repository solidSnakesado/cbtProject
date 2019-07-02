package com.cbt.category;

public class CategoryVO {

	private String mainCategory;
	private String middleCategory;
	private String smallCategory;
	private int categoryId;
	
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getMiddleCategory() {
		return middleCategory;
	}
	public void setMiddleCategory(String middleCategory) {
		this.middleCategory = middleCategory;
	}
	public String getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(String smallCategory) {
		this.smallCategory = smallCategory;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [mainCategory=" + mainCategory + ", middleCategory=" + middleCategory + ", smallCategory="
				+ smallCategory + ", categoryId=" + categoryId + "]";
	}
	
}
