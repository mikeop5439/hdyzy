package com.gzyz.bean.personcar;

import java.util.Date;

public class ApplyInvoiceAndDate extends ApplyInvoice {
	private Date apply_time;

	public Date getApply_time() {
		return apply_time;
	}

	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
	}

	@Override
	public String toString() {
		return "ApplyInvoiceAndDate [apply_time=" + apply_time + "]";
	}
	
}
