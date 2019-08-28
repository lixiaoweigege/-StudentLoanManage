package com.java2019.pojo;

public class Auditing {
	private int page;//第几页
	private int rows;//每页记录数
	private int start;//起始页
	private String pidcard;
	private String ayear;
	private String astate;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStart() {
		return (page-1)*rows;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getPidcard() {
		return pidcard;
	}
	public void setPidcard(String pidcard) {
		this.pidcard = pidcard;
	}
	public String getAyear() {
		return ayear;
	}
	public void setAyear(String ayear) {
		this.ayear = ayear;
	}
	public String getAstate() {
		return astate;
	}
	public void setAstate(String astate) {
		this.astate = astate;
	}
	
}
