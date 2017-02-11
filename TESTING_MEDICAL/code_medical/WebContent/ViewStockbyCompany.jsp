<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.dao.MedicineDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.crsm.model.Category, com.dts.crsm.dao.CategoryDAO,com.dts.core.util.CoreList"%>
<%@  page import="com.dts.crsm.model.Company, com.dts.crsm.dao.CompanyDAO,com.dts.crsm.model.Stock, com.dts.crsm.dao.StockDAO"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Medical Store System</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {color: #000000}
.style7 {color: #3F007D; font-size: x-small; }
.style8 {color: #000000; font-weight: bold; }
-->
</style>
<script language="javascript" src="scripts/general.js"></script>
</head>
<body>
<div id="logo">
	<h1><jsp:include page="header.html"/></h1>
	
</div>
<div id="menu">
	<ul>
	 
	 <jsp:include page="Adminoptions.jsp"/>
	 
	</ul>
</div>
<div id="wrapper">
  <div id="col-two1">
	  <div class="boxed">
		<h2 class="title">Welcome to CSM</h2>
      
			<h3 align="right">
	    <a align="right"><script language="JavaScript" type="text/javascript">
      </script></a></h3>
<div class="content">
  <table width="654" border="0">
<tr>
                    <td width="648">
	  <fieldset>
					<legend><span class="style3">View Stock by Company</span></legend>
  <br /> 
  <form id="form1" method="post" action="ViewStockbyCompany.jsp?header=<%=request.getParameter("header")%>" name="stock">
    <table width="200" border="0" align="center">
      <tr>
        <td width="94"><span class="style3"><strong>Company Name</strong></span></td>
        <td width="90"><label>
          <select name="companyid" id="select" onchange="javascript:if(document.stock.companyid.value==''){alert('select Any Company');}else{ document.stock.submit();}">
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
		  		        companyid1 = Integer.parseInt(request.getParameter("companyid")); 		    
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
        </label></td>
      </tr>
    </table>
    </form>
  <br />
  <%
        if(request.getParameter("companyid")!=null) 
        {
    %>
      <form name="f" method="post" action="UDStockAction.jsp">
      <input type="hidden" name="page" value="ViewStockbyCompany.jsp"/>
      <input type="hidden" name="type" value="companyid"/>
      <input type="hidden" name="value" value="<%=request.getParameter("companyid")%>"/>
    <table width="" border="0" align="center" bordercolor="#8692E3">
    
      <tr bgcolor="#509C16">
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList inCoreList = new CoreList();
	      CoreHash bCoreHash = new CoreHash();
	      CoreHash cCoreHash = new CoreHash();
	      CoreHash iCoreHash = new CoreHash();
	      
	     try{
             int categoryid = 0;
             int medicineid = 0;
             MedicineDAO medicinedao = new  MedicineDAO();
             CategoryDAO categorydao = new CategoryDAO();
             CompanyDAO companydao = new CompanyDAO();
             StockDAO stockdao = new StockDAO(); 
             
             inCoreList = stockdao.StockByCompany(Integer.parseInt(request.getParameter("companyid")));
             iCoreHash = medicinedao.listMedicineNames(); 
             cCoreHash = categorydao.listCategoryNames(); 
             bCoreHash = companydao.listCompanyNames();
             
             Stock stock = new Stock();
             
             if(!inCoreList.isEmpty())
         	{
         if(header.equals("list") && role.equals("admin"))
         {
       %>
        <td width="18"><div align="center">
          
          <!-- <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/> -->    
        
        </div></td>
        <%
        	}
        %>
        <td width="103"><div align="center" class="style8">Company</div></td>
        <td width="110"><div align="center" class="style8">Category</div></td>
        <td width="87"><div align="center" class="style8">Medicine</div></td>
        <td width="64"><div align="center" class="style8">Quantity</div></td>
        <td width="196"><div align="center" class="style8">Price/Item</div></td>
         <%
	  if(header.equals("list"))
	  {
	 %>
        <td width="255"><div align="center" class="style8">New Quantity</div></td>
        <td width="236"><div align="center" class="style8">New Price</div></td>
        <%} %>
      </tr>
          <%
          	Enumeration enu = inCoreList.elements();
          	int quantity = 0;
          	double price = 0;
          			Medicine medicine;
          			int i=0;
          			while (enu.hasMoreElements()) {
          				stock = (Stock) enu.nextElement();
          				medicineid = stock.getMedicineID();
          				categoryid = stock.getCategoryID();
          				quantity = stock.getQuantity();
						price = stock.getPrice();
          		         		
          %>
      <tr bgcolor="#CEC9FA">
      <%
      	String flag = "false";
      				if (header.equals("list")) {
      					flag = "true";
      %>
        <td bgcolor="#C3D7BA"><input name="ch<%=i%>" type="checkbox" id="checkbox2" value="<%=request.getParameter("medicineid")%>,<%=categoryid%>,<%=medicineid%>"/></td> <%
 	}
 %> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=bCoreHash.get(new Integer(request.getParameter("brandid")))%></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=cCoreHash.get(new Integer(categoryid))%></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=iCoreHash.get(new Integer(medicineid))%></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=quantity%></span></div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=price%></span></div></td>
         <%
	  if(header.equals("list"))
	  {
	 %>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style3"><strong>+</strong></span>
              <input name="quantity<%=i%>" type="text" value="<%=quantity%>" size="10" />
        </div></td>
       
        <td bgcolor="#C3D7BA"><div align="center">
              <input name="price<%=i%>" type="text" value="<%=price%>" size="10" />
        </div></td>
         <%} %>
      </tr>
      <%i++;
      	}%> <input type="hidden" name="count" value="<%=i%>"/>
      		<%} else {
      %>
         <tr><td height="24" colspan="8"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	if (header.equals("list")) {
      %>
      <tr>
        <td colspan="8"><div align="center">
         
          <input type="button" name="button" id="button" value="Add New" onClick="javascript:location.href='DispatchController?page=AddNewStock.jsp'"/>
          &nbsp;
          <%if(!inCoreList.isEmpty())
         	{ %>
          <input type="submit" name="button" id="button2" value="Update"/>  &nbsp; &nbsp;<input type="submit" name="button" id="button2" value="Delete"/>
          <%} %>
        </div></td>
      </tr>
       <%
       	}
       %>
    </table>
   
  </form>
  <%} %>
					</fieldset>
				
			
		      </td>
          </tr>
                </table>
</div>
	  </div>
		
	</div>
</div>
<div id="footer">
	
</div>
</body>
</html>
