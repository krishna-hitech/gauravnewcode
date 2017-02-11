package com.dts.crsm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.DateWrapper;
import com.dts.core.util.LoggerManager;
import com.dts.crsm.model.Stock;

public class StockAuditDAO extends AbstractDataAccessObject{

	public Connection con;
	public Stock stock;
	public String dbname;
	public String pattern;
	
	public StockAuditDAO() 
	{
		con=getConnection();
		dbname = getProperties().getProperty("dbname");
		if(dbname.equals("access"))
			pattern = "#"; 
	}
	
	// Add new Stock
	
    public boolean stockAudit(Stock stock,String comments, int mode,Connection con1)
    {
    	boolean flag = false;
    	PreparedStatement pst = null;
    	try
    	{
    		pst = con1.prepareStatement("insert into STOCKAUDIT values(?,?,?,?,?)");
    		
    		pst.setInt(1, stock.getCategoryID());
    		pst.setInt(2, stock.getMedicineID());
    		pst.setString(3, DateWrapper.parseDate(new Date()));
    		pst.setInt(4, mode);
    		
    		pst.setString(5, comments);
    		
    		if(pst.executeUpdate()>0)
    			flag = true;
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    		LoggerManager.writeLogWarning(se);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		LoggerManager.writeLogWarning(e);
    	}
    	finally
    	{
    		try
    		{
    			pst.close();
    		}
    		catch(SQLException se)
    		{
    			LoggerManager.writeLogWarning(se);
    		}
    	}
    	return flag;
    }
    

    // List Stock Audit By Date
	
    public CoreHash stockAuditbyDate(String auditdate)
    {
    	CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			int count = 0;
			ResultSet rs = st.executeQuery("select * from STOCKAUDIT where ModifiedDate="+pattern+auditdate+pattern);
			while(rs.next())
			{
				stock = new Stock();
				stock.setCompanyID(rs.getInt(1));
				stock.setCategoryID(rs.getInt(2));
				stock.setMedicineID(rs.getInt(3));
				stock.setQuantity(rs.getInt(4));
				stock.setPrice(rs.getDouble(5));
				stock.setVat(rs.getDouble(6));
				
				count++;
				aCoreHash.put(new Integer(count), stock);
			}	
    	}
    	catch(SQLException se)
    	{
    		LoggerManager.writeLogWarning(se);
    	}
    	catch(Exception e)
    	{
    		LoggerManager.writeLogWarning(e);
    	}
    	finally
    	{
    		try
    		{
    			con.close();
    		}
    		catch(SQLException se)
    		{
    			LoggerManager.writeLogWarning(se);
    		}
    	}
    	return aCoreHash;
    }
 
}
