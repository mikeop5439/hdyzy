package com.gzyz.controller.systemset;

import java.io.IOException;

import org.junit.Test;

public class DataBackupsAndRecover {
	
	@Test
	public void dataBackups(String host,String name,String pasword,String dbname,String db2name){
		
		String command = "mysqldump -h"+host+" -u"+name+" -p"+pasword+dbname+" > "+db2name+".sql ";
		try {
			Runtime.getRuntime().exec(command);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void dataRecover(String host,String name,String pasword,String dbname,String db2name){
		String command = "mysqldump -h"+host+" -u"+name+" -p"+pasword+dbname+" < "+db2name+".sql ";
		try {
			Runtime.getRuntime().exec(command);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
