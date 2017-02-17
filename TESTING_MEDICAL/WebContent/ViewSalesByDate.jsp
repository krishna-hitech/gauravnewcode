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
	background-color: #996666;
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
<script language="javascript" src="scripts/general.js"></script>
<script language="javascript" src="scripts/ts_picker.js"></script>
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
                <td valign="top" width="120"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <marquee direction="up" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
                              </marquee>
                         
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               
                  <p align="center">  <fieldset>
					<legend><span class="style3">Placed Orders</span></legend>
                    
                    <form name="bydate" method="post" action="ViewSalesByDate.jsp">
                      <div align="center">
                      <span class="style3"><strong>Sold Date</strong></span> <input type="text" name="salesdate" />
                            <a href="javascript:show_calendar('document.bydate.salesdate', 'document.bydate.salesdate.value');"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a>&nbsp;<input type="submit" value="get Details"/></div>
                        <%
        try
        {
            
        	if(request.getParameter("salesdate")!=null)
        	{
      			String salesdate = DateWrapper.parseDate(request.getParameter("salesdate"));
      			System.out.println("date"+salesdate);
      			CoreHash aCoreHash = new SalesDAO().listSales(salesdate);
      			if(!aCoreHash.isEmpty())
      			{
      			    
      		    	 Enumeration enu = aCoreHash.elements();
      		    	Sales aSales = null;   
       %>
                        
                      <div align="left">
                      <br/>
		        <table width="610" border="0" align="center">
                     <tr>
                    <td width="132" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Sales ID</span></div></td>
                    <td width="162" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Sales Date</span></div></td>
                    <td width="176" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Total Amount</strong></div></td>
                    <td width="122" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Status</strong></div></td>
                    </tr>
             <%
			     double price = 0;
                 while(enu.hasMoreElements())
      		     {
      		           aSales = (Sales)enu.nextElement(); 
					   price = aSales.getPrice();
              %>     
                  <tr>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><a href="ViewSalesDetails.jsp?Salesid=<%=(aSales.getSalesID())%>"><%=(aSales.getSalesID())%></a></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=DateWrapper.parseDate(aSales.getSalesDate1())%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=(aSales.getTotalamount())%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14"><%=(aSales.getStatus())%></div></td>
                    </tr>
                  <%}
      		%>
      	  </table> 
             </div>
             <%}else{ %>
                      <div align="center" class="style21">No Orders Placed</div>
                      <%} }}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
          
        
               </form>
					</fieldset>
				
			</td>
                 <p align="center">&nbsp;</p></td>
                <td valign="top" width="120">
               
                    
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
          <td bgcolor="#3178B6" width="100%" height="8"><div align="center"><font color="#6F294A" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright © 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>