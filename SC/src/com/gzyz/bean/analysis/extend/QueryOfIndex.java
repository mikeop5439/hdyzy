package com.gzyz.bean.analysis.extend;

public class QueryOfIndex {
	private int numberOfVisiter;
	private double todayIncome;
	private int numberOfGoods;
	private double totalIncome;
	public int getNumberOfVisiter() {
		return numberOfVisiter;
	}
	public void setNumberOfVisiter(int numberOfVisiter) {
		this.numberOfVisiter = numberOfVisiter;
	}
	public double getTodayIncome() {
		return todayIncome;
	}
	public void setTodayIncome(double todayIncome) {
		this.todayIncome = todayIncome;
	}
	public int getNumberOfGoods() {
		return numberOfGoods;
	}
	public void setNumberOfGoods(int numberOfGoods) {
		this.numberOfGoods = numberOfGoods;
	}
	public double getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(double totalIncome) {
		this.totalIncome = totalIncome;
	}
	@Override
	public String toString() {
		return "QueryOfIndex [numberOfVisiter=" + numberOfVisiter
				+ ", todayIncome=" + todayIncome + ", numberOfGoods="
				+ numberOfGoods + ", totalIncome=" + totalIncome + "]";
	}
	
}
