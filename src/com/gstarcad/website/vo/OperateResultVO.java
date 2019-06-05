package com.gstarcad.website.vo;

public class OperateResultVO {
	private boolean state;
	private String message;
	private Object rs;
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getRs() {
		return rs;
	}
	public void setRs(Object rs) {
		this.rs = rs;
	}
}
