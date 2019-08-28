package com.java2019.pojo;

public class PageBean {
	private int page;//第几页
	private int rows;//每页记录数
	private int start;//起始页
    private String pname;//用于查询合同记录
    private String pidcard;//用于查询合同记录、银行查询所有还款记录
    private String conumber;//用于查询个人贷款记录
    private String ayear;//用于查询个人贷款记录、银行查询所有还款记录
    private String rapplydate;//银行查询所有还款记录
    private String coendyear;//用于查询贷款逾期信息
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPidcard() {
		return pidcard;
	}

	public void setPidcard(String pidcard) {
		this.pidcard = pidcard;
	}
	
	public String getConumber() {
		return conumber;
	}
	public void setConumber(String conumber) {
		this.conumber = conumber;
	}
	public String getAyear() {
		return ayear;
	}
	public void setAyear(String ayear) {
		this.ayear = ayear;
	}
	public String getRapplydate() {
		return rapplydate;
	}
	public void setRapplydate(String rapplydate) {
		this.rapplydate = rapplydate;
	}
	public String getCoendyear() {
		return coendyear;
	}
	public void setCoendyear(String coendyear) {
		this.coendyear = coendyear;
	}
	
	
}
