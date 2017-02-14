<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.dao.MedicineDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.crsm.model.Category, com.dts.crsm.dao.CategoryDAO,com.dts.core.util.CoreList"%>
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
.style4 {
	color: #FFFFFF;
	font-weight: bold;
}
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
	
	 <%
	 if(((String)session.getAttribute("role")).equals("customer"))
	 {
	  %>
	 <jsp:include page="customeroptions.jsp"/>
	 <%} %>
	
	</ul>
</div>
<div id="wrapper">
  <div id="col-two1">
	  <div class="boxed">
		<h2 class="title">Welcome to Medical Store System</h2>
      
			<h3 align="right">
	    <a align="right"><script language="JavaScript" type="text/javascript">
      </script></a></h3>
<div class="content">
  <table width="654" border="0">
<tr>
                    <td width="648">
	  <fieldset>
					<legend><span class="style3">View Medicine</span></legend>
  <br />
                    <form name="f" method="post" action="DeleteMedicineAction.jsp">
 
    <table width="637" border="0" align="center" bordercolor="#8692E3">
    
      <tr bgcolor="#509C16">
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList aCoreList = new CoreList();
	      CoreHash cCoreHash = new CoreHash();
	     try{
             int categoryid = 0;
             int medicineid = 0;
             MedicineDAO medicinedao = new MedicineDAO();
             CategoryDAO categorydao = new CategoryDAO();
             aCoreList = medicinedao.listMedicine();
             cCoreHash = (CoreHash)request.getAttribute("");  
             if(!aCoreList.isEmpty())
         	{
        
        %>
        <td width="219"><div align="center" class="style8">Category</div></td>
        <td width="219"><div align="center" class="style8">Medicine Name</div></td>
        <td width="386"><div align="center" class="style8">Description</div></td>
      </tr>
          <%
          	Enumeration enu = aCoreList.elements();
          	Medicine medicine;
          			while (enu.hasMoreElements()) {
          				medicine = (Medicine) enu.nextElement();
          				medicineid = medicine.getMedicineID();
          				categoryid = medicine.getCategoryID();
          				
          %>
      <tr bgcolor="#CEC9FA">
      
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=cCoreHash.get(new Integer(categoryid))%></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7">
        <%=medicine.getMedicineName()%>
        </div></td>
        <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=medicine.getMedicineDesc()%></span></div></td>
      </tr>
      <%
      	}
      		} else {
      %>
         <tr><td height="24" colspan="4"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	
       %>
    </table>
  </form>
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
