package com.aaa.entity;

public class SecondCatalog {
	private int id;
	private int catalogid;
	private String scname;
	private String sctext;
	private String scvideo;//视频 地址； 
	private int scorder;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCatalogid() {
		return catalogid;
	}
	public void setCatalogid(int catalogid) {
		this.catalogid = catalogid;
	}
	public String getScname() {
		return scname;
	}
	public void setScname(String scname) {
		this.scname = scname;
	}
	public String getSctext() {
		return sctext;
	}
	public void setSctext(String sctext) {
		this.sctext = sctext;
	}
	public String getScvideo() {
		return scvideo;
	}
	public void setScvideo(String scvideo) {
		this.scvideo = scvideo;
	}
	public int getScorder() {
		return scorder;
	}
	public void setScorder(int scorder) {
		this.scorder = scorder;
	}
	
	
}