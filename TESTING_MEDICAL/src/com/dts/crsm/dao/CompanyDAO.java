package com.dts.crsm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dts.core.dao.AbstractDataAccessObject;
import com.dts.core.util.CoreHash;
import com.dts.core.util.LoggerManager;
import com.dts.crsm.model.Company;

public class CompanyDAO extends AbstractDataAccessObject{

	public Connection con;
	public Company company;
	public CompanyDAO() 
	{
		
	}
	
	// Add new Company
    public boolean addCompany(Company company)
    {
    	boolean flag = false;
    	try
    	{
    		int id = getSequenceID("COMPANY","companyid");
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("insert into COMPANY values(?,?,?,?,?)");
    		pst.setInt(1, id);
    		pst.setString(2, company.getCompanyName());
    		pst.setString(3, company.getCompanyAdd());
    		pst.setString(4, company.getCompanyContact());
    		pst.setString(5, company.getCompanyEmail());
    		if(pst.executeUpdate()>0)
    			flag = true;
    	}
    	catch(SQLException se)
    	{
    		LoggerManager.writeLogWarning(se);
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
    
 // Update Company
    public boolean updateCompany(Company company)
    {
    	boolean flag = false;
    	try
    	{
    		int id = company.getCompanyID();
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("update COMPANY set companyName=?,companyAdd=?,companyContact=?,companyEmail=? where companyid=?");
    		
    		pst.setString(1, company.getCompanyName());
    		pst.setString(2, company.getCompanyAdd());
    		pst.setString(3, company.getCompanyContact());
    		pst.setString(4, company.getCompanyEmail());
    		pst.setInt(5, id);
    		
    		if(pst.executeUpdate()>0)
    			flag = true;
    	}
    	catch(SQLException se)
    	{
    		LoggerManager.writeLogWarning(se);
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
    
 // Delete Company
    public boolean deleteCompany(int companyid)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("delete from COMPANY  where companyID=?");
    		
    		pst.setInt(1, companyid);
    		
    		if(pst.executeUpdate()>0)
    			flag = true;
    	}
    	catch(SQLException se)
    	{
    		LoggerManager.writeLogWarning(se);
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
    
    
    //list Company
    
    public CoreHash listCompany()
	{
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		int companyid;
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from COMPANY order by companyID");
			while(rs.next())
			{
				companyid = rs.getInt(1);
				company = new Company();
				company.setCompanyID(companyid);
				company.setCompanyName(rs.getString(2));
				company.setCompanyAdd(rs.getString(3));
				company.setCompanyContact(rs.getString(4));
				company.setCompanyEmail(rs.getString(5));
				aCoreHash.put(new Integer(companyid), company);
			}
			
			con.close();
		} catch (SQLException e) {
			LoggerManager.writeLogWarning(e);
		}
        
		return aCoreHash;
	}
    
    
//list Company names
    
    public CoreHash listCompanyNames()
	{
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		int companyid;
		Statement st;
		try {
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from COMPANY order by companyid");
			while(rs.next())
			{
				companyid = rs.getInt(1);
						
				aCoreHash.put(new Integer(companyid), rs.getString(2));
			}
			
			con.close();
		} catch (SQLException e) {
			LoggerManager.writeLogWarning(e);
		}
        
		return aCoreHash;
	}
   
    
//edit Company
    
    public Company editCompany(int companyid)
	{
		
		Statement st;
		try 
		{
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from COMPANY where companyid="+companyid);
			if(rs.next())
			{
				companyid = rs.getInt(1);
				company = new Company();
				company.setCompanyID(companyid);
				company.setCompanyName(rs.getString(2));
				company.setCompanyAdd(rs.getString(3));
				company.setCompanyContact(rs.getString(4));
				company.setCompanyEmail(rs.getString(5));
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
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return company;
	}
}
