<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.dao.MedicineDAO,com.dts.core.util.CoreHash,com.dts.core.util.LoggerManager,java.util.*"%>
<%@  page import="com.dts.crsm.model.Category, com.dts.crsm.dao.CategoryDAO,com.dts.core.util.CoreList"%>
<%@  page import="com.dts.crsm.model.Company, com.dts.crsm.dao.CompanyDAO,com.dts.crsm.model.Stock, com.dts.crsm.dao.StockDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> Medical Store Sysytem </title>
<%--<meta name="Description" content="Event Management Institute India, Event Management Courses In India, | national academy of event management and development ">
<meta name="KeyWords" content="Event Management Institute, Event Managemnet Course, Event Management Courses in India - Asia, Event Management Program, Jobs in Events, Career in Events, Event Management College, certified course in events, International event management course.">

 <link href="images_files/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="images_files/slideshow1.js"></script>--%>
 <script language="javascript" src="images_files/slideshow2.js"></script>
<script language="javascript" src="scripts/moveclock.js"></script>


<style type="text/css">
<!--
body {
	background-color: #B0A7D7;
}
body,td,th {
	font-size: 18px;
}
-->
</style>
 <script language="javascript">

function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>

</head>
</head>
<body leftmargin="0" topmargin="0" onLoad="Delay()" marginheight="0" marginwidth="0">
<table style="border: 1px solid rgb(0, 0, 102);" align="center" bgcolor="#A8B7B6" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody><tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody><tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <td><img src="images_files/medical8.png" width="100%" height="60"></td>
             
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
                <td><img src="images_files/medicine6.jpg" width="100%" height="140"></td>
                <td><img src="images_files/medicine7.jpg" width="100%" height="140"></td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="1" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
               
                <td background="images_files/med2.jpg">
               <jsp:include page="Adminoptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr background="images_files/med2.jpg"> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody> 
                <td valign="top" width="192"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               

                  <p align="center"> <fieldset>
					<legend><span class="style3">View Stock by Category</span></legend>
  <br /> 
  <form id="form1" method="post" action="ViewStockbyCategory.jsp?header=<%=request.getParameter("header")%>" name="stock">
    <table width="200" border="0" align="center">
      <tr>
        <td width="94"><span class="style3"><strong>Category Name</strong></span></td>
        <td width="90"><label>
          <select name="categoryid" id="select" onchange="javascript:if(document.stock.categoryid.value==''){alert('select Any Company');}else{ document.stock.submit();}">
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
		  		        categoryid1 = Integer.parseInt(request.getParameter("categoryid")); 		    
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
        </label></td>
      </tr>
    </table>
    </form>
  <br />
  <%
        if(request.getParameter("categoryid")!=null) 
        {
    %>
      <form name="f" method="post" action="UDStockAction.jsp">
      <input type="hidden" name="page" value="ViewStockbyCategory.jsp"/>
      <input type="hidden" name="type" value="categoryid"/>
      <input type="hidden" name="value" value="<%=request.getParameter("categoryid")%>"/>
    <table width="" border="0" align="center" bordercolor="#8692E3">
    
      <tr bgcolor="#509C16">
      <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	      CoreList inCoreList = new CoreList();
	     // CoreHash bCoreHash = new CoreHash();
	      CoreHash cCoreHash = new CoreHash();
	      CoreHash iCoreHash = new CoreHash();
	      
	     try{
             int categoryid = 0;
             int medicineid = 0;
             MedicineDAO medicinedao = new MedicineDAO();
             CategoryDAO categorydao = new CategoryDAO();
             CompanyDAO companydao = new CompanyDAO();
             StockDAO stockdao = new StockDAO(); 
             
             inCoreList = stockdao.StockByCategory(Integer.parseInt(request.getParameter("categoryid")));
             iCoreHash = medicinedao.listMedicineNames(); 
             cCoreHash = categorydao.listCategoryNames(); 
           //  bCoreHash = branddao.listBrandNames();
             
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
<%--        <td width="103"><div align="center" class="style8">Brand</div></td>--%>
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
          			int companyid = 0;
          			int i=0;
          			while (enu.hasMoreElements()) {
          				stock = (Stock) enu.nextElement();
          				medicineid = stock.getMedicineID();
          				categoryid = stock.getCategoryID();
          				quantity = stock.getQuantity();
						price = stock.getPrice();
						//brandid = inventory.getBrandID();
          		         		
          %>
      <tr bgcolor="#CEC9FA">
      <%
      	String flag = "false";
      				if (header.equals("list")) {
      					flag = "true";
      %>
        <td bgcolor="#C3D7BA"><input name="ch<%=i%>" type="checkbox" id="checkbox2" value="<%=1%>,<%=request.getParameter("categoryid")%>,<%=medicineid%>"/></td> <%
 	System.out.println("this is asfasfasdf"+i);
 	}
 %> 
        
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=cCoreHash.get(new Integer(request.getParameter("categoryid")))%></div></td> 
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
					
		<p align="center">&nbsp;</p></td>
                <td valign="top" width="194">
               
                    
                      <marquee direction="up" align="left" width="100%" height="640">
                              <img src="images_files/medicin1.jpg" width="100%" height="160"><img src="images_files/medicine3.jpg" width="100%" height="160"><img src="images_files/medicine5.jpg" width="100%" height="160"><img src="images_files/medicine4.jpg" width="100%" height="160"><img src="images_files/medicine7.jpg" width="100%" height="160"><img src="images_files/medical9.jpg" width="100%" height="160"><img src="images_files/medical8.png" width="100%" height="160"></td> 
                              </marquee>
                         
                          </tr>
                       </td>
                    </tr>
                    
                  </tbody></table></td>
              </tr>
			  
              <tr> 
                <td colspan="3" bordercolor="#5f6366" valign="top"><div align="center"> 
                 
                 
<!-- SiteSearch Google -->
                </div></td>
              </tr>
              <tr>
                <td colspan="3" bordercolor="#5f6366" align="center" valign="top">
                
<!-- SiteSearch Google -->

</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
		<td>
		<table bgcolor="#D9E7F3" width="100%">
		<tbody><tr bgcolor="##D9E7F3">
          <td bgcolor="#3178B6" width="100%" height="30"><div align="center"><font color="#6F294A" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright © 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>