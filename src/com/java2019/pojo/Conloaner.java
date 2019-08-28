package com.java2019.pojo;

import java.io.Serializable;

public class Conloaner implements Serializable {
	private static final long serialVersionUID = 1L;
	private int cid;
	private String cname;
	private String cidcard;
	private String cscardtart;
	private String ccardend;
	private String cphone;
	private String cbody;
	private String caddress;
	private String coaddress;
	private String user_idcard;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCidcard() {
		return cidcard;
	}
	public void setCidcard(String cidcard) {
		this.cidcard = cidcard;
	}
	public String getCscardtart() {
		return cscardtart;
	}
	public void setCscardtart(String cscardtart) {
		this.cscardtart = cscardtart;
	}
	public String getCcardend() {
		return ccardend;
	}
	public void setCcardend(String ccardend) {
		this.ccardend = ccardend;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getCbody() {
		return cbody;
	}
	public void setCbody(String cbody) {
		this.cbody = cbody;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getCoaddress() {
		return coaddress;
	}
	public void setCoaddress(String coaddress) {
		this.coaddress = coaddress;
	}
	public String getUser_idcard() {
		return user_idcard;
	}
	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Conloaner [cid=" + cid + ", cname=" + cname + ", cidcard=" + cidcard + ", cscardtart=" + cscardtart
				+ ", ccardend=" + ccardend + ", cphone=" + cphone + ", cbody=" + cbody + ", caddress=" + caddress
				+ ", coaddress=" + coaddress + ", user_idcard=" + user_idcard + "]";
	}
	
}
