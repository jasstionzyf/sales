package com.yufei.sales.entity;

import com.yufei.pfw.entity.BaseQueryInfo;

public class SpQueryInfo extends BaseQueryInfo{
	
	public SpQueryInfo() {
		super();
	}
	private double bprice=0;
	private double eprice=0; 
	private long catalogId;
	private long parentCatalogId;
	@Deprecated
	private String sortField;
	private String order;
	private String discount;
	private int dispalyedDays;
	private String findTime;
	private boolean displayed;
	private String price;
	private String oprice;
	private String spName=null;
    private boolean stockHave=true;
    //多个商城
    private String mallId;
    private String keyWord=null;
	/**
	 * field:a#field1:d#...
	 */
	private String sortP=null;
	
	
	public String getSortP() {
		return sortP;
	}
	public void setSortP(String sortP) {
		this.sortP = sortP;
	}
	
	public String getMallId() {
		return mallId;
	}
	public void setMallId(String mallId) {
		this.mallId = mallId;
	}
	public boolean getStockHave() {
		return stockHave;
	}
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public void setStockHave(boolean stockHave) {
		this.stockHave = stockHave;
	}
	public boolean getDisplayed() {
		return displayed;
	}
	public void setDisplayed(boolean displayed) {
		this.displayed = displayed;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
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
	public int getDispalyedDays() {
		return dispalyedDays;
	}
	public void setDispalyedDays(int dispalyedDays) {
		this.dispalyedDays = dispalyedDays;
	}
	public String getFindTime() {
		return findTime;
	}
	public void setFindTime(String findTime) {
		this.findTime = findTime;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public double getBprice() {
		return bprice;
	}
	public void setBprice(double bprice) {
		this.bprice = bprice;
	}
	public double getEprice() {
		return eprice;
	}
	
	public String getSortField() {
		return sortField;
	}
	public void setSortField(String sortField) {
		this.sortField = sortField;
	}
	public void setEprice(double eprice) {
		this.eprice = eprice;
	}
	public long getCatalogId() {
		return catalogId;
	}
	public void setCatalogId(long catalogId) {
		this.catalogId = catalogId;
	}
	public long getParentCatalogId() {
		return parentCatalogId;
	}
	public void setParentCatalogId(long parentCatalogId) {
		this.parentCatalogId = parentCatalogId;
	}

}
