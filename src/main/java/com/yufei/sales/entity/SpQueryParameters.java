package com.yufei.sales.entity;

public class SpQueryParameters {
private String parentCategoryId=null;
private String catalogId;
private  long begainPrice;
private long endPrice;
private String sortField;
private String order;
private String hidden;
private String displayed;
private String price;
private String oprice;
private String discount;
private int dispalyedDays;
private String findTime;
private String spName=null;



public String getSpName() {
	return spName;
}

public void setSpName(String spName) {
	this.spName = spName;
}

public String getFindTime() {
	return findTime;
}

public void setFindTime(String findTime) {
	this.findTime = findTime;
}

public int getDispalyedDays() {
	return dispalyedDays;
}

public void setDispalyedDays(int dispalyedDays) {
	this.dispalyedDays = dispalyedDays;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getOprice() {
	return oprice;
}

public void setOprice(String oprice) {
	this.oprice = oprice;
}

public String getDiscount() {
	return discount;
}

public void setDiscount(String discount) {
	this.discount = discount;
}
public String getParentCategoryId() {
	return parentCategoryId;
}

public void setParentCategoryId(String parentCategoryId) {
	this.parentCategoryId = parentCategoryId;
}
public String getCatalogId() {
	return catalogId;
}

public void setCatalogId(String catalogId) {
	this.catalogId = catalogId;
}




public long getBegainPrice() {
	return begainPrice;
}

public void setBegainPrice(long begainPrice) {
	this.begainPrice = begainPrice;
}

public long getEndPrice() {
	return endPrice;
}

public void setEndPrice(long endPrice) {
	this.endPrice = endPrice;
}

public String getSortField() {
	return sortField;
}

public void setSortField(String sortField) {
	this.sortField = sortField;
}

public String getOrder() {
	return order;
}

public void setOrder(String order) {
	this.order = order;
}

public String getHidden() {
	return hidden;
}

public void setHidden(String hidden) {
	this.hidden = hidden;
}

public String getDisplayed() {
	return displayed;
}

public void setDisplayed(String displayed) {
	this.displayed = displayed;
}

public SpQueryParameters() {
	super();
	// TODO Auto-generated constructor stub
}
}
