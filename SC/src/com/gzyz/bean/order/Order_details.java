package com.gzyz.bean.order;


public class Order_details{
	private int order_details_id;
	private int order_id;
	private int goods_id;
	private String goods_name;
	private int quantity;
	private double shop_price;
	private double total_fee;
	private String original_img;
	
	public int getOrder_details_id() {
		return order_details_id;
	}
	public void setOrder_details_id(int order_details_id) {
		this.order_details_id = order_details_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
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
	public String getOriginal_img() {
		return original_img;
	}
	public void setOriginal_img(String original_img) {
		this.original_img = original_img;
	}
	
	@Override
	public String toString() {
		return "Order_details [order_details_id=" + order_details_id
				+ ", order_id=" + order_id + ", goods_id=" + goods_id
				+ ", goods_name=" + goods_name + ", quantity=" + quantity
				+ ", shop_price=" + shop_price + ", total_fee=" + total_fee
				+ ", original_img=" + original_img + "]";
	}
	
}
