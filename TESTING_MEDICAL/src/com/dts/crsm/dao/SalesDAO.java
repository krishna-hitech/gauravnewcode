package com.dts.crsm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.DateWrapper;
import com.dts.core.util.LoggerManager;
import com.dts.crsm.model.Stock;
import com.dts.crsm.model.Sales;

public class SalesDAO extends AbstractDataAccessObject{

	public Connection con;
	private Sales sales;
	private StockAuditDAO iadao;
	private StockDAO stockdao;
	
	public SalesDAO()
	{
		con = getConnection();
		iadao = new StockAuditDAO();
	}
   
	// place total sales
	public boolean placeTotalSales(Sales sales, CoreHash aCoreHash)
	{
		boolean flag = false;
		try
		{
			con.setAutoCommit(false);
			int salesid = getSequenceID("TOTALSALES", "SOLD");
			String loginname = sales.getLoginname();
			double totalamt = sales.getTotalamount();
			String salesdate = sales.getSalesDate();
			String status = sales.getStatus();
			
			PreparedStatement pst = con.prepareStatement("insert into TOTALSALES(SOLD,LoginName,SaleDate,TotalAmount,status) values(?,?,?,?,?)");
			
			pst.setString(2, loginname);
			pst.setInt(1, salesid);
			pst.setDouble(4, totalamt);
			pst.setString(3, salesdate);
			pst.setString(5, status);
			
			if(pst.executeUpdate()>0)
			{
				System.out.println("this is hello order");
				flag = placeMedicineSales(salesid,aCoreHash);
			}
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
				if(flag)
					con.commit();
				else
					con.rollback();
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return flag;
	}

	//place Medicine Order
	
	private boolean placeMedicineSales(int salesid, CoreHash aCoreHash)
	{
		boolean flag = false;
		Stock stock = new Stock();
		try
		{
		   PreparedStatement pst = con.prepareStatement("insert into MEDICINESALES values(?,?,?,?,?)");
		   PreparedStatement pst1 = con.prepareStatement("update stock set quantity=(quantity-?) where  categoryid=? and medicineid=?");
		   
		   Enumeration enu = aCoreHash.elements();
		   while(enu.hasMoreElements())
		   {
			   sales = (Sales)enu.nextElement();
			   pst.setInt(1, salesid);
			   
			   pst.setInt(2, sales.getCategoryid());
			   pst.setInt(3, sales.getMedicineid());
			   pst.setInt(4, sales.getQuantity());
			   pst.setDouble(5, sales.getPrice());
			   
			   pst1.setInt(1, sales.getQuantity()); 
			  
			   pst1.setInt(2, sales.getCategoryid());
			   pst1.setInt(3, sales.getMedicineid());
			   
			   //stock.setCompanyID(sales.getCompanyid());
			   stock.setCategoryID(sales.getCategoryid());
			   stock.setMedicineID(sales.getMedicineid());
			   int n=pst.executeUpdate();
			  int n1= pst1.executeUpdate();
			  System.out.println("this is n"+n+"This is n1"+n1);
			   if(n>0 && n1>0 && iadao.stockAudit(stock, sales.getQuantity()+"Quantity deducted",2,con))
			   {
				   flag = true;
				   System.gc();
			   }
			   else
			   {
				   flag = false;
				   break;
			   }
		   }
		}
		catch(Exception e)
		{
			e.printStackTrace();
			flag = false;
			LoggerManager.writeLogWarning(e);
		}		
		return flag;
	}
	
	//List Sales
	public CoreHash listSales(String fromdate, String todate)
	{
		CoreHash aCoreHash = new CoreHash();
		String dbname = getProperties().getProperty("dbname");
		String pattern ="";
		if(dbname.equals("access"))
			pattern = "#"; 
		 
		try
		{
		   Statement st = con.createStatement();
		   ResultSet rs = st.executeQuery("select * from TOTALSALES where salesdate>="+pattern+fromdate+pattern+" and salesdate<="+pattern+todate+pattern);
		   int salesid = 0;
		   while(rs.next())
		   {
			   sales = new Sales();
			   salesid = rs.getInt(1);
			   sales.setSalesID(salesid);
			   sales.setLoginname(rs.getString(2));
			   sales.setSalesDate1(rs.getDate(3));
			   sales.setTotalamount(rs.getDouble(4));
			   sales.setStatus(rs.getString(5));
			  
		      aCoreHash.put(new Integer(salesid), sales);	  
		   }
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
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	//List Sales
	public CoreHash listSales1(String salesdate)
	{
		CoreHash aCoreHash = new CoreHash();
		String dbname = getProperties().getProperty("dbname");
		String pattern ="";
		if(dbname.equals("oracle"))
			//pattern = "#"; 
		 
		try
		{
		   Statement st = con.createStatement();
		   ResultSet rs = st.executeQuery("select * from TOTALSALES where salesdate='"+salesdate+"'");
		   int salesid = 0;
		   while(rs.next())
		   {
			   System.out.println("in while");
			   sales = new Sales();
			   salesid = rs.getInt(1);
			   sales.setSalesID(salesid);
			   sales.setLoginname(rs.getString(2));
			   sales.setSalesDate1(rs.getDate(3));
			   sales.setTotalamount(rs.getDouble(4));
			   sales.setStatus(rs.getString(5));
			  
		      aCoreHash.put(new Integer(salesid), sales);	  
		   }
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
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	//List Sales
	public CoreHash listSales(String loginname)
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
		   Statement st = con.createStatement();
		   ResultSet rs = st.executeQuery("select * from TOTALSALES where loginname='"+loginname+"' Order by Salesdate desc");
		   int salesid = 0;
		   while(rs.next())
		   {
			   sales = new Sales();
			   salesid = rs.getInt(1);
			   sales.setSalesID(salesid);
			   sales.setLoginname(rs.getString(2));
			   sales.setSalesDate1(rs.getDate(3));
			   sales.setTotalamount(rs.getDouble(4));
			   sales.setStatus(rs.getString(5));
			  
		      aCoreHash.put(new Integer(salesid),sales);	  
		   }
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
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	//List Sales
	public CoreHash listSalesOfAllUser(String logintype)
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
		   Statement st = con.createStatement();
		   ResultSet rs = st.executeQuery("select t.SOLD,t.LOGINNAME,t.SALESDATE,t.TOTALAMOUNT,t.STATUS from TOTALSALES t,logindetails ld where ld.loginname=t.loginname and ld.logintype='"+logintype+"' Order by t.Salesdate desc");
		   int salesid = 0;
		   while(rs.next())
		   {
			   sales = new Sales();
			   salesid = rs.getInt(1);
			   sales.setSalesID(salesid);
			   sales.setLoginname(rs.getString(2));
			   sales.setSalesDate1(rs.getDate(3));
			   sales.setTotalamount(rs.getDouble(4));
			   sales.setStatus(rs.getString(5));
			  
		      aCoreHash.put(new Integer(salesid), sales);	  
		   }
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
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	//List Sales Items
	public CoreHash listSalesDetails(int salesid)
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
		   Statement st = con.createStatement();
		   ResultSet rs = st.executeQuery("select * from MEDICINESALES where Salesid="+salesid);
		   int i=0;
		   while(rs.next())
		   {
			   sales = new Sales();
			   salesid = rs.getInt(1);
			  
			   sales.setCategoryid(rs.getInt(2));
			   sales.setMedicineid(rs.getInt(3));
			   sales.setQuantity(rs.getInt(4));
			   sales.setPrice(rs.getDouble(5));
			  
		      aCoreHash.put(new Integer(i++), sales);	  
		   }
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
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	
	
	//update Sales status
	
	public boolean updateSalesStatus(int salesid, int statusid)
	{
		boolean flag = false;
		try
		{
			String status = "Rejected";
			con.setAutoCommit(false);
			PreparedStatement pst = con.prepareStatement("update totalsales set status=? where sold=?");
			
			if( statusid == 2)
			{
				if(new StockDAO().updateStock(salesid)) 
				{
					status = "Rejected";
					pst.setString(1, status);
					pst.setInt(2, salesid);
		       	
					pst.executeUpdate();
					con.commit();
					flag = true;
				}
			}
			else if(statusid == 1)
			{
	        	status = "Accepted";
	        	pst.setString(1, status);
		       	pst.setInt(2, salesid);
		       	
	        	pst.executeUpdate();
	        	con.commit();
	        	flag = true;
			}
	        else
	        {
	        	con.rollback();
	        	flag = false;
	        }
		}
		catch(Exception e)
		{
			try
			{
				con.rollback();
				flag = false;
			}
			catch(Exception ex)
			{
				LoggerManager.writeLogWarning(ex);
			}
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return flag;
	}
}
