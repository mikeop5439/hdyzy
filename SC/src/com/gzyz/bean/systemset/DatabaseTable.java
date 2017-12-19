package com.gzyz.bean.systemset;

public class DatabaseTable {

	private int database_id;
	private String database_name;
	private String database_password;
	
	public int getDatabase_id() {
		return database_id;
	}
	public void setDatabase_id(int database_id) {
		this.database_id = database_id;
	}
	public String getDatabase_name() {
		return database_name;
	}
	public void setDatabase_name(String database_name) {
		this.database_name = database_name;
	}
	public String getDatabase_password() {
		return database_password;
	}
	public void setDatabase_password(String database_password) {
		this.database_password = database_password;
	}
	@Override
	public String toString() {
		return "DatabaseTbale [database_id=" + database_id + ", database_name="
				+ database_name + ", database_password=" + database_password
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
