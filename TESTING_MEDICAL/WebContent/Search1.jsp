<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.crsm.dao.*,com.dts.crsm.model.*,com.dts.core.util.*,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <form id="form2" method="post" action="SearchResult.jsp" name="search" onSubmit="javascript:if(document.search.companyid.value=='' && document.search.categoryid.value==''&& document.search.medicineid.value==''){alert('select Any Search Criteria');}">
    <table width="155" border="0">
  <tr>
    <td width="41" height="24">
      <div align="left">Company</div>
   </td>
    <td width="120"><div align="left">
      <select name="companyid" id="select" >
        <option>--Select--</option>
        <%
		  		try
		  		{
		  		   CoreHash bCoreHash = new CompanyDAO().listCompanyNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int companyid1 = 0;
		  		   int companyid = 0;
		  		   if(request.getParameter("companyid")!=null)
		  		   {
		  		      try
		  		      {
		  		    	companyid1 = Integer.parseInt(request.getParameter("companyid"));
		  		      }
		  		      catch(Exception e){}   		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  			 companyid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(companyid==companyid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=companyid%>" <%=select%>><%=bCoreHash.get(new Integer(companyid))%></option>  		 
           <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  %>
      </select>
    </div></td>
  </tr>
  <tr>
    <td height="24">
      <div align="left">Category</div>
   </td>
    <td><div align="left">
      <select name="categoryid" id="select" onChange="javascript: location.href='#?categoryid='+document.search.categoryid.value+'&companyid='+document.search.companyid.value;">
        <option>--Select--</option>
        <%
		  		try
		  		{
		  		   CoreHash bCoreHash = new CategoryDAO().listCategoryNames();
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int categoryid1 = 0;
		  		   int categoryid = 0;
		  		   if(request.getParameter("categoryid")!=null)
		  		   {
		  		    try
		  		      {
		  		        categoryid1 = Integer.parseInt(request.getParameter("categoryid")); 
		  		      }
		  		      catch(Exception e){} 		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  		   		categoryid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(categoryid==categoryid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=categoryid%>" <%=select%>><%=bCoreHash.get(new Integer(categoryid))%></option>
        <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  %>
      </select>
    </div></td>
  </tr>
  <tr>
    <td height="24">
      <div align="left">Medicine</div>
    </td>
    <td><div align="left">
      <select name="medicineid" id="select" >
        <option>--Select--</option>
        <%
             if(request.getParameter("categoryid")!=null)
             {
		  		try
		  		{
		  		   CoreHash bCoreHash = new MedicineDAO().listMedicineByCategory(Integer.parseInt(request.getParameter("categoryid")));
		  		   Enumeration enu = bCoreHash.keys();
		  		   String select = "";
		  		   int medicineid1 = 0;
		  		   int medicineid = 0;
		  		   if(request.getParameter("medicineid")!=null)
		  		   {
		  		   try
		  		      {
		  			 medicineid1 = Integer.parseInt(request.getParameter("medicineid"));
		  		      }
		  		      catch(Exception e){} 
		  		         		    
		  		   }
		  		   while(enu.hasMoreElements())
		  		   {
		  			 medicineid = Integer.parseInt(enu.nextElement().toString());
		  		   		select = "";
		  		   		if(medicineid==medicineid1)
		  		   		    select = "selected";
		  		   		
		  		   %>
        <option value="<%=medicineid%>" <%=select%>><%=((Medicine)bCoreHash.get(new Integer(medicineid))).getMedicineName()%></option>  		 
           <%}
		  		}
		  		catch(Exception e)
		  		{
		  		   LoggerManager.writeLogWarning(e);
		  		}
		  		}
		  %>
      </select>
    </div></td>
  </tr>
  <tr>
    <td colspan="2">        
      <div align="center">
        <input id="inputsubmit2" type="submit" name="inputsubmit2" value="Search" class="button" />        
        </div></td>
    </tr>
</table>

	<p align="center" class="tiny">&nbsp;</p>
					</form>

  </body>
</html>
