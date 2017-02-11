package com.dts.crsm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.CoreList;
import com.dts.core.util.LoggerManager;
import com.dts.crsm.model.Stock;

public class StockDAO extends AbstractDataAccessObject{

	public Connection con;
	private Stock stock;
	private StockAuditDAO iadao;
	
	public StockDAO() 
	{
		
		iadao = new StockAuditDAO();
	}
	
	// Add new Stock
	
    public boolean addStock(Stock stock)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("insert into STOCK values(?,?,?,?)");
    		
    		pst.setInt(1, stock.getCategoryID());
    		pst.setInt(2, stock.getMedicineID());
    		pst.setInt(3, stock.getQuantity());
    		pst.setDouble(4, stock.getPrice());
    		    		
    		if(pst.executeUpdate()>0)
    		{
    			flag = true;
    			iadao.stockAudit( stock, "New Stock Added",1,con);
    		}
    	}
    	catch(SQLException se)
    	{
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
    			con.close();
    		}
    		catch(SQLException se)
    		{
    			LoggerManager.writeLogWarning(se);
    		}
    	}
    	return flag;
    }
    
// Update Stock
	
    public boolean updateStock(Stock stock)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("update STOCK set quantity=(quantity+?),price=? where  categoryid=? and medicineid=?");
    		pst.setInt(1, stock.getQuantity());
    		pst.setDouble(2, stock.getPrice());
    		 		
    		pst.setInt(3, stock.getCategoryID());	
    		pst.setInt(4, stock.getMedicineID());
    		    		if(pst.executeUpdate()>0)
    		{
    			flag = true;
    			iadao.stockAudit(stock, "Stock Modified",1,con);
    		}
    		else
    			flag = false;
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
    	return flag;
    }
    
// Delete Stock
	
    public boolean deleteStock(Stock stock)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("delete from STOCK  where  categoryid=? and medicineid=?");
    		
    			
    		pst.setInt(1, stock.getCategoryID());	
    		pst.setInt(2, stock.getCompanyID());
    		
    		if(pst.executeUpdate()>0)
    		{
    			flag = true;
    			iadao.stockAudit(stock, "Stock Deleated",2,con);
    		}
    		else
    			flag = false;
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
    	return flag;
    }
// Update Stock by orderid
	
    public boolean updateStock(int orderid)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		con.setAutoCommit(false);
    		PreparedStatement pst1 = con.prepareStatement("select  categoryid, medicineid, quantity from medicineorder where orderid=?");
    		PreparedStatement pst = con.prepareStatement("update STOCK set quantity=(quantity+?) where   categoryid=? and medicineid=?");
    		pst1.setInt(1, orderid);
    		
    		ResultSet rs = pst1.executeQuery();
    		while(rs.next())
    		{   
    			 		
    			pst.setInt(3, rs.getInt(2));	
    			pst.setInt(2, rs.getInt(1));
    			pst.setInt(1, rs.getInt(3)); 
    		     
    			if(pst.executeUpdate()>0)
    			{
    				flag = true;
    				iadao.stockAudit(stock, "Quantity Updated",1,con);
    			}
    			else
    			{
    				flag = false;
    				break;
    			}
    		}
    	}
       	catch(SQLException se)
    	{se.printStackTrace();
       		flag = false;
    		LoggerManager.writeLogWarning(se);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		flag = false;
    		LoggerManager.writeLogWarning(e);
    	}
    	finally
    	{
    		try
    		{
    			if(flag)
    				con.commit();
    			else
    				con.rollback();	
    			con.close();
    		}
    		catch(SQLException se)
    		{
    			LoggerManager.writeLogWarning(se);
    		}
    	}
    	return flag;
    }
    
    
//list Category by Company
    
    public CoreHash listCategorybyCompany(int companyid)
	{
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		int categoryid;
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from stock where Companyid="+companyid);
			while(rs.next())
			{				
				aCoreHash.put(new Integer(rs.getInt(1)), rs.getString(2));
			}
		} 
		catch (SQLException e)
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
    
    
//list items by Company and category
    
    public CoreHash listMedicinebyCompanyCategory(String categoryid)
	{
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select i.medicineid, i.medicinename from medicine i where i.categoryid="+categoryid);
			while(rs.next())
			{				
				aCoreHash.put(new Integer(rs.getInt(1)), rs.getString(2));
			}
		} 
		catch (SQLException e)
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
    
    
    
