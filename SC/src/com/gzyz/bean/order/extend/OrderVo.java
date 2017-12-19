package com.gzyz.bean.order.extend;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;

public class OrderVo extends Order{
	private int goods_id;
	private String goods_name;
	private int quantity;
	private double shop_price;
	private double total_fee;
	private String formatDateString; //yyyy-MM-dd
	
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getShop_price() {
		return shop_price;
	}
	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}
	public double getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(double total_fee) {
		this.total_fee = total_fee;
	}
	public String getFormatDateString() {
		return formatDateString;
	}
	public void setFormatDateString(String formatDateString) {
		this.formatDateString = formatDateString;
	}
	
	@Override
	public String toString() {
		return "OrderVo [goods_id=" + goods_id + ", goods_name=" + goods_name
				+ ", quantity=" + quantity + ", shop_price=" + shop_price
				+ ", total_fee=" + total_fee + ", formatDateString="
				+ formatDateString + "]";
	}
	
}
