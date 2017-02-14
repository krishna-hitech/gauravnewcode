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
					<legend><span class="style3">Sales Details</span></legend>
                    <div align="center"><form id="form2" method="post" action="UserSearch.jsp" name="search" onSubmit="javascript:if(document.search.companyid.value=='' && document.search.categoryid.value==''&& document.search.medicineid.value==''){alert('select Any Search Criteria');}">
                    </form>
                             
              </div>
                    <form name="f" method="post" action="DeleteCompanyAction.jsp">
                      <div align="center" class="style21"></div>
                      <div align="left">
                      <br/>
		        <table width="510" border="0" align="center">
                     <tr>
                    
                    <td width="127" bgcolor="#39552D"><div align="center" class="style19"><span class="style4">Category</span></div></td>
                    <td width="150" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Medicine</strong></div></td>
                    <td width="102" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Quantity</strong></div></td>
                    <td width="109" bgcolor="#39552D"><div align="center" class="style10 style4 style20"><strong>Price</strong></div></td>
                  </tr>
                    <%
    
       try
       {
      		CoreHash aCoreHash = new SalesDAO().listSalesDetails(Integer.parseInt(request.getParameter("salesid")));
      		if(!aCoreHash.isEmpty())
      		{
      		     Enumeration enu = aCoreHash.elements();
      		   Sales aSales = null;
      		     //CoreHash bCoreHash = new CompanyDAO().listCompanyNames();
      		     CoreHash cCoreHash = new CategoryDAO().listCategoryNames();
      		     CoreHash iCoreHash = new MedicineDAO().listMedicineNames();

                 while(enu.hasMoreElements())
      		     {
      		           aSales = (Sales)enu.nextElement();
              %>     
                  <tr>
                    
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=cCoreHash.get(new Integer(aSales.getCategoryid()))%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center"><span class="style14"><%=iCoreHash.get(new Integer(aSales.getMedicineid()))%></span></div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14">
                      <div align="center"><%=(aSales.getQuantity())%></div>
                    </div></td>
                    <td bgcolor="#DDEAD7"><div align="center" class="style14">
                      <div align="center"><%=(aSales.getPrice())%></div>
                    </div></td>
                  </tr>
                  <%} }}
      	catch(Exception e)
      	{
      	   LoggerManager.writeLogWarning(e);
      	} %>
          </table>
                <p align="center">
                  <label>
                  <input type="button" name="button" id="button" value="Back" onclick="javascript:history.back(-1);"/>
                  </label>
                </p>
                      </div>
               </form>
					</fieldset>
				
			</td>
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