
<%@ page import="com.dts.crsm.model.Company,com.dts.crsm.dao.CompanyDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.crsm.dao.*,com.dts.crsm.model.*,com.dts.core.util.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> Medical Store System </title>
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
<body leftmargin="0" topmargin="0" onLoad="Delay()" marginheight="0" marginwidth="0">
<table style="border: 1px solid rgb(0, 0, 102);" align="center" bgcolor="#A8B7B6" border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
                <td><img src="images_files/banner_01.jpg" width="100%" height="130"></td>
                <td><img src="images_files/banner_02.jpg" width="100%" height="130"></td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
          <td><table border="1" cellpadding="0" cellspacing="0" width="100%">
              <tbody><tr> 
               
                <td background="images_files/optionsbg.JPG">
               <jsp:include page="customeroptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr > 
          <td background="images_files/sitebackground.jpg"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody> 
                <td valign="top" width="192"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <marquee direction="up" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
                              </marquee>
                         
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               
                  <p align="center"><form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.categoryid.value==''&& document.search.medicineid.value==''){alert('select Any Search Criteria');}">
    <table width="470" border="0">
  <tr>
    <td width="41" height="40">
      <div align="left" class="style3"></div>   </td>
    <td width="104"><div align="left">
    
    </div></td>
  
    <td width="75" height="40">
      <div align="left" class="style3"><strong>Category</strong></div>   </td>
    <td width="96"><div align="left">
      <select name="categoryid" id="select" onchange="javascript: location.href='UserSearch.jsp?categoryid='+document.search.categoryid.value">
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
 
    <td width="33" height="40">
      <div align="left"  class="style3"><strong>Medicine</strong></div>    </td>
    <td width="95"><div align="left">
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
    <td height="34" colspan="6">        
      <div align="center">
        <input id="inputsubmit2" type="submit" name="inputsubmit2" value="Search" class="button" />        
        </div></td>
    </tr>
</table>

	
					</form> <form name="f" method="post" action="DeleteCompanyAction.jsp">
                      <div align="center" class="style21">
                      
                      <%if(request.getParameter("status")!=null)
					     {%>
                           <%=request.getParameter("status")%>
						 <%}%>
				                      </div>
                      <div align="left">
		        <table width="610" border="0" align="center">
                  <tr>
                    <td colspan="2">
                    <span class="style3 style5"><strong>Search Results</strong></span> <span class="style3 style5"><strong>:</strong></span></td>
                    <td>&nbsp;</td>
                    <td colspan="2">
                    
                      <div align="right" class="style3"><strong>
                      <%
					  int count = 0;
					  if(session.getAttribute("nci")!=null)
					  {
					      count = ((Integer)session.getAttribute("nci")).intValue();
					  }
					  %>
                      <%=count%> Medicine(s) are in Cart 
                      
                      </strong></div></td>
                    </tr>
                     <tr>
                    <td width="127" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Category</span></div></td>
                    <td width="150" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Medicine</strong></div></td>
                    <td width="102" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Price</strong></div></td>
                    <td width="109" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Add toCart</strong></div></td>
                  </tr>
                    <%
    
       try
       {
      		int categoryid = 0;
      		if(!request.getParameter("categoryid").equals("--Select--"))
      		      categoryid = Integer.parseInt(request.getParameter("categoryid"));
      		      
      		    
      		int medicineid = 0;
      		if(!request.getParameter("medicineid").equals("--Select--"))
      		      medicineid = Integer.parseInt(request.getParameter("medicineid"));
      		
      		CoreHash aCoreHash = new StockDAO().searchStock(categoryid, medicineid);
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		     Stock aStock = null;
      		     
      		     CoreHash cCoreHash = new CategoryDAO().listCategoryNames();
      		     CoreHash iCoreHash = new MedicineDAO().listMedicineNames();
      		         
       %>
                      
                 
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aStock = (Stock)enu.nextElement(); 
					   price = aStock.getPrice();
              %>     
                  <tr>
                     <td bgcolor="#DDEAD7"><span class="style14"><%=cCoreHash.get(new Integer(aStock.getCategoryID()))%></span></td>
                    <td bgcolor="#DDEAD7"><span class="style14"><%=iCoreHash.get(new Integer(aStock.getMedicineID()))%></span></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14"><%=price%></div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style9"><a href="AddtoCart.jsp?categoryid=<%=aStock.getCategoryID() %>&medicineid=<%=aStock.getMedicineID() %>"><img src="images/redarrow3.gif"/></a></div></td>
                  </tr>
                  <%} }}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
          </table>
        </div>
               </form>
					
			
              </td>
             <p align="center">&nbsp;</p></td>
                <td valign="top" width="194">
               
                    
                      <marquee direction="down" BEHAVIOR="ALTERNATE" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
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
                <td colspan="3" bordercolor="#5f6366" align="center" valign="top" img src="images (2).png">
                
<!-- SiteSearch Google -->

</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr> 
		<td>
		<table bgcolor="#D9E7F3" width="100%">
		<tbody><tr bgcolor="##D9E7F3">
          <td bgcolor="#3178B6" width="100%" height="8"><div align="center"><font color="#6F294A" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright � 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>