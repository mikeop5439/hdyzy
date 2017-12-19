package com.gzyz.bean.order;

import java.util.Date;

public class Order {
	private int order_id;
	private int user_id;
	private int receiver_id;
	private Date order_time;
	private int order_status;
	private int pay_ment;
	private Date creat_time;
	private Date pay_time;
	private Date consign_time;
	private Date end_time;
	private String shipping_name;
	private String shipping_code;
	private String order_remark;
	private String user_name;
	private int goods_id;
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public int getPay_ment() {
		return pay_ment;
	}
	public void setPay_ment(int pay_ment) {
		this.pay_ment = pay_ment;
	}
	public Date getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(Date creat_time) {
		this.creat_time = creat_time;
	}
	public Date getPay_time() {
		return pay_time;
	}
	public void setPay_time(Date pay_time) {
		this.pay_time = pay_time;
	}
	public Date getConsign_time() {
		return consign_time;
	}
	public void setConsign_time(Date consign_time) {
		this.consign_time = consign_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public String getShipping_code() {
		return shipping_code;
	}
	public void setShipping_code(String shipping_code) {
		this.shipping_code = shipping_code;
	}
	public String getOrder_remark() {
		return order_remark;
	}
	public void setOrder_remark(String order_remark) {
		this.order_remark = order_remark;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id
				+ ", receiver_id=" + receiver_id + ", order_time=" + order_time
				+ ", order_status=" + order_status + ", pay_ment=" + pay_ment
				+ ", creat_time=" + creat_time + ", pay_time=" + pay_time
				+ ", consign_time=" + consign_time + ", end_time=" + end_time
				+ ", shipping_name=" + shipping_name + ", shipping_code="
				+ shipping_code + ", order_remark=" + order_remark
				+ ", user_name=" + user_name + "]";
	}
	
}
