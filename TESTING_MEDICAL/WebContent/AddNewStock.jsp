<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.model.Category,com.dts.crsm.dao.MedicineDAO,com.dts.crsm.dao.CategoryDAO,com.dts.core.util.CoreHash,java.util.*"%>
<%@ page import="com.dts.core.util.LoggerManager,com.dts.crsm.dao.CompanyDAO, com.dts.crsm.dao.StockDAO" %>
<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.model.Category,com.dts.crsm.dao.CategoryDAO,com.dts.crsm.dao.MedicineDAO,com.dts.core.util.LoggerManager,com.dts.core.util.CoreHash,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> MEDICAL STORE SYSTEM  </title>
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
               <jsp:include page="Adminoptions.jsp"/>
				</td>
              </tr>
            </tbody></table></td>
        </tr>
        <tr > 
          <td background="images_files/sitebackground.jpg"><table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody> 
                <td valign="top" width="120"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <marquee direction="down" align="left" width="100%" height="605">
                              <img src="images_files/mq1.jpg" width="100%" height="160"><img src="images_files/mq2.jpg" width="100%" height="160"><img src="images_files/mq3.jpg" width="100%" height="160"><img src="images_files/mq4.jpg" width="100%" height="160"><img src="images_files/mq5.jpg" width="100%" height="160"><img src="images_files/mq6.jpg" width="100%" height="160"><img src="images_files/mq7.jpg" width="100%" height="160"><img src="images_files/mq8.jpg" width="100%" height="160"><img src="images_files/mq9.jpg" width="100%" height="160"><img src="images_files/mq10.jpg" width="100%" height="160"><img src="images_files/mq11.jpg" width="100%" height="160"><img src="images_files/mq12.jpg" width="100%" height="160"><img src="images_files/mq13.jpg" width="100%" height="160"><img src="images_files/mq14.jpg" width="100%" height="160"><img src="images_files/mq15.png" width="100%" height="160"><img src="images_files/mq16.jpg" width="100%" height="160"><img src="images_files/mq17.jpg" width="100%" height="160"><img src="images_files/mq18.jpg" width="100%" height="160"></td> 
                              </marquee>
                         
                  </table></td>
                <td valign="top"  width="750" > 
                 <H1 align="center"><font color="Blue">Medical Store System </font></H1>  <p align="center">&nbsp;</p>
               

                  <p align="center"><fieldset>
					<legend><span class="style3">Add New Stock</span></legend>
  <br />
                    <form  method="post" action="AddNewStock.do" name="stock">
 
    <table width="259" border="0" align="center" bordercolor="#8692E3">
     
      <tr>
        <td width="107"><span class="style9">Category</span></td>
        <td width="142"><label class="textfield">
          <select name="categoryID" id="textfield"  onchange="javascript:if(document.stock.categoryID.value==''){alert('select Any Category');}else{location.href='AddNewStock.jsp?categoryid='+document.stock.categoryID.value;}">
             <option>--select--</option>
            <%
                try
           		 {
                CoreHash aCoreHash = new CoreHash();
                Category aCategory = new Category();
                aCoreHash = new CategoryDAO().listCategories(); 
                 Enumeration enu = aCoreHash.elements();
                 String select = "";
                int categoryid;
                while(enu.hasMoreElements())
                {
                   aCategory = (Category)enu.nextElement();
                   categoryid=aCategory.getCategoryID();
                   select = "";
                   if(request.getParameter("categoryid")!=null)
                   {
                   		if(categoryid ==Integer.parseInt(request.getParameter("categoryid")))
                   		{
                       		select = "selected";
                   		}
                   }	
                 %>
               
                   <option value="<%=aCategory.getCategoryID()%>" <%=select%>><%=aCategory.getCategoryName()%></option>
                   
                <% }
               
                 %>
          </select>
        </label></td>
      </tr>    
       <tr>
        <td width="107"><span class="style9">Company</span></td>
        <td width="142"><label class="textfield">
         <select name="CompanyID" id="select2">
             <option>--select--</option>
          <%
          CoreHash bCoreHash = new CompanyDAO().listCompanyNames();
          enu = bCoreHash.keys();
 		   int companyid1 = 0;
 		   int companyid = 0;
		  		 while(enu.hasMoreElements())
	                {
	                  companyid = Integer.parseInt(enu.nextElement().toString());
	                 %>
	                   <option value="<%=companyid%>"><%=bCoreHash.get(new Integer(companyid))%></option>
	                   
	                <% }
		  %>		  
        </label></td>
      </tr>
      <tr>
        <td class="style9">Medicine</td>
        <td><label>
          <select name="medicineID" id="select2">
           <option>--select--</option>
            <%
            if( request.getParameter("categoryid")!=null)
            {
                 aCoreHash = new CoreHash();
                 aCategory = new Category();
                aCoreHash = new StockDAO().listMedicinebyCompanyCategory(request.getParameter("categoryid")); 
                enu = aCoreHash.keys();
                int medicineid = 0;
                while(enu.hasMoreElements())
                {
                  medicineid = Integer.parseInt(enu.nextElement().toString());
                 %>
                   <option value="<%=medicineid%>"><%=aCoreHash.get(new Integer(medicineid))%></option>
                   
                <% }
                }
                }
                catch(Exception e)
                {
                    LoggerManager.writeLogWarning(e);
                }%>
          </select>
        </label></td>
      </tr>
   
      <tr>
        <td width="107"><span class="style9">Quantity</span></td>
        <td width="142"><label class="textfield">
          <input name="quantity" type="text" id="textfield" value="0" />
        </label></td>
      </tr>
      <tr>
        <td><span class="style9">Price/medicine</span></td>
        <td><label>
          <input name="price" type="text" id="textfield2" value="0" />
        </label></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
         
          <input type="submit" name="button" id="button" value="Add"/>
          &nbsp;</div></td>
      </tr>
    </table>
  </form>
  <script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("f");
  
 
  
   frmvalidator.addValidation("categoryID","dontselect=0");
   
   
   
     frmvalidator.addValidation("medicineID","dontselect=0");
  
  frmvalidator.addValidation("quantity","req","Please enter quantity");
  
   frmvalidator.addValidation("quantity","age");
  
   
   frmvalidator.addValidation("price","req","Please enter price");
  
   frmvalidator.addValidation("price","age");
    
 </script>
 
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
          <td bgcolor="#3178B6" width="100%" height="8"><div align="center"><font color="#6F294A" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright � 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>