// List Stock By Company
	
    public CoreList StockByCompany(int companyid)
    {
    	CoreList aCoreList = new CoreList();
		aCoreList.clear();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			int count = 0;
			ResultSet rs = st.executeQuery("select * from STOCK where companyid="+companyid+" order by companyid");
			while(rs.next())
			{
				stock = new Stock();
				stock.setCompanyID(rs.getInt(1));
				stock.setCategoryID(rs.getInt(2));
				stock.setMedicineID(rs.getInt(3));
				stock.setQuantity(rs.getInt(4));
				stock.setPrice(rs.getDouble(5));
				
				count++;
				aCoreList.add(stock);
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
    	return aCoreList;
    }
    
    
// List Stock By Category
	
    public CoreList StockByCategory(int categoryid)
    {
    	CoreList aCoreList = new CoreList();
		aCoreList.clear();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			int count = 0;
			ResultSet rs = st.executeQuery("select * from STOCK where categoryid="+categoryid+" ");
			while(rs.next())
			{
				stock = new Stock();
				//stock.setBrandID(rs.getInt(1));
				stock.setCategoryID(rs.getInt(1));
				stock.setMedicineID(rs.getInt(2));
				stock.setQuantity(rs.getInt(3));
				stock.setPrice(rs.getDouble(4));
				
				count++;
				aCoreList.add(stock);
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
    	return aCoreList;
    } 
    
    
// List Stock By Medicine
	
    public CoreList StockByMedicine(int medicineid)
    {
    	CoreList aCoreList = new CoreList();
		aCoreList.clear();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			int count = 0;
			ResultSet rs = st.executeQuery("select * from STOCK where medicineid="+medicineid+" order by companyid");
			while(rs.next())
			{
				stock = new Stock();
				stock.setCompanyID(rs.getInt(1));
				stock.setCategoryID(rs.getInt(2));
				stock.setMedicineID(rs.getInt(3));
				stock.setQuantity(rs.getInt(4));
				stock.setPrice(rs.getDouble(5));
				
				count++;
				aCoreList.add(stock);
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
    	return aCoreList;
    } 
    
    
    //list Search Stock
    public CoreHash searchStock(int categoryid, int medicineid)
    {
    	CoreHash aCoreHash = new CoreHash();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			int count = 0;
			String query="select * from STOCK where ";
			
			if(categoryid!=0)
			{
				query+=" categoryid="+categoryid;
				count=1;
			}
			if(count==1 && medicineid!=0)
			{
				query+=" and ";
				count=0;
			}
			if(medicineid!=0)
			{
				query+="medicineid="+medicineid;
			}
			System.out.println(query);
			ResultSet rs = st.executeQuery(query);
			count=0;
			while(rs.next())
			{
				stock = new Stock();
				//stock.setBrandID(rs.getInt(1));
				stock.setCategoryID(rs.getInt(1));
				stock.setMedicineID(rs.getInt(2));
				stock.setQuantity(rs.getInt(3));
				stock.setPrice(rs.getDouble(4));
				
				count++;
				aCoreHash.put(new Integer(count),stock);
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
    
    
    //get price by stock
    public Stock getStock(int categoryid, int medicineid)
    {
    	CoreHash aCoreHash = new CoreHash();
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			int count = 0;
			String query="select * from STOCK where   categoryid="+categoryid+" and medicineid="+medicineid+"";
			ResultSet rs = st.executeQuery(query);
			count=0;
			if(rs.next())
			{
				stock = new Stock();
				stock.setCategoryID(rs.getInt(1));
				stock.setMedicineID(rs.getInt(2));
				stock.setQuantity(rs.getInt(3));
				stock.setPrice(rs.getDouble(4));
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
    	return stock;
    }
    
}
