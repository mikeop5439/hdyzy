package com.gzyz.bean.order;

import java.util.Date;

public class Order_invoice {
	private int invoice_id;
	private int order_id;
	private int invoice_status;
	private String apply_reason;
	private Date apply_time;
	public int getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(int invoice_id) {
		this.invoice_id = invoice_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getInvoice_status() {
		return invoice_status;
	}
	public void setInvoice_status(int invoice_status) {
		this.invoice_status = invoice_status;
	}
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}
	public Date getApply_time() {
		return apply_time;
	}
	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
	}
	@Override
	public String toString() {
		return "Order_invoice [invoice_id=" + invoice_id + ", order_id="
				+ order_id + ", invoice_status=" + invoice_status
				+ ", apply_reason=" + apply_reason + ", apply_time="
				+ apply_time + "]";
	}
		
}
