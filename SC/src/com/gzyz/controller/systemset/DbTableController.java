package com.gzyz.controller.systemset;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.systemset.DatabaseTable;
import com.gzyz.service.systemset.SystemSetService;

@Controller
public class DbTableController {

	@Autowired
	private SystemSetService systemSetService;
	
	@RequestMapping("queryDbBackups")
	/*@ResponseBody*/
	public String queryDbBackups(DatabaseTable databaseTable,
			String name,String password,
			String host,String dbname,String db2name,
			HttpServletRequest request){
		
		System.out.println("1231");
		DataBackupsAndRecover dataBackupsAndRecover = new DataBackupsAndRecover(); 
		
		name =  request.getParameter("db_name");
		password = request.getParameter("db_pwd");
		
		host = request.getParameter("db_host");
		dbname = request.getParameter("db_dbname");
		db2name = request.getParameter("db_db2name");
		
		databaseTable.setDatabase_name(name);
		
		System.out.println(databaseTable);
		
		DatabaseTable dbtable = systemSetService.findDatabaseTable(databaseTable);
		
		String t1 = dbtable.getDatabase_password();
		
		System.out.println(t1);
		
		if(password.equals(t1)){
			System.out.println("12312");
			dataBackupsAndRecover.dataBackups(host ,name ,password ,dbname ,db2name);
			return "forward:/JSP/HT/system/success.jsp";
		}
		 
		return "forward:/JSP/HT/system/false.jsp";
		
	}
	
	@RequestMapping("queryDbRecover")
	/*@ResponseBody*/
	public String queryDbRecover(DatabaseTable databaseTable,
			String name,String password,
			String host,String dbname,String db2name,
			HttpServletRequest request){
		
		System.out.println("1231");
		DataBackupsAndRecover dataBackupsAndRecover = new DataBackupsAndRecover(); 
		
		name =  request.getParameter("db_name"); 
		password = request.getParameter("db_pwd");
		
		host = request.getParameter("db_host");
		dbname = request.getParameter("db_dbname");
		db2name = request.getParameter("db_db2name"); 
		
		databaseTable.setDatabase_name(name);
		
		System.out.println(databaseTable); 
		
		DatabaseTable dbtable = systemSetService.findDatabaseTable(databaseTable);
		
		String t1 = dbtable.getDatabase_password();
		
		if(password.equals(t1)){
			dataBackupsAndRecover.dataRecover(host, name, password, dbname, db2name);
			return "forward:/JSP/HT/system/success.jsp";
		}
		
		return "forward:/JSP/HT/system/false.jsp";
		
	}
}
