<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">--%>


<title>Medical Store System </title>
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
               

                  <p align="center"><fieldset>
					<legend><span class="style3">New Category</span></legend>
  <br />
                    <form name="f" method="post" action="addCategoryAction.do">
 
    <table width="259" border="0" align="center" bordercolor="#8692E3">
          
      <tr>
        <td width="107"><span class="style9">Category Name</span></td>
        <td width="142"><label class="textfield">
          <input type="text" name="categoryName" id="textfield" />
        </label></td>
      </tr>
      <tr>
        <td><span class="style9">Description</span></td>
        <td><label>
          <input type="text" name="categoryDesc" id="textfield2" />
        </label></td>
      </tr>
      <tr>
        <td height="7"></td>
        <td></td>
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
  
 
  frmvalidator.addValidation("categoryName","req","Please enter your categoryName");
  frmvalidator.addValidation("categoryName","maxlen=20",	"Max length for categoryName is 20");
  frmvalidator.addValidation("categoryName","alpha"," categoryName Alphabetic chars only");
  
  frmvalidator.addValidation("categoryDesc","req","Please enter your categoryDesc");
    
 </script>
 
					</fieldset>
				
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