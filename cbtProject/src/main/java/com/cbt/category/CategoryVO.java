package com.cbt.category;

public class CategoryVO {
	/*19 07 03 재홍 DB맞게 수정*/
	private String 	categoryId;
	private int 	categoryMainId;
	private int 	categoryMiddleId;
	private int 	categorySamllId;
	
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public int getCategoryMainId() {
		return categoryMainId;
	}

	public void setCategoryMainId(int categoryMainId) {
		this.categoryMainId = categoryMainId;
	}

	public int getCategoryMiddleId() {
		return categoryMiddleId;
	}

	public void setCategoryMiddleId(int categoryMiddleId) {
		this.categoryMiddleId = categoryMiddleId;
	}

	public int getCategorySamllId() {
		return categorySamllId;
	}

	public void setCategorySamllId(int categorySamllId) {
		this.categorySamllId = categorySamllId;
	}

}
