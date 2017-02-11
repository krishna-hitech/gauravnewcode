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
import com.dts.crsm.model.Medicine;

public class MedicineDAO extends AbstractDataAccessObject{

	public Connection con;
	public Medicine medicine;
	public MedicineDAO() 
	{
		
	}
	
	// Add new Medicine
    public boolean addMedicine(Medicine medicine)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		int id = getSequenceID("MEDICINE","medicineid");
    		PreparedStatement pst = con.prepareStatement("insert into MEDICINE values(?,?,?,?)");
    		pst.setInt(1, id);
    		pst.setInt(2, medicine.getCategoryID());
    		pst.setString(3, medicine.getMedicineName());
    		pst.setString(4, medicine.getMedicineDesc());
    		
    		if(pst.executeUpdate()>0)
    			flag = true;
    		if(flag)
    		{
    			//new StockDAO().addInventory(stock)
    		}
    	}
    	catch(Exception se)
    	{
    		se.printStackTrace();
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
    
 // Update Medicine
    public boolean updateMedicine(Medicine medicine)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		int id = medicine.getMedicineID();
    		
    		PreparedStatement pst = con.prepareStatement("update Medicine set categoryid=?,medicinename=?,medicinedesc=? where medicineid=?");
    		
    		pst.setInt(1, medicine.getCategoryID());    		
    		pst.setString(2, medicine.getMedicineName());
    		pst.setString(3, medicine.getMedicineDesc());
    		pst.setInt(4, id);
    		
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
    
 // delete Medicine
    public boolean deleteMedicine(int medicineid)
    {
    	boolean flag = false;
    	try
    	{
    		con=getConnection();
    		PreparedStatement pst = con.prepareStatement("delete from MEDICINE  where medicineid=?");
    		
    		pst.setInt(1, medicineid);
    		
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
    
    
    //list Medicine
    
    public CoreList listMedicine()
	{
    	
		CoreList aCoreList = new CoreList();
		aCoreList.clear();
		int medicineid;
		Statement st;
		try 
		{
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select i.MEDICINEID,i.CATEGORYID,i.MEDICINENAME,i.MEDICINEDESC,c.CATEGORYNAME from MEDICINE i,CATEGORY c where i.CATEGORYID=c.ID order by i.MEDICINEID");
			while(rs.next())
			{
				medicineid = rs.getInt(1);
				medicine = new Medicine();
				medicine.setMedicineID(medicineid);
				medicine.setCategoryID(rs.getInt(2));
				medicine.setMedicineName(rs.getString(3));
				medicine.setMedicineDesc(rs.getString(4));
				medicine.setCategoryName(rs.getString(5));
				
				
				aCoreList.add(medicine);
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
		return aCoreList;
	}
    
    
 //list Medicine Name
    
    public CoreHash listMedicineNames()
	{
    	
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		int medicineid;
		Statement st;
		try 
		{
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from MEDICINE order by categoryid");
			while(rs.next())
			{
				aCoreHash.put(new Integer(rs.getInt(1)), rs.getString(3));
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
		return aCoreHash;
	}
    
    
    
//edit Medicine
    
    public Medicine editMedicine(int medicineid)
	{
		
		Statement st;
		try 
		{
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from medicine where medicineid="+medicineid);
			if(rs.next())
			{
				medicineid = rs.getInt(1);
				medicine = new Medicine();
				medicine.setMedicineID(medicineid);
				medicine.setCategoryID(rs.getInt(2));
				medicine.setMedicineName(rs.getString(3));
				medicine.setMedicineDesc(rs.getString(4));
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
		return medicine;
	}
    
//list Items by category
    
    public CoreHash listMedicineByCategory(int categoryid)
	{
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		int medicineid;
		Statement st;
		try 
		{
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from MEDICINE where categoryid="+categoryid);
			while(rs.next())
			{
				medicineid = rs.getInt(1);
				medicine = new Medicine();
				medicine.setMedicineID(medicineid);
				medicine.setCategoryID(rs.getInt(2));
				medicine.setMedicineName(rs.getString(3));
				medicine.setMedicineDesc(rs.getString(4));

				aCoreHash.put(new Integer(medicineid), medicine);
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
		return aCoreHash;
	}
}
