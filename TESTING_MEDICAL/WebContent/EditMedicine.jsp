<%@ page import="com.dts.crsm.model.Medicine,com.dts.crsm.model.Category,com.dts.crsm.dao.CategoryDAO,com.dts.crsm.dao.MedicineDAO,com.dts.core.util.LoggerManager,com.dts.core.util.CoreHash,java.util.*"%>

<%@page import="com.dts.core.util.LoggerManager"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title> Medical Store Sysytem  </title>
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
               

                  <p align="center">  <fieldset>
					<legend><span class="style3">Edit Medicine</span></legend>
  <br />
  <%
     int medicineid = Integer.parseInt(request.getParameter("id"));
     try
     {
          Medicine aMedicine = new MedicineDAO().editMedicine(medicineid); 
  
   %>
                    <form name="f" method="post" action="editMedicineAction.do">
               <input type="hidden" name="itemID" value="<%=medicineid%>"/>
    <table width="244" border="0" align="center" bordercolor="#8692E3">
       <tr>
        <td width="107"><span class="style9">Category</span></td>
        <td width="142"><label class="textfield">
          <select name="categoryID" id="textfield" >
            <%
                CoreHash aCoreHash = new CoreHash();
                Category aCategory = new Category();
                aCoreHash = new CategoryDAO().listCategories();
                Enumeration enu = aCoreHash.elements();
                int categoryid = 0;
                while(enu.hasMoreElements())
                {
                   aCategory = (Category)enu.nextElement();
                   categoryid = aCategory.getCategoryID();
                   String select="";
                   if(categoryid == aMedicine.getCategoryID())
                      select = "selected";
                 %>
                   <option value="<%=categoryid%>" <%=select%>><%=aCategory.getCategoryName()%></option>
                   
                <% }
            
             %>
          </select>
        </label></td>
      </tr>       
      <tr>
        <td width="89"><span class="style9">Medicine Name</span></td>
        <td width="145"><label class="textfield">
          <input type="text" name="medicineName" id="textfield" value="<%=aMedicine.getMedicineName()%>"/>
        </label></td>
      </tr>
      <tr>
        <td><span class="style9">Description</span></td>
        <td><label>
          <input type="text" name="medicineDesc" id="textfield2"  value="<%=aMedicine.getMedicineDesc()%>"/>
        </label></td>
      </tr>
      <tr>
        <td height="7"></td>
        <td></td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
         
          <input type="submit" name="button" id="button" value="Update"/>
          &nbsp;</div></td>
      </tr>
    </table>
  </form>
  <script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("f");
  
 
  frmvalidator.addValidation("medicineName","req","Please enter your medicineName");
  frmvalidator.addValidation("medicineName","maxlen=20",	"Max length for medicineName is 20");
  frmvalidator.addValidation("medicineName","alpha"," medicineName Alphabetic chars only");
  
  frmvalidator.addValidation("medicineDesc","req","Please enter your description");
  
   frmvalidator.addValidation("categoryID","dontselect=0");
   
  
     
 </script>
 
  <%}
  catch(Exception e)
  {
     LoggerManager.writeLogWarning(e);
  }
   %>
					</fieldset></td>
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
          <td bgcolor="#3178B6" width="100%" height="30"><div align="center"><font color="#6F294A" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyright � 2017 TCS.com, Inc. All right reserved.</strong></font></div></td>
         
        </tr>
       
      </tbody></table>
</td>
  </tr>
</tbody></table>



</body></html>