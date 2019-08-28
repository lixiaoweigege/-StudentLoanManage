package com.java2019.pojo;

import java.io.Serializable;

public class Personal implements Serializable {
	private static final long serialVersionUID = 1L;
	private int pid;
	private String pname;
	private String pidcard;
	private String pscardtart;
	private String pcardend;
	private String psex;
	private String pnation;
	private String phighschool;
	private String phukou;
	private String ploanarea;
	private String paddress;
	private String pphone;
	private String pemail;
	private String pqq;
	private String pweixin;
	private String prname;
	private String prphone;
	private String pridcard;
	private String pcollege;
	private String pdept;
	private String pmajor;
	private String pyear;
	private int psno;
	private String pendyear;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	public String getPscardtart() {
		return pscardtart;
	}
	public void setPscardtart(String pscardtart) {
		this.pscardtart = pscardtart;
	}
	public String getPcardend() {
		return pcardend;
	}
	public void setPcardend(String pcardend) {
		this.pcardend = pcardend;
	}
	public String getPsex() {
		return psex;
	}
	public void setPsex(String psex) {
		this.psex = psex;
	}
	public String getPnation() {
		return pnation;
	}
	public void setPnation(String pnation) {
		this.pnation = pnation;
	}
	public String getPhighschool() {
		return phighschool;
	}
	public void setPhighschool(String phighschool) {
		this.phighschool = phighschool;
	}
	public String getPhukou() {
		return phukou;
	}
	public void setPhukou(String phukou) {
		this.phukou = phukou;
	}
	public String getPloanarea() {
		return ploanarea;
	}
	public void setPloanarea(String ploanarea) {
		this.ploanarea = ploanarea;
	}
	public String getPaddress() {
		return paddress;
	}
	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPqq() {
		return pqq;
	}
	public void setPqq(String pqq) {
		this.pqq = pqq;
	}
	public String getPweixin() {
		return pweixin;
	}
	public void setPweixin(String pweixin) {
		this.pweixin = pweixin;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public String getPrphone() {
		return prphone;
	}
	public void setPrphone(String prphone) {
		this.prphone = prphone;
	}
	public String getPridcard() {
		return pridcard;
	}
	public void setPridcard(String pridcard) {
		this.pridcard = pridcard;
	}
	public String getPcollege() {
		return pcollege;
	}
	public void setPcollege(String pcollege) {
		this.pcollege = pcollege;
	}
	public String getPdept() {
		return pdept;
	}
	public void setPdept(String pdept) {
		this.pdept = pdept;
	}
	public String getPmajor() {
		return pmajor;
	}
	public void setPmajor(String pmajor) {
		this.pmajor = pmajor;
	}
	public String getPyear() {
		return pyear;
	}
	public void setPyear(String pyear) {
		this.pyear = pyear;
	}
	public int getPsno() {
		return psno;
	}
	public void setPsno(int psno) {
		this.psno = psno;
	}
	public String getPendyear() {
		return pendyear;
	}
	public void setPendyear(String pendyear) {
		this.pendyear = pendyear;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Personal [pid=" + pid + ", pname=" + pname + ", pidcard=" + pidcard + ", pscardtart=" + pscardtart
				+ ", pcardend=" + pcardend + ", psex=" + psex + ", pnation=" + pnation + ", phighschool=" + phighschool
				+ ", phukou=" + phukou + ", ploanarea=" + ploanarea + ", paddress=" + paddress + ", pphone=" + pphone
				+ ", pemail=" + pemail + ", pqq=" + pqq + ", pweixin=" + pweixin + ", prname=" + prname + ", prphone="
				+ prphone + ", pridcard=" + pridcard + ", pcollege=" + pcollege + ", pdept=" + pdept + ", pmajor="
				+ pmajor + ", pyear=" + pyear + ", psno=" + psno + ", pendyear=" + pendyear + "]";
	}
}
